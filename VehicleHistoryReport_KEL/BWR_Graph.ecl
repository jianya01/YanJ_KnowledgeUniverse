//HPCC Systems KEL Compiler Version 0.11.6
#OPTION('expandSelectCreateRow',true);
IMPORT KEL011 AS KEL;
IMPORT * FROM KEL011.Null;
IMPORT * FROM KnowledgeUniverse.VehicleHistoryReport_KEL;
OUTPUT(Q_Data_Dump.Res0,NAMED('Person'));
OUTPUT(Q_Data_Dump.Res1,NAMED('DL'));
OUTPUT(Q_Data_Dump.Res2,NAMED('Address'));
OUTPUT(Q_Data_Dump.Res3,NAMED('Vehicle'));
OUTPUT(Q_Inquiry_Dump.Res0,NAMED('Inquiry'));

