//HPCC Systems KEL Compiler Version 0.11.6
IMPORT KEL011 AS KEL;
IMPORT B_Address,B_Drivers_License,B_Person,E_Address,E_Drivers_License,E_Person FROM KnowledgeUniverse.VehicleHistoryReport_KEL;
IMPORT * FROM KEL011.Null;
EXPORT RQ_Data_Dump := MODULE
  SHARED __EE933 := B_Person.IDX_Person_UID_Wrapped;
  SHARED __EE935 := __EE933;
  EXPORT Res0 := __UNWRAP(__EE935);
  SHARED __EE938 := B_Drivers_License.IDX_Drivers_License_UID_Wrapped;
  SHARED __EE940 := __EE938;
  EXPORT Res1 := __UNWRAP(__EE940);
  SHARED __EE943 := B_Address.IDX_Address_UID_Wrapped;
  EXPORT Res2 := __UNWRAP(__EE943);
END;
