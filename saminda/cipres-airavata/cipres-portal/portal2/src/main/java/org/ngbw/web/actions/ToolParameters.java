package org.ngbw.web.actions;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;
import org.apache.log4j.Logger;

import org.apache.struts2.interceptor.validation.SkipValidation;
import org.ngbw.sdk.WorkbenchSession;
import org.ngbw.sdk.api.tool.ParameterValidator;
import org.ngbw.sdk.database.SourceDocument;
import org.ngbw.sdk.database.Task;
import org.ngbw.sdk.database.TaskInputSourceDocument;
import org.ngbw.sdk.database.UserDataItem;
import org.ngbw.web.actions.CreateTask;

@SuppressWarnings("serial")
public abstract class ToolParameters extends CreateTask
{
	private static final Logger logger = Logger.getLogger(ToolParameters.class.getName());
	/*================================================================
	 * Properties
	 *================================================================*/
	// all parameters will be stored in a single generic map
	private Map<String, String> toolParameters;
	private Map<String, List<TaskInputSourceDocument>> inputDataItems;
	
	/*================================================================
	 * Constructors
	 *================================================================*/
	public ToolParameters() {
		super();
		setTab(SET_PARAMETERS);
	}
	
	/*================================================================
	 * Action methods
	 *================================================================*/
	@SuppressWarnings("unchecked")
	public String execute() {
		// validate parameters
		boolean error = false;
		Task task = getCurrentTask();
		ParameterValidator validator = getParameterValidator(task.getToolId());
		Map<String, String> errors = validator.validateParameters(getToolParameters());
		if (errors != null && errors.size() > 0) {
			for (String parameter : errors.keySet())
				addActionError(errors.get(parameter));
			error = true;
		}
		errors = validator.validateInput(getInputDataItems());
		if (errors != null && errors.size() > 0) {
			for (String parameter : errors.keySet())
				addActionError(errors.get(parameter));
			error = true;
		}
		
		// return to input page if validation failed
		if (error) {
			setTab(SET_PARAMETERS);
			return INPUT;
		}
		
		// set parameters
		setParameters(task, cleanParameters());
		setInputMap(cleanInput());
		List<TaskInputSourceDocument> input = getInput();
		if (input != null)
			setInput(input);
		
		// report number of parameters successfully set
		int parameterCount = getParameterCount();
		String message = parameterCount + " parameter";
		if (parameterCount != 1)
			message += "s";
		message += " successfully set to current task.";
		reportUserMessage(message);
		setTab(TASK_SUMMARY);
		return SUCCESS;
	}
	
	@SkipValidation
	public String input() {
		if (hasParameters()) {
			try {
				setToolParameters(getCurrentTask().toolParameters());
			} catch (Throwable error) {
				reportError(error, "Error retrieving parameters from current task");
			}
			setInputDataItems(getInputMap());
			Map<String, List<TaskInputSourceDocument>> inputDataItems =
				getInputDataItems();
			if (inputDataItems != null && inputDataItems.size() > 0)
				for (String parameter : inputDataItems.keySet())
					verifyInputDataItem(parameter);
		} else reset();
		return INPUT;
	}
	
	@SkipValidation
	public String cancel() {
		clearErrorsAndMessages();
		addActionMessage("Task parameters not saved.");
		setTab(TASK_SUMMARY);
		return INPUT;
	}

	@SkipValidation
	public String resetPage() {
		reset();
		setTab(SET_PARAMETERS);
		return INPUT;
    }
	
	/*================================================================
	 * Tool parameter property accessor methods
	 *================================================================*/
	public Map<String, String> getToolParameters() {
		if (toolParameters == null)
			resetParameters();
		return toolParameters;
	}
	
	public void setToolParameters(Map<String, String> parameters) {
		if (parameters != null)
			this.toolParameters = parameters;
		else resetParameters();
	}
	
	public Map<String, List<TaskInputSourceDocument>> getInputDataItems() {
		if (inputDataItems == null)
			resetInput();
		return inputDataItems;
	}
	
	public void setInputDataItems(Map<String, List<TaskInputSourceDocument>> inputDataItems) {
		if (inputDataItems != null)
			this.inputDataItems = inputDataItems;
		else resetInput();
	}
	
	/*
	 * This implementation assumes that each "non-main" input parameter has only one
	 * SourceDocument in its map, and this value is keyed by the database ID of the
	 * single UserDataItem that spawned it.
	 * 
	 * If this UserDataItem no longer exists in the database for whatever reason,
	 * then searching for it by the ID map key will return null, and this will indicate
	 * that it is no longer attached to a persisted data item.
	 */
	public Long getInputDataItemId(String parameter) {
		try {
			Map<String, List<TaskInputSourceDocument>> inputDataItems = getInputDataItems();
			if (parameter == null)
				throw new NullPointerException("Parameter key is null.");
			else if (inputDataItems == null)
				throw new NullPointerException("No input parameter map is present.");
			else {
				List<TaskInputSourceDocument> parameterData = inputDataItems.get(parameter);
				if (parameterData == null || parameterData.size() < 1)
					return null;
				else {
					String id = parameterData.get(0).getName();
					return Long.parseLong(id);
				}
			}
		} catch (Throwable error) {
			reportError(error, "Error retrieving user selection for input parameter");
			return null;
		}
	}
	
	public void setInputDataItem(String parameter, Long dataId) {
		try {
			Map<String, List<TaskInputSourceDocument>> inputDataItems = getInputDataItems();
			if (parameter == null)
				throw new NullPointerException("Parameter key is null.");
			else if (inputDataItems == null)
				throw new NullPointerException("No input parameter map is present.");
			else if (dataId == null) {
				inputDataItems.remove(parameter);
			} else {
				WorkbenchSession session = getWorkbenchSession();
				if (session == null)
					throw new NullPointerException("No session is present.");
				else {
					UserDataItem dataItem = session.findUserDataItem(dataId);
					if (dataItem == null || dataItem.isNew())
						throw new NullPointerException("Selected data item is " +
							"not present in the database.");
					else {
						SourceDocument sourceDocument = session.getSourceDocument(dataItem);
						if (sourceDocument == null)
							throw new NullPointerException("Selected data item has " +
								"no source document.");
						else {
							List<TaskInputSourceDocument> input =
								new Vector<TaskInputSourceDocument>(1);
							TaskInputSourceDocument inputDocument =
								new TaskInputSourceDocument(sourceDocument);
							inputDocument.setName(Long.toString(dataItem.getUserDataId()));
							input.add(inputDocument);
							inputDataItems.put(parameter, input);
							setInputDataItems(inputDataItems);
						}
					}
				}
			}
		} catch (Throwable error) {
			reportError(error, "Error setting data as input parameter");
		}
	}

	public void reset() {
		resetParameters();
		resetInput();
    }
	
	/*================================================================
	 * Parameter selection page property accessor methods
	 *================================================================*/
	public Map<Long, String> getDataForParameter(String parameter) {
		String tool = getTool();
		if (tool == null || parameter == null)
			return null;
		else {
			//TODO: need getDataForParameter() business method
			List<UserDataItem> dataList = null;
			try {
				dataList = getCurrentFolder().findDataItems();
			} catch (Throwable error) {
				reportError(error, "Error retrieving current folder's data list");
				return null;
			}
			Map<Long, String> dataMap = new HashMap<Long, String>(dataList.size());
			for (UserDataItem dataItem : dataList) {
				dataMap.put(dataItem.getUserDataId(), truncateText(dataItem.getLabel()));
			}
			return dataMap;
		}
	}
	
	/*================================================================
	 * Convenience methods
	 *================================================================*/
	protected void resetParameters() {
		if (toolParameters == null)
			toolParameters = new HashMap<String, String>();
		toolParameters.clear();
    }
	
	protected void resetInput() {
		if (inputDataItems == null)
			inputDataItems = new HashMap<String, List<TaskInputSourceDocument>>();
		inputDataItems.clear();
    }
	
	protected Map<String, String> cleanParameters() {
		if (toolParameters == null)
			return null;
		else {
			List<String> emptyParameters = new Vector<String>();
			for (String parameter : toolParameters.keySet()) {
				String value = toolParameters.get(parameter);
				if (value == null || value.trim().equals(""))
					emptyParameters.add(parameter);
			}
			for (String emptyParameter : emptyParameters) {
				toolParameters.remove(emptyParameter);
			}
		}
		return toolParameters;
	}
	
	protected Map<String, List<TaskInputSourceDocument>> cleanInput() {
		if (inputDataItems == null)
			return null;
		else {
			List<String> emptyParameters = new Vector<String>();
			for (String parameter : inputDataItems.keySet()) {
				List<TaskInputSourceDocument> value = inputDataItems.get(parameter);
				if (value == null || value.size() < 1)
					emptyParameters.add(parameter);
			}
			for (String emptyParameter : emptyParameters) {
				toolParameters.remove(emptyParameter);
			}
		}
		return inputDataItems;
	}
	
	protected void verifyInputDataItem(String parameter) {
		try {
			Map<String, List<TaskInputSourceDocument>> inputDataItems =
				getInputDataItems();
			if (parameter == null)
				throw new NullPointerException("Parameter key is null.");
			else if (inputDataItems == null)
				throw new NullPointerException("No input parameter map " +
					"is present.");
			else {
				List<TaskInputSourceDocument> parameterData =
					inputDataItems.get(parameter);
				if (parameterData == null || parameterData.size() < 1)
					throw new NullPointerException("Parameter \"" +
						parameter + "\" is not present in the input " +
						"parameter map.");
				else {
					String id = parameterData.get(0).getName();
					Long dataId = Long.parseLong(id);
					boolean found = false;
					if (dataId != null)
						for (UserDataItem dataItem :
							getCurrentFolder().findDataItems())
							if (dataId.equals(dataItem.getUserDataId())) {
								found = true;
								break;
							}
					if (found == false)
						reportUserError("Warning: Parameter \"" +
							parameter + "\" must be re-selected, because " +
							"the data item previously assigned to it " +
							"is no longer present in the current folder.");
				}
			}
		} catch (NullPointerException error) {
			reportCaughtError(error, "Error verifying persistence of input " +
				"parameter");
		} catch (Throwable error) {
			reportError(error, "Error verifying persistence of input " +
				"parameter");
		}
	}
}
