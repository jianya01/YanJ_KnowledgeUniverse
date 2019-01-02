//HPCC Systems KEL Compiler Version 0.11.6
IMPORT KEL011 AS KEL;
IMPORT transaction_log;
IMPORT * FROM KEL011.Null;
EXPORT E_Drivers_License := MODULE
  EXPORT Typ := KEL.typ.uid;
  EXPORT InLayout := RECORD
    KEL.typ.nuid UID;
    KEL.typ.nstr Drivers_License_Number_;
    KEL.typ.nstr Issuing_State_;
    KEL.typ.nstr License_Type_;
    KEL.typ.epoch Date_First_Seen_ := 0;
    KEL.typ.epoch Date_Last_Seen_ := 0;
  END;
  SHARED VIRTUAL __SourceFilter(DATASET(InLayout) __ds) := __ds;
  SHARED VIRTUAL __GroupedFilter(GROUPED DATASET(InLayout) __ds) := __ds;
  SHARED __Mapping := 'UID(UID),driverslicensenumber(Drivers_License_Number_:\'\'),issuingstate(Issuing_State_:\'\'),licensetype(License_Type_:\'\'),datefirstseen(Date_First_Seen_:EPOCH),datelastseen(Date_Last_Seen_:EPOCH)';
  SHARED __Trimmed := RECORD, MAXLENGTH(5000)
    STRING KeyVal;
  END;
  SHARED __d0_KELfiltered := transaction_log.TransactionLog(i_dl1_number != '\\N' AND i_dl1_state != '\\N');
  SHARED __d0_Trim := PROJECT(__d0_KELfiltered,TRANSFORM(__Trimmed,SELF.KeyVal:=TRIM((STRING)LEFT.i_dl1_number) + '|' + TRIM((STRING)LEFT.i_dl1_state)));
  EXPORT __All_Trim := __d0_Trim;
  SHARED __TabRec := RECORD, MAXLENGTH(5000)
    __All_Trim.KeyVal;
    UNSIGNED4 Cnt := COUNT(GROUP);
    KEL.typ.uid UID := 0;
  END;
  EXPORT NullKeyVal := TRIM((STRING)'') + '|' + TRIM((STRING)'');
  SHARED __Table := TABLE(__All_Trim(KeyVal <> NullKeyVal),__TabRec,KeyVal,MERGE);
  SHARED NullLookupRec := DATASET([{NullKeyVal,1,0}],__TabRec);
  EXPORT Lookup := NullLookupRec + PROJECT(__Table,TRANSFORM(__TabRec,SELF.UID:=COUNTER,SELF:=LEFT)) : PERSIST('~temp::KEL::KnowledgeUniverse::VehicleHistoryReport_KEL::Drivers_License::UidLookup',EXPIRE(30));
  EXPORT UID_IdToText := INDEX(Lookup,{UID},{Lookup},'~temp::KEL::IDtoT::KnowledgeUniverse::VehicleHistoryReport_KEL::Drivers_License');
  EXPORT UID_TextToId := INDEX(Lookup,{ht:=HASH32(KeyVal)},{Lookup},'~temp::KEL::TtoID::KnowledgeUniverse::VehicleHistoryReport_KEL::Drivers_License');
  EXPORT BuildAll := PARALLEL(BUILDINDEX(UID_IdToText,OVERWRITE),BUILDINDEX(UID_TextToId,OVERWRITE));
  EXPORT GetText(KEL.typ.uid i) := UID_IdToText(UID=i)[1];
  EXPORT GetId(STRING s) := UID_TextToId(ht=HASH32(s),KeyVal=s)[1];
  SHARED __Mapping0 := 'UID(UID),i_dl1_number(Drivers_License_Number_:\'\'),i_dl1_state(Issuing_State_:\'\'),licensetype(License_Type_:\'\'),datefirstseen(Date_First_Seen_:EPOCH),datelastseen(Date_Last_Seen_:EPOCH)';
  SHARED __d0_Out := RECORD
    RECORDOF(transaction_log.TransactionLog);
    KEL.typ.uid UID := 0;
  END;
  SHARED __d0_UID_Mapped := JOIN(__d0_KELfiltered,Lookup,TRIM((STRING)LEFT.i_dl1_number) + '|' + TRIM((STRING)LEFT.i_dl1_state) = RIGHT.KeyVal,TRANSFORM(__d0_Out,SELF.UID:=RIGHT.UID,SELF:=LEFT),HASH);
  EXPORT transaction_log_TransactionLog_Invalid := __d0_UID_Mapped(UID = 0);
  SHARED __d0_Prefiltered := __d0_UID_Mapped(UID <> 0);
  SHARED __d0 := __SourceFilter(KEL.FromFlat.Convert(__d0_Prefiltered,InLayout,__Mapping0));
  EXPORT InData := __d0;
  EXPORT Layout := RECORD
    KEL.typ.nuid UID;
    KEL.typ.nstr Drivers_License_Number_;
    KEL.typ.nstr Issuing_State_;
    KEL.typ.nstr License_Type_;
    KEL.typ.epoch Date_First_Seen_ := 0;
    KEL.typ.epoch Date_Last_Seen_ := 0;
    KEL.typ.int __RecordCount := 0;
  END;
  EXPORT __PostFilter := __GroupedFilter(GROUP(DISTRIBUTE(InData,HASH(UID)),UID,LOCAL,ALL));
  Drivers_License_Group := __PostFilter;
  Layout Drivers_License__Rollup(InLayout __r, DATASET(InLayout) __recs) := TRANSFORM
    SELF.Drivers_License_Number_ := KEL.Intake.SingleValue(__recs,Drivers_License_Number_);
    SELF.Issuing_State_ := KEL.Intake.SingleValue(__recs,Issuing_State_);
    SELF.License_Type_ := KEL.Intake.SingleValue(__recs,License_Type_);
    SELF.__RecordCount := COUNT(__recs);
    SELF.Date_First_Seen_ := KEL.era.SimpleRoll(__recs,Date_First_Seen_,MIN,TRUE);
    SELF.Date_Last_Seen_ := KEL.era.SimpleRoll(__recs,Date_Last_Seen_,MAX,FALSE);
    SELF := __r;
  END;
  Layout Drivers_License__Single_Rollup(InLayout __r) := TRANSFORM
    SELF.__RecordCount := 1;
    SELF := __r;
  END;
  EXPORT __PreResult := ROLLUP(HAVING(Drivers_License_Group,COUNT(ROWS(LEFT))=1),GROUP,Drivers_License__Single_Rollup(LEFT)) + ROLLUP(HAVING(Drivers_License_Group,COUNT(ROWS(LEFT))>1),GROUP,Drivers_License__Rollup(LEFT, ROWS(LEFT)));
  EXPORT __Result := __CLEARFLAGS(__PreResult);
  EXPORT Result := __UNWRAP(__Result);
  EXPORT Drivers_License_Number__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Drivers_License_Number_);
  EXPORT Issuing_State__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Issuing_State_);
  EXPORT License_Type__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,License_Type_);
  EXPORT SanityCheck := DATASET([{COUNT(transaction_log_TransactionLog_Invalid),COUNT(Drivers_License_Number__SingleValue_Invalid),COUNT(Issuing_State__SingleValue_Invalid),COUNT(License_Type__SingleValue_Invalid)}],{KEL.typ.int transaction_log_TransactionLog_Invalid,KEL.typ.int Drivers_License_Number__SingleValue_Invalid,KEL.typ.int Issuing_State__SingleValue_Invalid,KEL.typ.int License_Type__SingleValue_Invalid});
  EXPORT NullCounts := DATASET([
    {'DriversLicense','transaction_log.TransactionLog','UID',COUNT(transaction_log_TransactionLog_Invalid),COUNT(__d0)},
    {'DriversLicense','transaction_log.TransactionLog','i_dl1_number',COUNT(__d0(__NL(Drivers_License_Number_))),COUNT(__d0(__NN(Drivers_License_Number_)))},
    {'DriversLicense','transaction_log.TransactionLog','i_dl1_state',COUNT(__d0(__NL(Issuing_State_))),COUNT(__d0(__NN(Issuing_State_)))},
    {'DriversLicense','transaction_log.TransactionLog','LicenseType',COUNT(__d0(__NL(License_Type_))),COUNT(__d0(__NN(License_Type_)))},
    {'DriversLicense','transaction_log.TransactionLog','DateFirstSeen',COUNT(__d0(Date_First_Seen_=0)),COUNT(__d0(Date_First_Seen_!=0))},
    {'DriversLicense','transaction_log.TransactionLog','DateLastSeen',COUNT(__d0(Date_Last_Seen_=0)),COUNT(__d0(Date_Last_Seen_!=0))}]
  ,{KEL.typ.str entity,KEL.typ.str fileName,KEL.typ.str fieldName,KEL.typ.int nullCount,KEL.typ.int notNullCount});
END;
