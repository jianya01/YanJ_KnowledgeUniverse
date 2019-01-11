//HPCC Systems KEL Compiler Version 0.11.6
IMPORT KEL011 AS KEL;
IMPORT E_Address FROM KnowledgeUniverse.VehicleHistoryReport_KEL;
IMPORT * FROM KEL011.Null;
EXPORT B_Address := MODULE
  SHARED __EE881 := E_Address.__Result;
  SHARED IDX_Address_UID_Layout := RECORD
    KEL.typ.uid UID;
    __EE881.Address_Line_;
    __EE881.State_;
    __EE881.Zip_;
    __EE881.City_;
    __EE881.County_;
    __EE881.Country_;
    __EE881.Type_;
    __EE881.Date_First_Seen_;
    __EE881.Date_Last_Seen_;
    __EE881.__RecordCount;
  END;
  SHARED IDX_Address_UID_Projected := PROJECT(__EE881,TRANSFORM(IDX_Address_UID_Layout,SELF.UID:=__T(LEFT.UID),SELF:=LEFT));
  EXPORT IDX_Address_UID_Name := '~key::KEL::KnowledgeUniverse::VehicleHistoryReport_KEL::Address::UID';
  EXPORT IDX_Address_UID := INDEX(IDX_Address_UID_Projected,{UID},{IDX_Address_UID_Projected},IDX_Address_UID_Name);
  EXPORT IDX_Address_UID_Build := BUILD(IDX_Address_UID,OVERWRITE);
  EXPORT __ST883_Layout := RECORDOF(IDX_Address_UID);
  EXPORT IDX_Address_UID_Wrapped := PROJECT(IDX_Address_UID,TRANSFORM(E_Address.Layout,SELF.UID := __CN(LEFT.UID),SELF:=LEFT));
  EXPORT BuildAll := PARALLEL(IDX_Address_UID_Build);
END;
