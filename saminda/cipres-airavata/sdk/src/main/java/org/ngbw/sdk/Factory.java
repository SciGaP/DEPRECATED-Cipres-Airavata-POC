package org.ngbw.sdk;

import org.ngbw.sdk.core.configuration.ServiceFactory;
import org.ngbw.sdk.database.Task;
import org.ngbw.sdk.tool.TaskInitiate;
import org.ngbw.sdk.tool.TaskInitiateWF;
import org.ngbw.sdk.tool.TaskMonitor;
import org.ngbw.sdk.tool.TaskMonitorWF;
import org.ngbw.sdk.tool.WorkingDirectory;
import org.ngbw.sdk.tool.WorkingDirectoryWF;

public class Factory {
	
	public static Workbench getWorkbench(){
		return WorkbenchCIPRES.getInstance();
	}
	
	public static TaskInitiate getTaskInitiate(ServiceFactory serviceFactory){
		return new TaskInitiateWF(serviceFactory);
	}
	
	public static TaskMonitor getTaskMonitor(){
		return new TaskMonitorWF();
	}
	
	public static WorkingDirectory getWorkingDirectory(ServiceFactory serviceFactory, Task task){
		return new WorkingDirectoryWF(serviceFactory, task);
	}
}
