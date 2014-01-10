package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class epestfind extends ToolParameters
{
// file-typed property getters and setters
public Long getSeq_file_()
{
return getInputDataItemId("seq_file_");
}
public void setSeq_file_(Long seq_file_)
{
setInputDataItem("seq_file_",seq_file_);
}
public String getMin_dist_()
{return getToolParameters().get("min_dist_");
}
public void setMin_dist_(String min_dist_)
{ getToolParameters().put("min_dist_", min_dist_);
}
public String getThreshold_value_()
{return getToolParameters().get("threshold_value_");
}
public void setThreshold_value_(String threshold_value_)
{ getToolParameters().put("threshold_value_", threshold_value_);
}
public String getUsemy_aadata_()
{return getToolParameters().get("usemy_aadata_");
}
public void setUsemy_aadata_(String usemy_aadata_)
{ getToolParameters().put("usemy_aadata_", usemy_aadata_);
}
// file-typed property getters and setters
public Long getMy_aadata_upload_()
{
return getInputDataItemId("my_aadata_upload_");
}
public void setMy_aadata_upload_(Long my_aadata_upload_)
{
setInputDataItem("my_aadata_upload_",my_aadata_upload_);
}
public String getNo_potential_()
{return getToolParameters().get("no_potential_");
}
public void setNo_potential_(String no_potential_)
{ getToolParameters().put("no_potential_", no_potential_);
}
public String getNo_poor_()
{return getToolParameters().get("no_poor_");
}
public void setNo_poor_(String no_poor_)
{ getToolParameters().put("no_poor_", no_poor_);
}
public String getNo_invalid_()
{return getToolParameters().get("no_invalid_");
}
public void setNo_invalid_(String no_invalid_)
{ getToolParameters().put("no_invalid_", no_invalid_);
}
public String getNo_map_()
{return getToolParameters().get("no_map_");
}
public void setNo_map_(String no_map_)
{ getToolParameters().put("no_map_", no_map_);
}
public String getSbegin1_()
{return getToolParameters().get("sbegin1_");
}
public void setSbegin1_(String sbegin1_)
{ getToolParameters().put("sbegin1_", sbegin1_);
}
public String getSend1_()
{return getToolParameters().get("send1_");
}
public void setSend1_(String send1_)
{ getToolParameters().put("send1_", send1_);
}
public String getSort_order_()
{return getToolParameters().get("sort_order_");
}
public void setSort_order_(String sort_order_)
{ getToolParameters().put("sort_order_", sort_order_);
}
public String getGraph_type_()
{return getToolParameters().get("graph_type_");
}
public void setGraph_type_(String graph_type_)
{ getToolParameters().put("graph_type_", graph_type_);
}
public String getGsubtitle_input_()
{return getToolParameters().get("gsubtitle_input_");
}
public void setGsubtitle_input_(String gsubtitle_input_)
{ getToolParameters().put("gsubtitle_input_", gsubtitle_input_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setMin_dist_("10");
setThreshold_value_("5.0");
setUsemy_aadata_("false");
setNo_potential_("true");
setNo_poor_("true");
setNo_invalid_("false");
setNo_map_("true");
setSort_order_( "score" );
setGraph_type_( "png" );
}
}
