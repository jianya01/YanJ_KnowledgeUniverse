//HPCC Systems KEL Compiler Version 0.11.6
IMPORT KEL011 AS KEL;
IMPORT E_Vehicle FROM KnowledgeUniverse.VehicleHistoryReport_KEL;
IMPORT * FROM KEL011.Null;
EXPORT B_Vehicle := MODULE
  SHARED __EE457 := E_Vehicle.__Result;
  SHARED IDX_Vehicle_UID_Layout := RECORD
    KEL.typ.uid UID;
    __EE457.Vin_;
    __EE457.Vehicle_Year_Make_;
    __EE457.Vehicle_Make_;
    __EE457.Vehicle_Model_;
    __EE457.Plate_Data_;
    __EE457.Plate_State_;
    __EE457.Date_First_Seen_;
    __EE457.Date_Last_Seen_;
    __EE457.__RecordCount;
  END;
  SHARED IDX_Vehicle_UID_Projected := PROJECT(__EE457,TRANSFORM(IDX_Vehicle_UID_Layout,SELF.UID:=__T(LEFT.UID),SELF:=LEFT));
  EXPORT IDX_Vehicle_UID_Name := '~key::KEL::KnowledgeUniverse::VehicleHistoryReport_KEL::Vehicle::UID';
  EXPORT IDX_Vehicle_UID := INDEX(IDX_Vehicle_UID_Projected,{UID},{IDX_Vehicle_UID_Projected},IDX_Vehicle_UID_Name);
  EXPORT IDX_Vehicle_UID_Build := BUILD(IDX_Vehicle_UID,OVERWRITE);
  EXPORT __ST459_Layout := RECORDOF(IDX_Vehicle_UID);
  EXPORT IDX_Vehicle_UID_Wrapped := PROJECT(IDX_Vehicle_UID,TRANSFORM(E_Vehicle.Layout,SELF.UID := __CN(LEFT.UID),SELF:=LEFT));
  EXPORT BuildAll := PARALLEL(IDX_Vehicle_UID_Build);
END;
