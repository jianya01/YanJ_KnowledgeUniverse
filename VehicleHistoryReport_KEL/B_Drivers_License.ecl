//HPCC Systems KEL Compiler Version 0.11.6
IMPORT KEL011 AS KEL;
IMPORT E_Drivers_License FROM KnowledgeUniverse.VehicleHistoryReport_KEL;
IMPORT * FROM KEL011.Null;
EXPORT B_Drivers_License := MODULE
  SHARED __EE853 := E_Drivers_License.__Result;
  SHARED IDX_Drivers_License_UID_Layout := RECORD
    KEL.typ.uid UID;
    __EE853.Drivers_License_Number_;
    __EE853.Issuing_State_;
    __EE853.License_Type_;
    __EE853.Date_First_Seen_;
    __EE853.Date_Last_Seen_;
    __EE853.__RecordCount;
  END;
  SHARED IDX_Drivers_License_UID_Projected := PROJECT(__EE853,TRANSFORM(IDX_Drivers_License_UID_Layout,SELF.UID:=__T(LEFT.UID),SELF:=LEFT));
  EXPORT IDX_Drivers_License_UID_Name := '~key::KEL::KnowledgeUniverse::VehicleHistoryReport_KEL::Drivers_License::UID';
  EXPORT IDX_Drivers_License_UID := INDEX(IDX_Drivers_License_UID_Projected,{UID},{IDX_Drivers_License_UID_Projected},IDX_Drivers_License_UID_Name);
  EXPORT IDX_Drivers_License_UID_Build := BUILD(IDX_Drivers_License_UID,OVERWRITE);
  EXPORT __ST855_Layout := RECORDOF(IDX_Drivers_License_UID);
  EXPORT IDX_Drivers_License_UID_Wrapped := PROJECT(IDX_Drivers_License_UID,TRANSFORM(E_Drivers_License.Layout,SELF.UID := __CN(LEFT.UID),SELF:=LEFT));
  EXPORT BuildAll := PARALLEL(IDX_Drivers_License_UID_Build);
END;
