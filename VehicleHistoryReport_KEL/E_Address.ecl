//HPCC Systems KEL Compiler Version 0.11.6
IMPORT KEL011 AS KEL;
IMPORT transaction_log;
IMPORT * FROM KEL011.Null;
EXPORT E_Address := MODULE
  EXPORT Typ := KEL.typ.uid;
  EXPORT InLayout := RECORD
    KEL.typ.nuid UID;
    KEL.typ.nstr Address_Line_;
    KEL.typ.nstr State_;
    KEL.typ.nint Zip_;
    KEL.typ.nstr City_;
    KEL.typ.nstr County_;
    KEL.typ.nstr Country_;
    KEL.typ.nint Type_;
    KEL.typ.epoch Date_First_Seen_ := 0;
    KEL.typ.epoch Date_Last_Seen_ := 0;
  END;
  SHARED VIRTUAL __SourceFilter(DATASET(InLayout) __ds) := __ds;
  SHARED VIRTUAL __GroupedFilter(GROUPED DATASET(InLayout) __ds) := __ds;
  SHARED __Mapping := 'UID(UID),addressline(Address_Line_:\'\'),state(State_:\'\'),zip(Zip_:0),city(City_:\'\'),county(County_:\'\'),country(Country_:\'\'),type(Type_:0),datefirstseen(Date_First_Seen_:EPOCH),datelastseen(Date_Last_Seen_:EPOCH)';
  SHARED __Trimmed := RECORD, MAXLENGTH(5000)
    STRING KeyVal;
  END;
  SHARED __d0_KELfiltered := transaction_log.TransactionLog(i_addr_line != '\\N' AND i_addr_state != '\\N' AND i_addr_zip != '\\N');
  SHARED __d0_Trim := PROJECT(__d0_KELfiltered,TRANSFORM(__Trimmed,SELF.KeyVal:=TRIM((STRING)LEFT.i_addr_line) + '|' + TRIM((STRING)LEFT.i_addr_state) + '|' + TRIM((STRING)LEFT.i_addr_zip)));
  EXPORT __All_Trim := __d0_Trim;
  SHARED __TabRec := RECORD, MAXLENGTH(5000)
    __All_Trim.KeyVal;
    UNSIGNED4 Cnt := COUNT(GROUP);
    KEL.typ.uid UID := 0;
  END;
  EXPORT NullKeyVal := TRIM((STRING)'') + '|' + TRIM((STRING)'') + '|' + TRIM((STRING)0);
  SHARED __Table := TABLE(__All_Trim(KeyVal <> NullKeyVal),__TabRec,KeyVal,MERGE);
  SHARED NullLookupRec := DATASET([{NullKeyVal,1,0}],__TabRec);
  EXPORT Lookup := NullLookupRec + PROJECT(__Table,TRANSFORM(__TabRec,SELF.UID:=COUNTER,SELF:=LEFT)) : PERSIST('~temp::KEL::KnowledgeUniverse::VehicleHistoryReport_KEL::Address::UidLookup',EXPIRE(30));
  EXPORT UID_IdToText := INDEX(Lookup,{UID},{Lookup},'~temp::KEL::IDtoT::KnowledgeUniverse::VehicleHistoryReport_KEL::Address');
  EXPORT UID_TextToId := INDEX(Lookup,{ht:=HASH32(KeyVal)},{Lookup},'~temp::KEL::TtoID::KnowledgeUniverse::VehicleHistoryReport_KEL::Address');
  EXPORT BuildAll := PARALLEL(BUILDINDEX(UID_IdToText,OVERWRITE),BUILDINDEX(UID_TextToId,OVERWRITE));
  EXPORT GetText(KEL.typ.uid i) := UID_IdToText(UID=i)[1];
  EXPORT GetId(STRING s) := UID_TextToId(ht=HASH32(s),KeyVal=s)[1];
  SHARED __Mapping0 := 'UID(UID),i_addr_line(Address_Line_:\'\'),i_addr_state(State_:\'\'),i_addr_zip(Zip_:0),i_addr_city(City_:\'\'),i_addr_county(County_:\'\'),i_addr_country(Country_:\'\'),i_addr_type(Type_:0),datefirstseen(Date_First_Seen_:EPOCH),datelastseen(Date_Last_Seen_:EPOCH)';
  SHARED __d0_Out := RECORD
    RECORDOF(transaction_log.TransactionLog);
    KEL.typ.uid UID := 0;
  END;
  SHARED __d0_UID_Mapped := JOIN(__d0_KELfiltered,Lookup,TRIM((STRING)LEFT.i_addr_line) + '|' + TRIM((STRING)LEFT.i_addr_state) + '|' + TRIM((STRING)LEFT.i_addr_zip) = RIGHT.KeyVal,TRANSFORM(__d0_Out,SELF.UID:=RIGHT.UID,SELF:=LEFT),HASH);
  EXPORT transaction_log_TransactionLog_Invalid := __d0_UID_Mapped(UID = 0);
  SHARED __d0_Prefiltered := __d0_UID_Mapped(UID <> 0);
  SHARED __d0 := __SourceFilter(KEL.FromFlat.Convert(__d0_Prefiltered,InLayout,__Mapping0));
  EXPORT InData := __d0;
  EXPORT Layout := RECORD
    KEL.typ.nuid UID;
    KEL.typ.nstr Address_Line_;
    KEL.typ.nstr State_;
    KEL.typ.nint Zip_;
    KEL.typ.nstr City_;
    KEL.typ.nstr County_;
    KEL.typ.nstr Country_;
    KEL.typ.nint Type_;
    KEL.typ.epoch Date_First_Seen_ := 0;
    KEL.typ.epoch Date_Last_Seen_ := 0;
    KEL.typ.int __RecordCount := 0;
  END;
  EXPORT __PostFilter := __GroupedFilter(GROUP(DISTRIBUTE(InData,HASH(UID)),UID,LOCAL,ALL));
  Address_Group := __PostFilter;
  Layout Address__Rollup(InLayout __r, DATASET(InLayout) __recs) := TRANSFORM
    SELF.Address_Line_ := KEL.Intake.SingleValue(__recs,Address_Line_);
    SELF.State_ := KEL.Intake.SingleValue(__recs,State_);
    SELF.Zip_ := KEL.Intake.SingleValue(__recs,Zip_);
    SELF.City_ := KEL.Intake.SingleValue(__recs,City_);
    SELF.County_ := KEL.Intake.SingleValue(__recs,County_);
    SELF.Country_ := KEL.Intake.SingleValue(__recs,Country_);
    SELF.Type_ := KEL.Intake.SingleValue(__recs,Type_);
    SELF.__RecordCount := COUNT(__recs);
    SELF.Date_First_Seen_ := KEL.era.SimpleRoll(__recs,Date_First_Seen_,MIN,TRUE);
    SELF.Date_Last_Seen_ := KEL.era.SimpleRoll(__recs,Date_Last_Seen_,MAX,FALSE);
    SELF := __r;
  END;
  Layout Address__Single_Rollup(InLayout __r) := TRANSFORM
    SELF.__RecordCount := 1;
    SELF := __r;
  END;
  EXPORT __PreResult := ROLLUP(HAVING(Address_Group,COUNT(ROWS(LEFT))=1),GROUP,Address__Single_Rollup(LEFT)) + ROLLUP(HAVING(Address_Group,COUNT(ROWS(LEFT))>1),GROUP,Address__Rollup(LEFT, ROWS(LEFT)));
  EXPORT __Result := __CLEARFLAGS(__PreResult);
  EXPORT Result := __UNWRAP(__Result);
  EXPORT Address_Line__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Address_Line_);
  EXPORT State__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,State_);
  EXPORT Zip__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Zip_);
  EXPORT City__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,City_);
  EXPORT County__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,County_);
  EXPORT Country__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Country_);
  EXPORT Type__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Type_);
  EXPORT SanityCheck := DATASET([{COUNT(transaction_log_TransactionLog_Invalid),COUNT(Address_Line__SingleValue_Invalid),COUNT(State__SingleValue_Invalid),COUNT(Zip__SingleValue_Invalid),COUNT(City__SingleValue_Invalid),COUNT(County__SingleValue_Invalid),COUNT(Country__SingleValue_Invalid),COUNT(Type__SingleValue_Invalid)}],{KEL.typ.int transaction_log_TransactionLog_Invalid,KEL.typ.int Address_Line__SingleValue_Invalid,KEL.typ.int State__SingleValue_Invalid,KEL.typ.int Zip__SingleValue_Invalid,KEL.typ.int City__SingleValue_Invalid,KEL.typ.int County__SingleValue_Invalid,KEL.typ.int Country__SingleValue_Invalid,KEL.typ.int Type__SingleValue_Invalid});
  EXPORT NullCounts := DATASET([
    {'Address','transaction_log.TransactionLog','UID',COUNT(transaction_log_TransactionLog_Invalid),COUNT(__d0)},
    {'Address','transaction_log.TransactionLog','i_addr_line',COUNT(__d0(__NL(Address_Line_))),COUNT(__d0(__NN(Address_Line_)))},
    {'Address','transaction_log.TransactionLog','i_addr_state',COUNT(__d0(__NL(State_))),COUNT(__d0(__NN(State_)))},
    {'Address','transaction_log.TransactionLog','i_addr_zip',COUNT(__d0(__NL(Zip_))),COUNT(__d0(__NN(Zip_)))},
    {'Address','transaction_log.TransactionLog','i_addr_city',COUNT(__d0(__NL(City_))),COUNT(__d0(__NN(City_)))},
    {'Address','transaction_log.TransactionLog','i_addr_county',COUNT(__d0(__NL(County_))),COUNT(__d0(__NN(County_)))},
    {'Address','transaction_log.TransactionLog','i_addr_country',COUNT(__d0(__NL(Country_))),COUNT(__d0(__NN(Country_)))},
    {'Address','transaction_log.TransactionLog','i_addr_type',COUNT(__d0(__NL(Type_))),COUNT(__d0(__NN(Type_)))},
    {'Address','transaction_log.TransactionLog','DateFirstSeen',COUNT(__d0(Date_First_Seen_=0)),COUNT(__d0(Date_First_Seen_!=0))},
    {'Address','transaction_log.TransactionLog','DateLastSeen',COUNT(__d0(Date_Last_Seen_=0)),COUNT(__d0(Date_Last_Seen_!=0))}]
  ,{KEL.typ.str entity,KEL.typ.str fileName,KEL.typ.str fieldName,KEL.typ.int nullCount,KEL.typ.int notNullCount});
END;
