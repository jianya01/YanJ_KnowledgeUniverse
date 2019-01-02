//HPCC Systems KEL Compiler Version 0.11.6
IMPORT KEL011 AS KEL;
IMPORT B_Address,B_Drivers_License,B_Person,B_Vehicle,E_Address,E_Drivers_License,E_Person,E_Vehicle FROM KnowledgeUniverse.VehicleHistoryReport_KEL;
IMPORT * FROM KEL011.Null;
EXPORT RQ_Data_Dump := MODULE
  SHARED __EE470 := B_Person.IDX_Person_UID_Wrapped;
  SHARED __EE472 := __EE470;
  EXPORT Res0 := __UNWRAP(__EE472);
  SHARED __EE475 := B_Drivers_License.IDX_Drivers_License_UID_Wrapped;
  SHARED __EE477 := __EE475;
  EXPORT Res1 := __UNWRAP(__EE477);
  SHARED __EE480 := B_Address.IDX_Address_UID_Wrapped;
  SHARED __EE482 := __EE480;
  EXPORT Res2 := __UNWRAP(__EE482);
  SHARED __EE485 := B_Vehicle.IDX_Vehicle_UID_Wrapped;
  EXPORT Res3 := __UNWRAP(__EE485);
END;
