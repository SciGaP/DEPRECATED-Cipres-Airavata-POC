Once a tool has been released we need to keep it's pisexml file
in this directory, even if we take the tool out of the registry.
A file called tools.properties, under cipres-portal, is generated
from the pisexml files.  It has ToolLabel_CL, ToolType_CL, ToolInput_CL,
etc. properties for each tool in the pisexml directory.  If a user
has an old job, that used a tool that's no longer in the registry,
the job and it's input file won't be displayed correctly in the 
task list unless these properties are present in tools.properties.

