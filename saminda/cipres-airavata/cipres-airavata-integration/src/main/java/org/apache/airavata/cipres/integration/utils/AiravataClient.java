package org.apache.airavata.cipres.integration.utils;

import java.io.File;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.Map;

import org.apache.airavata.client.AiravataAPIFactory;
import org.apache.airavata.client.api.AiravataAPI;
import org.apache.airavata.client.api.exception.AiravataAPIInvocationException;
import org.apache.airavata.client.impl.PasswordCallBackImpl;
import org.ngbw.sdk.api.tool.ToolResource;

public class AiravataClient {
	private ToolResource toolResource;
	private AiravataAPI api;

	public AiravataClient(ToolResource toolResource) {
		this.toolResource=toolResource;
	}
	
	private AiravataAPI getAPI(){
		if (api==null){
			try {
				api=AiravataAPIFactory.getAPI(new URI("http://localhost:8080/airavata/services/registry"),"default", "admin",new PasswordCallBackImpl("admin", "admin"));
			} catch (AiravataAPIInvocationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (URISyntaxException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return api;
	}
	
	public String submitWorkflowTask(String workflowName, File inputFile, Map<String,String> parameters){
		return null;
	}
}
