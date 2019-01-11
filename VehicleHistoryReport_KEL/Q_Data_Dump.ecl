//HPCC Systems KEL Compiler Version 0.11.6
IMPORT KEL011 AS KEL;
IMPORT E_Address,E_Drivers_License,E_Person FROM KnowledgeUniverse.VehicleHistoryReport_KEL;
IMPORT * FROM KEL011.Null;
EXPORT Q_Data_Dump := MODULE
  SHARED TYPEOF(E_Address.__Result) __E_Address := E_Address.__Result;
  SHARED TYPEOF(E_Drivers_License.__Result) __E_Drivers_License := E_Drivers_License.__Result;
  SHARED TYPEOF(E_Person.__Result) __E_Person := E_Person.__Result;
  SHARED __EE678 := __E_Person;
  SHARED __EE680 := __EE678;
  EXPORT Res0 := __UNWRAP(__EE680);
  SHARED __EE682 := __E_Drivers_License;
  SHARED __EE684 := __EE682;
  EXPORT Res1 := __UNWRAP(__EE684);
  SHARED __EE686 := __E_Address;
  EXPORT Res2 := __UNWRAP(__EE686);
END;
