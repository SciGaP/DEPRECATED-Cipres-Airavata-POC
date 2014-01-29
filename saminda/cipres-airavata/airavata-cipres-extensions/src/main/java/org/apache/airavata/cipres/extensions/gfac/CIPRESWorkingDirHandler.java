package org.apache.airavata.cipres.extensions.gfac;

import java.util.Map;

import org.apache.airavata.client.AiravataClient;
import org.apache.airavata.common.exception.AiravataConfigurationException;
import org.apache.airavata.commons.gfac.type.ApplicationDescription;
import org.apache.airavata.gfac.Constants;
import org.apache.airavata.gfac.GFacException;
import org.apache.airavata.gfac.context.JobExecutionContext;
import org.apache.airavata.gfac.handler.GFacHandler;
import org.apache.airavata.gfac.handler.GFacHandlerException;
import org.apache.airavata.registry.api.exception.RegistryException;
import org.apache.airavata.schemas.gfac.ApplicationDeploymentDescriptionType;


public class CIPRESWorkingDirHandler implements GFacHandler {

	@Override
	public void initProperties(Map<String, String> arg0)
			throws GFacHandlerException, GFacException {

	}

	@Override
	public void invoke(JobExecutionContext jec) throws GFacHandlerException,
			GFacException {
		String key=(String) jec.getProperty(Constants.PROP_TOPIC)+"/staticDir";
		try {
			String staticDir=(String) ((AiravataClient)jec.getGFacConfiguration().getAiravataAPI()).getRegistryClient().getConfiguration(key);
			ApplicationDescription app = jec.getApplicationContext().getApplicationDeploymentDescription();
	        ApplicationDeploymentDescriptionType appDesc = app.getType();
	        appDesc.setStaticWorkingDirectory(staticDir);
		} catch (AiravataConfigurationException e) {
			e.printStackTrace();
		} catch (RegistryException e) {
			e.printStackTrace();
		}
	}

}
