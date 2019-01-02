//HPCC Systems KEL Compiler Version 0.11.6
IMPORT KEL011 AS KEL;
IMPORT B_Inquiry,E_Inquiry FROM KnowledgeUniverse.VehicleHistoryReport_KEL;
IMPORT * FROM KEL011.Null;
EXPORT RQ_Inquiry_Dump := MODULE
  SHARED __EE490 := B_Inquiry.IDX_Inquiry_UID_Wrapped;
  EXPORT Res0 := __UNWRAP(__EE490);
END;
