﻿//HPCC Systems KEL Compiler Version 0.11.6
#OPTION('expandSelectCreateRow',true);
IMPORT KEL011 AS KEL;
IMPORT B_BuildAll_Graph FROM KnowledgeUniverse.VehicleHistoryReport_KEL;
IMPORT * FROM KEL011.Null;
B_BuildAll_Graph.BuildAll;
