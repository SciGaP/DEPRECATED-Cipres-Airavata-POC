package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class beast_tg extends ToolParameters
{
// file-typed property getters and setters
public Long getInfile_()
{
return getInputDataItemId("infile_");
}
public void setInfile_(Long infile_)
{
setInputDataItem("infile_",infile_);
}
public String getRuntime_()
{return getToolParameters().get("runtime_");
}
public void setRuntime_(String runtime_)
{ getToolParameters().put("runtime_", runtime_);
}
public String getIs_partitioned_()
{return getToolParameters().get("is_partitioned_");
}
public void setIs_partitioned_(String is_partitioned_)
{ getToolParameters().put("is_partitioned_", is_partitioned_);
}
public String getNu_partitions_()
{return getToolParameters().get("nu_partitions_");
}
public void setNu_partitions_(String nu_partitions_)
{ getToolParameters().put("nu_partitions_", nu_partitions_);
}
public String getNo_beagle_()
{return getToolParameters().get("no_beagle_");
}
public void setNo_beagle_(String no_beagle_)
{ getToolParameters().put("no_beagle_", no_beagle_);
}
public String getSpec_seed_()
{return getToolParameters().get("spec_seed_");
}
public void setSpec_seed_(String spec_seed_)
{ getToolParameters().put("spec_seed_", spec_seed_);
}
public String getSeed_val_()
{return getToolParameters().get("seed_val_");
}
public void setSeed_val_(String seed_val_)
{ getToolParameters().put("seed_val_", seed_val_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setRuntime_("0.5");
setIs_partitioned_("false");
setNo_beagle_("false");
setSpec_seed_("false");
setSeed_val_("12345");
}
}
