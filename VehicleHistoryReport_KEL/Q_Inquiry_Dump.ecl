//HPCC Systems KEL Compiler Version 0.11.6
IMPORT KEL011 AS KEL;
IMPORT E_Inquiry FROM KnowledgeUniverse.VehicleHistoryReport_KEL;
IMPORT * FROM KEL011.Null;
EXPORT Q_Inquiry_Dump := MODULE
  SHARED TYPEOF(E_Inquiry.__Result) __E_Inquiry := E_Inquiry.__Result;
  SHARED __EE339 := __E_Inquiry;
  EXPORT Res0 := __UNWRAP(__EE339);
END;
