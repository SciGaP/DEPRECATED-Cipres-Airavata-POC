package org.ngbw.pise.commandrenderer;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

import org.ngbw.pise.commandrenderer.pise.Attributes;
import org.ngbw.pise.commandrenderer.pise.Code;
import org.ngbw.pise.commandrenderer.pise.Filenames;
import org.ngbw.pise.commandrenderer.pise.Flist;
import org.ngbw.pise.commandrenderer.pise.Format;
import org.ngbw.pise.commandrenderer.pise.Group;
import org.ngbw.pise.commandrenderer.pise.Name;
import org.ngbw.pise.commandrenderer.pise.Parameter;
import org.ngbw.pise.commandrenderer.pise.Parameters;
import org.ngbw.pise.commandrenderer.pise.Paramfile;
import org.ngbw.pise.commandrenderer.pise.Pise;
import org.ngbw.pise.commandrenderer.pise.Precond;
import org.ngbw.pise.commandrenderer.pise.Separator;
import org.ngbw.pise.commandrenderer.pise.Value;
import org.ngbw.pise.commandrenderer.pise.Vdef;

/**
 * Pise Marshaller contains all the methods to  UnMarshall 
 * a Pise XML file
 * It provides also methods to get the values/contents 
 * 
 * @author Rami
 *
 */

public class PiseMarshaller {

	private JAXBContext jc;
	private Pise pise;

	private Set<String> hiddenSet = new HashSet<String>();
	private Set<String> outfileSet = new HashSet<String>();
	private Set<String> resultSet = new HashSet<String>();

	public PiseMarshaller(InputStream piseXMLIs) {
		init(piseXMLIs);
	}

	public PiseMarshaller(File piseXMLFile) {
		try {
			InputStream is = new FileInputStream(piseXMLFile);
			init(is);
		} catch (FileNotFoundException e) {
			throw new RuntimeException(e);
		}
	}

	protected void init(InputStream is) {
		try {
			//package name == namespace
			jc = JAXBContext
					.newInstance("org.ngbw.pise.commandrenderer.pise");

			//Getting stuff from XML -> Java
			Unmarshaller u = jc.createUnmarshaller();
			pise = (Pise) u.unmarshal(is);

			// Get Hidden and Output parameters
			Parameters parameters = pise.getParameters();
			Recursive(parameters);

		} catch (JAXBException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 
	 *
	 */

	private Object getRecursive(Parameters parameters, String parameterName,
			String element) {

		List<Parameter> paramList = parameters.getParameter();

		for (int i = 0; i < paramList.size(); i++) {
			boolean afterParagraph = false;
			Parameter param = paramList.get(i);

			if (param.getType().contains("Paragraph")) {
				afterParagraph = true;
				Object found = null;
				found = getRecursive(param.getParagraph().getParameters(),
						parameterName, element);
				if (found != null)
					return found;
			}

			if (!afterParagraph)

			{
				List<?> nameAndAttributes = param.getNameAndAttributes();

				if (nameAndAttributes.size() > 1) {
					Name name = (Name) nameAndAttributes.get(0);

					if (name.getContent().equals(parameterName)) {

						Attributes attribute = (Attributes) nameAndAttributes
								.get(1);
						for (int j = 0; j < attribute.getPromptOrInfoOrFormat()
								.size(); j++) {
							List<?> attributesList = attribute
									.getPromptOrInfoOrFormat();

							if (element.equals("Vdef"))
								return attributesList;

							// exception
							if (element == "Type" || element == "iscommand"
									|| element == "ismandatory"
									|| element == "ishidden")
								return param;

							// for all other methods; we only need attributesList.get(k)
							// --> which represents the attributes
							for (int k = 0; k < attributesList.size(); k++)
								if (attributesList.get(k).toString().contains(
										element))
									return attributesList.get(k);
						}
					}
				}
			}
		}
		return null;
	}

	/**
	 * Find the Format in the PiseXML for parameterName
	 * @param parameterName
	 * @return dataFormat
	 */
	public String getFormat(String parameterName) {

		String result = null;
		Parameters parameters = pise.getParameters();

		Format format = (Format) getRecursive(parameters, parameterName,
				"Format");
		if (format != null) {
			List<?> languageAndCode = format.getLanguageAndCode();

			if (languageAndCode.size() > 1) //this Means it has at least one langauge and  one code
			{
				Code code = (Code) languageAndCode.get(1);
				// this method is not complete because :
				// 1- it can have code not perl, we should test language to perl
				//	2- it can have multiple tag of language code, we should iterate
				// we assume here that the code language is perl and the code attached is in one statement
				result = code.getContent();
			}
		}

		else {
			// format dosen't exist or format is empty <format/>
		}
		return result;
	}

	/**
	 * Find the Group in the PiseXML for parameterName
	 * @param parameterName
	 * @return group
	 */
	public String getGroup(String parameterName) {

		String result = null;
		Parameters parameters = pise.getParameters();

		Group group = (Group) getRecursive(parameters, parameterName, "Group");
		if (group != null) {

			result = group.getContent();
		} else {
			// group dosen't exist or Group is empty <group/>
		}
		return result;

	}

	/**
	 * Find the Type in the PiseXML for parameterName
	 * @param parameterName
	 * @return type
	 */
	public String getType(String parameterName) {

		String result = null;
		Parameters parameters = pise.getParameters();

		Parameter param = (Parameter) getRecursive(parameters, parameterName,
				"Type");
		if (param != null) {

			result = param.getType();
		}

		return result;
	}

	/**
	 * Find if the parameter is the command 
	 * @param parameterName
	 * @return isCommand
	 */
	public String getIsCommand(String parameterName) {

		String result = null;
		Parameters parameters = pise.getParameters();

		Parameter param = (Parameter) getRecursive(parameters, parameterName,
				"iscommand");
		if (param != null) {

			result = param.getIscommand();
		}

		return result;
	}

	/**
	 * Find if the parameter is hidden from the user
	 * @param parameterName
	 * @return hidden
	 */
	public String getIsHidden(String parameterName) {

		String result = null;
		Parameters parameters = pise.getParameters();

		Parameter param = (Parameter) getRecursive(parameters, parameterName,
				"ishidden");
		if (param != null) {

			result = param.getIshidden();
		}

		return result;
	}

	/**
	 * Find the isMandatory value in the PiseXML for parameterName
	 * @param parameterName
	 * @return mandatory
	 */
	public String getIsMandatory(String parameterName) {

		String result = "false";
		Parameters parameters = pise.getParameters();

		Parameter param = (Parameter) getRecursive(parameters, parameterName,
				"ismandatory");
		if (param != null) {
			result = param.getIsmandatory();

		}

		return result;
	}

	/**
	 * Find the high level Command in the Pise XML 
	 * @return command
	 */
	public String getCmd() {

		return pise.getCommand().getContent();
	}

	/**
	 * Find the Separator in the PiseXML for parameterName
	 * A separator is used for lists with multiple choices 
	 * @param parameterName
	 * @return separator
	 */
	public String getSeparator(String parameterName) {

		String result = null;
		Parameters parameters = pise.getParameters();

		Separator separator = (Separator) getRecursive(parameters,
				parameterName, "Separator");
		if (separator != null) {

			result = separator.getContent();
		}

		return result;
	}

	/**
	 * @param parameterName
	 * @return parameterFileContent
	 */
	public String getParamFile(String parameterName) {

		String result = null;
		Parameters parameters = pise.getParameters();

		Paramfile paramfile = (Paramfile) getRecursive(parameters,
				parameterName, "Paramfile");
		if (paramfile != null) {

			result = paramfile.getContent();
		}

		return result;
	}

	/**
	 * @param parameterName
	 * @return filenames
	 */
	public String getFileNames(String parameterName) {

		String result = null;
		Parameters parameters = pise.getParameters();

		Filenames filenames = (Filenames) getRecursive(parameters,
				parameterName, "Filenames");
		if (filenames != null) {

			result = filenames.getContent();
		}

		return result;
	}

	/**
	 * Find the Precond in the PiseXML for parameterName
	 * @param parameterName
	 * @return precondition
	 */
	public String getPrecond(String parameterName) {

		String result = null;
		Parameters parameters = pise.getParameters();

		Precond precond = (Precond) getRecursive(parameters, parameterName,
				"Precond");
		if (precond != null) {
			List<?> languageAndCode = precond.getLanguageAndCode();

			if (languageAndCode.size() > 1)
			//this Means it has at leat one langauge and  one code
			{
				Code code = (Code) languageAndCode.get(1);
				// this method is not complete because :
				// 1- it can have code not perl, we should test language to perl
				//	2- it can have multiple tag of language code, we should iterate
				// we assume here that the code language is perl and the code attached is in one statement
				result = code.getContent();
			}

		} else {
			// parmeter doesn't exist or Group is empty <precond/>
		}
		return result;
	}

	/**
	 * @param parameterName
	 * @param userValue
	 * @return listValue
	 */
	public String getflistValue(String parameterName, String userValue) {

		String result = null;
		Parameters parameters = pise.getParameters();

		Flist flist = (Flist) getRecursive(parameters, parameterName, "Flist");
		if (flist != null) {
			List<?> valueAndCode = flist.getValueAndCode();

			if (valueAndCode.size() > 1)
			//this Means it has at leat one value and  one code
			{
				for (int i = 0; i < valueAndCode.size(); i += 2) {
					Value value = (Value) valueAndCode.get(i);
					Code code = (Code) valueAndCode.get(i + 1);
					if (value.getContent().equals(userValue))
						result = code.getContent();

				}

			}

		} else {
			// parmeter doesn't exist or flist is empty
		}
		return result;
	}

	/**
	 * Find the Vdef in the PiseXML for parameterName, 
	 * it will use the element separator in order to concatenate them together
	 * @param parameterName
	 * @return vdef
	 */
	public String getVdef(String parameterName) {

		String result = null;
		Parameters parameters = pise.getParameters();

		List<?> attributesList = (List<?>) getRecursive(parameters,
				parameterName, "Vdef");

		Vdef vdef = null;
		Separator separator = null;

		if (attributesList != null) {

			for (int k = 0; k < attributesList.size(); k++)
				if (attributesList.get(k).toString().contains("Vdef"))
					vdef = (Vdef) attributesList.get(k);

			for (int k = 0; k < attributesList.size(); k++)
				if (attributesList.get(k).toString().contains("Separator"))
					separator = (Separator) attributesList.get(k);

			if (vdef != null) {
				List<Value> defaultValueList = vdef.getValue();

				result = defaultValueList.get(0).getContent();
				for (int k = 1; k < defaultValueList.size(); k++) {
					if (separator != null && separator.getContent() != "''")
						result = result
								+ separator.getContent().replace("'", "")
								+ defaultValueList.get(k).getContent();
					else
						result = result + defaultValueList.get(k).getContent();
				}

			}

		}
		return result;
	}

	public Object Recursive(Parameters parameters) {

		List<Parameter> paramList = parameters.getParameter();

		for (int i = 0; i < paramList.size(); i++) {
			boolean afterParagraph = false;
			Parameter param = paramList.get(i);

			if (param.getType().contains("Paragraph")) {
				afterParagraph = true;
				Object found = null;
				found = Recursive(param.getParagraph().getParameters());
				if (found != null)
					return found;
			}

			if (!afterParagraph) {
				List<?> nameAndAttributes = param.getNameAndAttributes();

				Name name = (Name) nameAndAttributes.get(0);

				//   Add this parameter to the HiddenSet
				if (param.getIshidden() != null
						&& param.getIshidden().equals("1"))
					hiddenSet.add(name.getContent());

				//	Add this parameter to the OutfileSet
				if (param.getType().equals("OutFile")
						&& param.getIshidden() == null)
					outfileSet.add(name.getContent());

				// Add this parameter to the ResultSet
				if (param.getType().equals("Results")
						&& param.getIshidden() == null)
					resultSet.add(name.getContent());

			}
		}
		return null;
	}

	public Set<String> getHiddenSet() {
		return this.hiddenSet;
	}

	public Set<String> getOutfileSet() {
		return this.outfileSet;
	}

	public Set<String> getResultSet() {
		return this.resultSet;
	}

}
