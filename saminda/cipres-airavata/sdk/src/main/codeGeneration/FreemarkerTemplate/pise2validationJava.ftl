<#-- ======================== Start of Main() Code Generation ============= -->
<#compress>		<#-- remove superfluous white-space -->

<#recurse doc>	<#-- Strart recursively processing the document -->

<#macro pise>    <#-- A macro name matched with the label of the node in the doc-->
                 <#-- when this node is found execute the following commands-->

<#assign Toolname=.node.command>  <#-- Declaration of a varialbe Toolname-->

<#global step_1=true>

package org.ngbw.sdk.tool.validation;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.Set;

import org.ngbw.sdk.api.tool.ParameterValidator2;
import org.ngbw.sdk.api.tool.FieldError;
import org.ngbw.sdk.common.util.BaseValidator;
import org.ngbw.sdk.database.TaskInputSourceDocument;
import org.ngbw.sdk.common.util.SuperString;

public class ${Toolname}Validator implements ParameterValidator2
{
	private Set<String> requiredParameters;
	private Set<String> requiredInput;
	private Set<String> allowedParameters;
	private Set<String> allowedInput;

	// Map of parameter name to list separator (a single character string) for List parameters.
	private Map<String, String> listParameters;

	// Maps param name to permitted values for List, Excl, Switch type params
	private Map<String, List<String>> listValues;
	private Map<String, List<String>> exclValues ;
	private Map<String, List<String>> switchValues;

	private List<FieldError> errors = new ArrayList<FieldError>();

	public ${Toolname}Validator() {
		requiredParameters = new HashSet<String>();
		requiredInput = new HashSet<String>();
		allowedParameters = new HashSet<String>();
		allowedInput = new HashSet<String>();

		listParameters = new HashMap<String, String>(); 
		listValues = new HashMap<String, List<String>>();
		exclValues = new HashMap<String, List<String>>();
		switchValues = new HashMap<String, List<String>>();

		List<String> switchList = new ArrayList<String>(2);
		switchList.add("0");
		switchList.add("1");
		
		List<String> tmpList;

		<#recurse .node.parameters>     
	}

	public List<FieldError> getErrors()
	{
		return errors;
	}


	public Map<String, String> preProcessParameters(Map<String, List<String>> parameters) 
	{
		Map<String, String> preProcessed = new HashMap<String, String>();
		for (String param : parameters.keySet()) 
		{
			String newValue;
			List<String> values = parameters.get(param);

			// Is param of type List?
			if (listValues.keySet().contains(param))
			{
				for (String value : values)
				{
					List<String> permittedValues = listValues.get(param);
					if (!permittedValues.contains(value))
					{
						errors.add(new FieldError(param, "'" + value + "' is not a permitted value."));
					}
				}
				// concatenate the multiple choices.
				String separator = listParameters.get(param);
				if (separator != null)
				{
					newValue = SuperString.valueOf(parameters.get(param), separator.charAt(0)).toString();
				} else
				{
					newValue = SuperString.valueOf(parameters.get(param), '@').toString();
				}
			} else
			{
				newValue = parameters.get(param).get(0);
				if (parameters.get(param).size() > 1)
				{
					errors.add(new FieldError(param, "multiple values are not permitted.")); 
				}
				if (exclValues.keySet().contains(param))
				{
					if (!exclValues.get(param).contains(newValue))
					{
						errors.add(new FieldError(param, "'" + newValue + "' is not a permitted value."));
					}
				
				} else if (switchValues.keySet().contains(param))
				{
					if (!switchValues.get(param).contains(newValue))
					{
						// todo: error
						errors.add(new FieldError(param, "'" + newValue + "' is not a permitted value, must be 0 or 1."));
					}
				} 
			}
			preProcessed.put(param, newValue); 
		}
		return preProcessed;
	}
	
	public void validateParameters(Map<String, String> parameters) {
		Set<String> missingRequired = validateRequiredParameters(parameters);
		for (String missing : missingRequired) 
		{
			errors.add(new FieldError(missing, "Parameter is required.")); 
		}
		for (String param : parameters.keySet()) 
		{
			if (!allowedParameters.contains(param))
			{
				errors.add(new FieldError(param, "Does not exist.")); 
				continue;
			}
			String error = validate(param, parameters.get(param));
			if (error != null)
			{
				errors.add(new FieldError(param, error)); 
			}
		}
	}

	
	public void validateInput(Set<String> input) {
		Set<String> missingRequired = validateRequiredInput(input);
		for (String missing : missingRequired) 
		{
            errors.add(new FieldError(missing, "Input file parameter is required.")); 
		}
	}
	
	<#global step_1=false>
	
	String validate(String parameter, Object value) {
	  <#recurse .node.parameters>     
		return null;
	}
	private Set<String> validateRequiredParameters(Map<String, String> parameters) {
		Set<String> required = new HashSet<String>(requiredParameters.size());
		required.addAll(requiredParameters);
		for (String parameter : parameters.keySet()) {
			if (required.contains(parameter))
				required.remove(parameter);
		}
		return required;
	}

	private Set<String> validateRequiredInput(Map<String, List<TaskInputSourceDocument>> input) {
        Set<String> required = new HashSet<String>(requiredInput.size());
        required.addAll(requiredInput);
        for (String parameter : input.keySet()) {
            if (required.contains(parameter))
                required.remove(parameter);
        }
        return required;
    }

	private Set<String> validateRequiredInput(Set<String> input) {
		Set<String> required = new HashSet<String>(requiredInput.size());
		required.addAll(requiredInput);
		for (String parameter : input) {
			if (required.contains(parameter))
				required.remove(parameter);
		}
		return required;
	}
}
</#macro>
</#compress>
<#-- ======================== End of Main() Code Generation ============= -->


<#-- ======================== Macros ============= -->

<#macro parameters><#recurse></#macro>

<#macro parameter>

<#--  change "-" to "_" since Java does not recognize '-' as valid name 
	  change " " to "_" since space is not allowed in a Java varname 
	  add "_" to name to avoid using common methods names as parent class -->
	<#assign name = .node.name[0]?default("")>
	<#assign name = name?replace("[ |-]","_","r")+"_">

 
	<#-- skip parameter when "ishidden" is "1" -->
	<#if .node.@ishidden[0]?exists && .node.@ishidden[0]?contains("1")><#return></#if>

	<#-- Generate code for constructor to initialize required and allowed parameter sets --> 
   <#if .globals.step_1==true>

		<#switch .node.@type>
	
		<#case "Paragraph">
		    <#recurse .node.paragraph.parameters> 
		<#break>
		
		<#case "InFile">
		<#case "Sequence">
			allowedInput.add("${name}");
			<#if (.node.@ismandatory[0]?exists && .node.@ismandatory[0]?contains("1") && !.node.attributes.precond?is_node ) 
				|| ( .node.@isinput[0]?exists && .node.@isinput[0]?contains("1") ) >
				requiredInput.add("${name}");
			</#if>
			<#break>
		
		<#case "List">
			<#if  .node.attributes.separator[0]?exists>
				<#assign separator=.node.attributes.separator>
				listParameters.put("${name}", String.valueOf(${separator}));
			<#else>
				listParameters.put("${name}", null);
			</#if>

			allowedParameters.add("${name}");
			<#if .node.@ismandatory[0]?exists && .node.@ismandatory[0]?contains("1") && !.node.attributes.precond?is_node>
				requiredParameters.add("${name}");
			</#if>
			<#visit .node.attributes.vlist>
			<#break>

		<#case "Excl">
			<#if .node.attributes.vlist?is_node>
				<#visit .node.attributes.vlist>
			<#else>
				tmpList = new ArrayList<String>();
				tmpList.add("${.node.attributes.vdef.value}");
				exclValues.put("${name}", tmpList);
			</#if>

    	<#case "String">
		<#case "Integer">
		<#case "Float">
				allowedParameters.add("${name}");
			<#if .node.@ismandatory[0]?exists && .node.@ismandatory[0]?contains("1") && !.node.attributes.precond?is_node>
				requiredParameters.add("${name}");
			</#if>
			<#break>

		<#case "Switch">
			allowedParameters.add("${name}");
			switchValues.put("${name}", switchList);
			<#break>
		
	</#switch>		
 </#if>	 
	 

<#-- Generate code for validate() method --> 
<#if !.globals.step_1==true>   
		<#switch .node.@type>
	
		<#case "Paragraph">
		    <#recurse .node.paragraph.parameters> 
		<#break>
		
		<#case "List">
		<#case "Excl">
    	<#case "String">	
		 <#if .node.@ismandatory[0]?exists && .node.@ismandatory[0]?contains("1") && !.node.attributes.precond?is_node>  
			if (parameter.equals("${name}")) {   
				if (BaseValidator.validateString(value) == false)
					return "Parameter is required.";
				return null;
			}  
		 
			</#if>
		<#break>
		
		<#case "Integer">
		if (parameter.equals("${name}")) {   
		if (BaseValidator.validateInteger(value) == false)
            return "Must be an integer.";
		
		  <#if .node.@ismandatory[0]?exists && .node.@ismandatory[0]?contains("1") && !.node.attributes.precond?is_node> 
		   if (BaseValidator.validateString(value) == false)
   			return "Parameter is required.";
   			
          <#else>
		    
			    <#-- Min && Max -->
			   <#if (.node.attributes.scalemin?is_node  && .node.attributes.scalemin.value?is_node) 
						 && (.node.attributes.scalemax?is_node  && .node.attributes.scalemax.value?is_node)>
			   
			    if (BaseValidator.validateIntegerValueRange(value, ${.node.attributes.scalemin.value}, ${.node.attributes.scalemax.value}) == false)
	    			return "Must be an integer within the range " +
	                 "${.node.attributes.scalemin.value} to ${.node.attributes.scalemax.value}";
			   </#if>
			    <#-- only Min-->
				<#if (.node.attributes.scalemin?is_node  && .node.attributes.scalemin.value?is_node)
				      && ( !.node.attributes.scalemax?is_node)>	
				    if (BaseValidator.validateIntegerMinValue(value,  ${.node.attributes.scalemin.value}) == false)
						return "Must be an integer greater than " + "or equal to  ${.node.attributes.scalemin.value}";
				</#if>
				 <#-- only Max-->
    			<#if .node.attributes.scalemax?is_node  && .node.attributes.scalemax.value?is_node>	
    			   if (BaseValidator.validateIntegerMaxValue(value, ${.node.attributes.scalemax.value}) == false)
						return "Must be an integer less than " + "or equal to  ${.node.attributes.scalemax.value}";
    			</#if>
             
            </#if>
            return null;
		     }  
		<#break>
		
		<#case "Float">
		if (parameter.equals("${name}")) {    		
		if (BaseValidator.validateDouble(value) == false)
            return "Must be a Double.";
		
		  <#if .node.@ismandatory[0]?exists && .node.@ismandatory[0]?contains("1") && !.node.attributes.precond?is_node> 
		   if (BaseValidator.validateString(value) == false)
   			return "Parameter is required.";
   			
          <#else>
		    
			    <#-- Min && Max -->
			   <#if (.node.attributes.scalemin?is_node  && .node.attributes.scalemin.value?is_node) 
						 && (.node.attributes.scalemax?is_node  && .node.attributes.scalemax.value?is_node)>
			   
			    if (BaseValidator.validateDoubleValueRange(value, ${.node.attributes.scalemin.value}, ${.node.attributes.scalemax.value}) == false)
	    			return "Must be a Double within the range " + "${.node.attributes.scalemin.value} to ${.node.attributes.scalemax.value}";
			   </#if>
			    <#-- only Min-->
				<#if (.node.attributes.scalemin?is_node  && .node.attributes.scalemin.value?is_node)
				      && ( !.node.attributes.scalemax?is_node)>	
				    if (BaseValidator.validateDoubleMinValue(value,  ${.node.attributes.scalemin.value}) == false)
						return "Must be a Double greater than " + "or equal to  ${.node.attributes.scalemin.value}";
				</#if>
				 <#-- only Max-->
    			<#if .node.attributes.scalemax?is_node  && .node.attributes.scalemax.value?is_node>	
    			   if (BaseValidator.validateDoubleMaxValue(value, ${.node.attributes.scalemax.value}) == false)
						return "Must be a Double less than " + "or equal to  ${.node.attributes.scalemax.value}";
    			</#if>
             
            </#if>
            return null;
		     }  
		<#break>
		  
		<#break>
		
	</#switch>	
 </#if>	
		
</#macro>


<#macro vlist> 
    <#assign name = .node?parent?parent.name>
    <#assign name = name?replace("[ |-]","_","r")+"_">
   
	tmpList = new ArrayList<String>();
	<#list .node.value as value>
		tmpList.add("${value}");
	</#list>
	<#if .node?parent?parent.@type = "List">
		listValues.put("${name}", tmpList);
	<#elseif .node?parent?parent.@type = "Excl">
		exclValues.put("${name}", tmpList);
	</#if>
</#macro> 
