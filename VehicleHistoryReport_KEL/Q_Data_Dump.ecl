//HPCC Systems KEL Compiler Version 0.11.6
IMPORT KEL011 AS KEL;
IMPORT E_Address,E_Drivers_License,E_Person,E_Vehicle FROM KnowledgeUniverse.VehicleHistoryReport_KEL;
IMPORT * FROM KEL011.Null;
EXPORT Q_Data_Dump := MODULE
  SHARED TYPEOF(E_Address.__Result) __E_Address := E_Address.__Result;
  SHARED TYPEOF(E_Drivers_License.__Result) __E_Drivers_License := E_Drivers_License.__Result;
  SHARED TYPEOF(E_Person.__Result) __E_Person := E_Person.__Result;
  SHARED TYPEOF(E_Vehicle.__Result) __E_Vehicle := E_Vehicle.__Result;
  SHARED __EE323 := __E_Person;
  SHARED __EE325 := __EE323;
  EXPORT Res0 := __UNWRAP(__EE325);
  SHARED __EE327 := __E_Drivers_License;
  SHARED __EE329 := __EE327;
  EXPORT Res1 := __UNWRAP(__EE329);
  SHARED __EE331 := __E_Address;
  SHARED __EE333 := __EE331;
  EXPORT Res2 := __UNWRAP(__EE333);
  SHARED __EE335 := __E_Vehicle;
  EXPORT Res3 := __UNWRAP(__EE335);
END;
