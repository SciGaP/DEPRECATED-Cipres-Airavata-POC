package org.ngbw.examples;

import java.util.concurrent.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.ngbw.sdk.UserAuthenticationException;
import org.ngbw.sdk.Workbench;
import org.ngbw.sdk.WorkbenchSession;
import org.ngbw.sdk.common.util.ValidationResult;
import org.ngbw.sdk.core.shared.UserRole;
import org.ngbw.sdk.database.RunningTask;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.NDC;
import java.util.Vector;
import org.ngbw.sdk.database.ConnectionManager;
import org.ngbw.sdk.database.DriverConnectionSource;
import org.ngbw.sdk.database.User;
import org.ngbw.sdk.jobs.JobNotFoundException;
import org.ngbw.sdk.jobs.JobStatus;


/*
	Todo: need a method to get all of a user's tasks and cancel them, that we can
	run before calling user.deleteData().
*/
public class LoadTest1 extends Thread
{
	private static final Log log = LogFactory.getLog(LoadTest1.class.getName());
	private static String usage = 
		"\nUsage: the following system properties are required:\n" +
		"\tthreads=n\n" +
		"\tuser=username\n" +
		"\tpass=password\n" +
		"\tjobs=jobspec1:jobspec2:....\n" +
		"For example: " +
		"sdkrun -Dthreads=1 -Duser=t1 -Dpass=t1 -Djobs=examples/new_tooltest/CLUSTALW:examples/new_tooltest/READSEQ";
		
	private static class JobInfo 
	{
		public String jobhandle;
		public boolean isFinished;
		public boolean isFailed;
		public String jobspec;
	}
	private static Workbench wb = null;
	private static User user = null;
	private static String[] jobspecArray = null;

	/*
		Properties to set on command line are:
			-Dthreads=n
			-Duser=username
			-Dpass=password
			-Djobs=<jobspec1>:<jobspec2>:...
				where <jobspec> is the path of a job specification directory (See TestJob.java).
		
			Starts n threads, each of which submits all of the jobs specified and waits for them to complete.
			Runs the jobs under the account specified by username/password.  Creates the account if it doesn't exist. 
			Deletes all jobs and data in the account before it starts the test, so be careful which account you specify!

			Returns 0 if all the specified jobs can be submitted and finish successfully.

			When running this via sdkrun, you must specify system properties with -D argument,
			prior to the classname: eg: sdkrun -Dthreads=1 -Duser=xxx ... org.ngbw.examples.LoadTest1
	*/
	public static void main(String[] args) throws Exception
	{
		String username = null;
		String password = null;
		int threadCount = 1; 
		String tmp;

		// Argument processing
		try
		{
			tmp = System.getProperty("threads");
			threadCount = Integer.parseInt(tmp);
			jobspecArray = System.getProperty("jobs").split(":");
			if (threadCount < 1)
			{
				throw new Exception("System property 'threads' must be >= 1");
			}
			if (jobspecArray.length < 1)
			{
				throw new Exception("System property 'jobs' must contain at least one job specification directory");
			}
			username = System.getProperty("user");
			password = System.getProperty("pass");
			if (username == null || password == null)
			{
				throw new Exception("System properties 'user' and or 'pass' are missing.");
			}
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
			System.out.println(usage);
			System.exit(-1);
		}

		wb = Workbench.getInstance();
		int numberOfFailedJobs = 0;
		try
		{
			user = getAccount(username, password);

			LoadTest1[] myThreads = new LoadTest1[threadCount];
			for (int i = 0; i < threadCount; i++)
			{
				LoadTest1 t = new LoadTest1(i);
				t.start();
				myThreads[i] = t;
			}
			// wait for each thread in turn.
			for (LoadTest1 t : myThreads)
			{
				t.join(); // can throw InterruptedException
				numberOfFailedJobs += t.failedCount;
			}
			log.debug("Failed Job Count is: " + numberOfFailedJobs);
			System.exit(numberOfFailedJobs);
		}
		catch(InterruptedException ie)
		{
			log.error("Main thread got interrupted, should cancel all the jobs we started?");
			System.exit(-2);	
		}
		// Todo: if all are done return 0, otherwise return the number that failed.
		finally
		{
			;
			// todo: user.deleteData() or leave it for debugging?
		}
	}

	

	int tid;
	String prefix;
	int failedCount = 0;

	private LoadTest1(int tid)
	{
		this.tid = tid;	
		this.prefix = "[" + tid + "]";
	}

	public void run()  
	{
		ArrayList<JobInfo> myJobs = new ArrayList<JobInfo>();
		for (String jobspec : jobspecArray)
		{
			try
			{
				String jobhandle = TestJob.runJob(user, jobspec);
				JobInfo info = new JobInfo();
				info.jobhandle = jobhandle;
				info.jobspec = jobspec;
				info.isFinished = false;
				info.isFailed = false;
				myJobs.add(info);
				log.debug(prefix + "Submitted: " + jobhandle);
			}
			catch(Exception e)
			{
				log.error(prefix + "Error submitting: " + jobspec, e);
			}
		}
		log.debug(prefix + "Submitted " + myJobs.size() + " jobs. WAITING FOR COMPLETION");
		boolean needToWait;
		try
		{
			do
			{
				needToWait = false;
				for (JobInfo info : myJobs)
				{
					JobStatus jobStatus = null;
					if (info.isFinished == false && info.isFailed == false)
					{
						try
						{
							jobStatus = new JobStatus(info.jobhandle, user);
						}
						// This will happen if another process cancels/deletes the task while we're waiting.
						catch(JobNotFoundException nfe)
						{
							info.isFailed = true;
							failedCount++;
							log.debug(prefix + "Not Found: " + info.jobhandle);
							continue;
						}
						catch(Exception e)
						{
							log.error(prefix + "Error trying to get status for " + info.jobhandle, e);
							needToWait = true;
							break; // don't check other jobs, just sleep and hope it's a transient error that goes away.
						}
						if (jobStatus.isTerminalStage() == false)
						{
							needToWait = true;
						} else if (jobStatus.isOk())
						{
							info.isFinished = true;
							log.debug(prefix + "Finished: " + info.jobhandle);
						} else
						{
							info.isFailed = true;
							failedCount++;
							log.debug(prefix + "Failed: " + info.jobhandle);
						}
					}
				}
				// sleep for a minute before checking status again
				if (needToWait == true)
				{
					Thread.sleep(1000 * 60); //can throw InterruptedException
				}
			} while (needToWait == true);
			log.debug(prefix + "Finished waiting.");
		}
		catch (InterruptedException ie)
		{
			Thread.currentThread().interrupt();
		}
	}



	/*
		Account management code
	*/
	private static User getAccount(String username, String password) throws Exception
	{
		WorkbenchSession session = null;
		try
		{
			session = wb.getSession(username, password);
			log.debug("Running as existing user:" + username);
		}
		catch (UserAuthenticationException e)
		{
			session = createAccount(username, password);
			log.debug("Created a new account for:" + username);
		}
		User user = session.getUser();
		return user;
	}

	private static WorkbenchSession createAccount(String username, String password) throws Exception
    {
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setEmail(username + "@foo.com");
        user.setFirstName(username);
        user.setLastName(username);
        user.setRole(UserRole.TESTER);
        ValidationResult result = wb.registerNewUser(user);
        if (result.isValid())
        {
            return wb.getSession(username, password);
        }
        throw new Exception(result.getErrors().get(0));
    }
		
}
	
