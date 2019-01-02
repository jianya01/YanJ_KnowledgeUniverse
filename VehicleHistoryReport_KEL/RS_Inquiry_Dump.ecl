//HPCC Systems KEL Compiler Version 0.11.6
#OPTION('expandSelectCreateRow',true);
IMPORT KEL011 AS KEL;
IMPORT RQ_Inquiry_Dump FROM KnowledgeUniverse.VehicleHistoryReport_KEL;
IMPORT * FROM KEL011.Null;
__RoxieQuery := RQ_Inquiry_Dump;
OUTPUT(__RoxieQuery.Res0,NAMED('Result'));
