package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class prosearch extends ToolParameters
{
// file-typed property getters and setters
public Long getProtein_()
{
return getInputDataItemId("protein_");
}
public void setProtein_(Long protein_)
{
setInputDataItem("protein_",protein_);
}
public String getSites_()
{return getToolParameters().get("sites_");
}
public void setSites_(String sites_)
{ getToolParameters().put("sites_", sites_);
}
public String getDoc_()
{return getToolParameters().get("doc_");
}
public void setDoc_(String doc_)
{ getToolParameters().put("doc_", doc_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
}
}
