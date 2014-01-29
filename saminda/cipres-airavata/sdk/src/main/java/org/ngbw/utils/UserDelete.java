/*
 * UserDelete.java
 */
package org.ngbw.utils;


import org.ngbw.sdk.database.ConnectionManager;
import org.ngbw.sdk.database.DriverConnectionSource;
import org.ngbw.sdk.database.User;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;


/**
 *
 *
 */
public class UserDelete 
{
	private static final Log log = LogFactory.getLog(UserDelete.class.getName());

	public static void main(String[] args)
	{
		try {
			if (args.length < 2)
				throw new Exception("usage: UserDelete username account|data");

			log.debug("Establishing database connection");
			ConnectionManager.setConnectionSource();
			log.debug("Done establishing database connection.");

			User user = User.findUserByUsername(args[0]);
			if (user == null)
				throw new Exception("Couldn't find a user with username " + args[0]);

			String action = args[1];


			if (action.equals("account"))
			{
				user.delete();
			} else if (action.equals("data"))
			{
				user.deleteData();
				log.debug("deleted tasks and data for user " + args[0]);
			} 
		}
		catch (Exception err) {
			System.out.println(err.toString());
			err.printStackTrace(System.err);

			System.exit(-1);
		}
	}
}
