//HPCC Systems KEL Compiler Version 0.11.6
IMPORT KEL011 AS KEL;
IMPORT E_Person FROM KnowledgeUniverse.VehicleHistoryReport_KEL;
IMPORT * FROM KEL011.Null;
EXPORT B_Person := MODULE
  SHARED __EE438 := E_Person.__Result;
  SHARED IDX_Person_UID_Layout := RECORD
    KEL.typ.uid UID;
    __EE438.S_S_N_;
    __EE438.Full_Name_;
    __EE438.Reported_Dates_Of_Birth_;
    __EE438.Date_First_Seen_;
    __EE438.Date_Last_Seen_;
    __EE438.__RecordCount;
  END;
  SHARED IDX_Person_UID_Projected := PROJECT(__EE438,TRANSFORM(IDX_Person_UID_Layout,SELF.UID:=__T(LEFT.UID),SELF:=LEFT));
  EXPORT IDX_Person_UID_Name := '~key::KEL::KnowledgeUniverse::VehicleHistoryReport_KEL::Person::UID';
  EXPORT IDX_Person_UID := INDEX(IDX_Person_UID_Projected,{UID},{IDX_Person_UID_Projected},IDX_Person_UID_Name);
  EXPORT IDX_Person_UID_Build := BUILD(IDX_Person_UID,OVERWRITE);
  EXPORT __ST440_Layout := RECORDOF(IDX_Person_UID);
  EXPORT IDX_Person_UID_Wrapped := PROJECT(IDX_Person_UID,TRANSFORM(E_Person.Layout,SELF.UID := __CN(LEFT.UID),SELF:=LEFT));
  EXPORT BuildAll := PARALLEL(IDX_Person_UID_Build);
END;
