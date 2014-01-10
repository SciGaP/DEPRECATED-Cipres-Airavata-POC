/**
 * 
 */
package org.ngbw.sdk.api.tool;


import java.util.Set;

import org.ngbw.sdk.api.core.CoreRegistryAware;


/**
 * 
 * <br />
 * @author R. Hannes Niedner
 *
 */
public interface ToolRegistry extends CoreRegistryAware {

	public String getDefaultGroup();
	public void setDefaultGroup(String group);

	/**
	 * Return a set of identifiers for all available tools.
	 * @return Set of Strings
	 */
	public Set<String> getToolIds();

	/*
		Return set of ids for all tools that don't have their inactive attribute set to true
	*/
	public Set<String> getActiveToolIds();

	/**
	 * The DatasetService implementation will work with the
	 * DatasetConfig implementation instances generated by 
	 * this method.
	 * The method either returns the existing ToolConfig
	 * instance for the submitted Tool or a new ToolConfig
	 * instance if this Tool was not registered before.
	 * 
	 * @param toolId
	 * @return toolConfig
	 */
	public ToolConfig getToolConfig(String toolId);
	
	/**
	 * @param toolResourceId
	 * @return toolResource
	 */
	public ToolResource getToolResource(String toolResourceId);

	/**
	 * @param toolResourceId
	 * @param toolResource
	 */
	public void registerToolResource(String toolResourceId, ToolResource toolResource);
	
	/**
	 * Register a new ToolConfig or update the checked out
	 * ToolConfig instance
	 * 
	 * @param toolConfig
	 */
	public void registerTool(ToolConfig toolConfig);
	
	/**
	 * @param toolId
	 * @return toolGroup
	 */
	public String getToolGroup(String toolId);
	
	/**
	 * @param toolId
	 * @param toolGroup
	 */
	public void assignToGroup(String toolId, String toolGroup);
	
	/**
	 * @param toolGroup
	 * @param toolResource
	 */
	public void groupSet(String toolGroup, ToolResource toolResource);
	
	/**
	 * @param toolGroup
	 * @param commandRenderer
	 */
	public void groupSet(String toolGroup, Class<CommandRenderer> commandRenderer);
}