//HPCC Systems KEL Compiler Version 0.11.6
IMPORT KEL011 AS KEL;
IMPORT E_Drivers_License FROM KnowledgeUniverse.VehicleHistoryReport_KEL;
IMPORT * FROM KEL011.Null;
EXPORT B_Drivers_License := MODULE
  SHARED __EE429 := E_Drivers_License.__Result;
  SHARED IDX_Drivers_License_UID_Layout := RECORD
    KEL.typ.uid UID;
    __EE429.Drivers_License_Number_;
    __EE429.Issuing_State_;
    __EE429.License_Type_;
    __EE429.Date_First_Seen_;
    __EE429.Date_Last_Seen_;
    __EE429.__RecordCount;
  END;
  SHARED IDX_Drivers_License_UID_Projected := PROJECT(__EE429,TRANSFORM(IDX_Drivers_License_UID_Layout,SELF.UID:=__T(LEFT.UID),SELF:=LEFT));
  EXPORT IDX_Drivers_License_UID_Name := '~key::KEL::KnowledgeUniverse::VehicleHistoryReport_KEL::Drivers_License::UID';
  EXPORT IDX_Drivers_License_UID := INDEX(IDX_Drivers_License_UID_Projected,{UID},{IDX_Drivers_License_UID_Projected},IDX_Drivers_License_UID_Name);
  EXPORT IDX_Drivers_License_UID_Build := BUILD(IDX_Drivers_License_UID,OVERWRITE);
  EXPORT __ST431_Layout := RECORDOF(IDX_Drivers_License_UID);
  EXPORT IDX_Drivers_License_UID_Wrapped := PROJECT(IDX_Drivers_License_UID,TRANSFORM(E_Drivers_License.Layout,SELF.UID := __CN(LEFT.UID),SELF:=LEFT));
  EXPORT BuildAll := PARALLEL(IDX_Drivers_License_UID_Build);
END;
