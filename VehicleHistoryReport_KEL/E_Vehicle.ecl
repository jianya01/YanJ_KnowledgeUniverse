//HPCC Systems KEL Compiler Version 0.11.6
IMPORT KEL011 AS KEL;
IMPORT transaction_log_vehicle;
IMPORT * FROM KEL011.Null;
EXPORT E_Vehicle := MODULE
  EXPORT Typ := KEL.typ.uid;
  EXPORT InLayout := RECORD
    KEL.typ.nuid UID;
    KEL.typ.nstr Vin_;
    KEL.typ.nint Vehicle_Year_Make_;
    KEL.typ.nstr Vehicle_Make_;
    KEL.typ.nstr Vehicle_Model_;
    KEL.typ.nstr Plate_Data_;
    KEL.typ.nstr Plate_State_;
    KEL.typ.epoch Date_First_Seen_ := 0;
    KEL.typ.epoch Date_Last_Seen_ := 0;
  END;
  SHARED VIRTUAL __SourceFilter(DATASET(InLayout) __ds) := __ds;
  SHARED VIRTUAL __GroupedFilter(GROUPED DATASET(InLayout) __ds) := __ds;
  SHARED __Mapping := 'UID(UID),vin(Vin_:\'\'),vehicleyearmake(Vehicle_Year_Make_:0),vehiclemake(Vehicle_Make_:\'\'),vehiclemodel(Vehicle_Model_:\'\'),platedata(Plate_Data_:\'\'),platestate(Plate_State_:\'\'),datefirstseen(Date_First_Seen_:EPOCH),datelastseen(Date_Last_Seen_:EPOCH)';
  SHARED __Trimmed := RECORD, MAXLENGTH(5000)
    STRING KeyVal;
  END;
  SHARED __d0_Trim := PROJECT(transaction_log_vehicle.TransactionLogVehicle,TRANSFORM(__Trimmed,SELF.KeyVal:=TRIM((STRING)LEFT.vin)));
  EXPORT __All_Trim := __d0_Trim;
  SHARED __TabRec := RECORD, MAXLENGTH(5000)
    __All_Trim.KeyVal;
    UNSIGNED4 Cnt := COUNT(GROUP);
    KEL.typ.uid UID := 0;
  END;
  EXPORT NullKeyVal := TRIM((STRING)'');
  SHARED __Table := TABLE(__All_Trim(KeyVal <> NullKeyVal),__TabRec,KeyVal,MERGE);
  SHARED NullLookupRec := DATASET([{NullKeyVal,1,0}],__TabRec);
  EXPORT Lookup := NullLookupRec + PROJECT(__Table,TRANSFORM(__TabRec,SELF.UID:=COUNTER,SELF:=LEFT)) : PERSIST('~temp::KEL::KnowledgeUniverse::VehicleHistoryReport_KEL::Vehicle::UidLookup',EXPIRE(30));
  EXPORT UID_IdToText := INDEX(Lookup,{UID},{Lookup},'~temp::KEL::IDtoT::KnowledgeUniverse::VehicleHistoryReport_KEL::Vehicle');
  EXPORT UID_TextToId := INDEX(Lookup,{ht:=HASH32(KeyVal)},{Lookup},'~temp::KEL::TtoID::KnowledgeUniverse::VehicleHistoryReport_KEL::Vehicle');
  EXPORT BuildAll := PARALLEL(BUILDINDEX(UID_IdToText,OVERWRITE),BUILDINDEX(UID_TextToId,OVERWRITE));
  EXPORT GetText(KEL.typ.uid i) := UID_IdToText(UID=i)[1];
  EXPORT GetId(STRING s) := UID_TextToId(ht=HASH32(s),KeyVal=s)[1];
  SHARED __Mapping0 := 'UID(UID),vin(Vin_:\'\'),model_year(Vehicle_Year_Make_:0),make(Vehicle_Make_:\'\'),model(Vehicle_Model_:\'\'),plate_data(Plate_Data_:\'\'),plate_state(Plate_State_:\'\'),datefirstseen(Date_First_Seen_:EPOCH),datelastseen(Date_Last_Seen_:EPOCH)';
  SHARED __d0_Out := RECORD
    RECORDOF(transaction_log_vehicle.TransactionLogVehicle);
    KEL.typ.uid UID := 0;
  END;
  SHARED __d0_UID_Mapped := JOIN(transaction_log_vehicle.TransactionLogVehicle,Lookup,TRIM((STRING)LEFT.vin) = RIGHT.KeyVal,TRANSFORM(__d0_Out,SELF.UID:=RIGHT.UID,SELF:=LEFT),HASH);
  EXPORT transaction_log_vehicle_TransactionLogVehicle_Invalid := __d0_UID_Mapped(UID = 0);
  SHARED __d0_Prefiltered := __d0_UID_Mapped(UID <> 0);
  SHARED __d0 := __SourceFilter(KEL.FromFlat.Convert(__d0_Prefiltered,InLayout,__Mapping0));
  EXPORT InData := __d0;
  EXPORT Layout := RECORD
    KEL.typ.nuid UID;
    KEL.typ.nstr Vin_;
    KEL.typ.nint Vehicle_Year_Make_;
    KEL.typ.nstr Vehicle_Make_;
    KEL.typ.nstr Vehicle_Model_;
    KEL.typ.nstr Plate_Data_;
    KEL.typ.nstr Plate_State_;
    KEL.typ.epoch Date_First_Seen_ := 0;
    KEL.typ.epoch Date_Last_Seen_ := 0;
    KEL.typ.int __RecordCount := 0;
  END;
  EXPORT __PostFilter := __GroupedFilter(GROUP(DISTRIBUTE(InData,HASH(UID)),UID,LOCAL,ALL));
  Vehicle_Group := __PostFilter;
  Layout Vehicle__Rollup(InLayout __r, DATASET(InLayout) __recs) := TRANSFORM
    SELF.Vin_ := KEL.Intake.SingleValue(__recs,Vin_);
    SELF.Vehicle_Year_Make_ := KEL.Intake.SingleValue(__recs,Vehicle_Year_Make_);
    SELF.Vehicle_Make_ := KEL.Intake.SingleValue(__recs,Vehicle_Make_);
    SELF.Vehicle_Model_ := KEL.Intake.SingleValue(__recs,Vehicle_Model_);
    SELF.Plate_Data_ := KEL.Intake.SingleValue(__recs,Plate_Data_);
    SELF.Plate_State_ := KEL.Intake.SingleValue(__recs,Plate_State_);
    SELF.__RecordCount := COUNT(__recs);
    SELF.Date_First_Seen_ := KEL.era.SimpleRoll(__recs,Date_First_Seen_,MIN,TRUE);
    SELF.Date_Last_Seen_ := KEL.era.SimpleRoll(__recs,Date_Last_Seen_,MAX,FALSE);
    SELF := __r;
  END;
  Layout Vehicle__Single_Rollup(InLayout __r) := TRANSFORM
    SELF.__RecordCount := 1;
    SELF := __r;
  END;
  EXPORT __PreResult := ROLLUP(HAVING(Vehicle_Group,COUNT(ROWS(LEFT))=1),GROUP,Vehicle__Single_Rollup(LEFT)) + ROLLUP(HAVING(Vehicle_Group,COUNT(ROWS(LEFT))>1),GROUP,Vehicle__Rollup(LEFT, ROWS(LEFT)));
  EXPORT __Result := __CLEARFLAGS(__PreResult);
  EXPORT Result := __UNWRAP(__Result);
  EXPORT Vin__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Vin_);
  EXPORT Vehicle_Year_Make__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Vehicle_Year_Make_);
  EXPORT Vehicle_Make__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Vehicle_Make_);
  EXPORT Vehicle_Model__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Vehicle_Model_);
  EXPORT Plate_Data__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Plate_Data_);
  EXPORT Plate_State__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Plate_State_);
  EXPORT SanityCheck := DATASET([{COUNT(transaction_log_vehicle_TransactionLogVehicle_Invalid),COUNT(Vin__SingleValue_Invalid),COUNT(Vehicle_Year_Make__SingleValue_Invalid),COUNT(Vehicle_Make__SingleValue_Invalid),COUNT(Vehicle_Model__SingleValue_Invalid),COUNT(Plate_Data__SingleValue_Invalid),COUNT(Plate_State__SingleValue_Invalid)}],{KEL.typ.int transaction_log_vehicle_TransactionLogVehicle_Invalid,KEL.typ.int Vin__SingleValue_Invalid,KEL.typ.int Vehicle_Year_Make__SingleValue_Invalid,KEL.typ.int Vehicle_Make__SingleValue_Invalid,KEL.typ.int Vehicle_Model__SingleValue_Invalid,KEL.typ.int Plate_Data__SingleValue_Invalid,KEL.typ.int Plate_State__SingleValue_Invalid});
  EXPORT NullCounts := DATASET([
    {'Vehicle','transaction_log_vehicle.TransactionLogVehicle','UID',COUNT(transaction_log_vehicle_TransactionLogVehicle_Invalid),COUNT(__d0)},
    {'Vehicle','transaction_log_vehicle.TransactionLogVehicle','vin',COUNT(__d0(__NL(Vin_))),COUNT(__d0(__NN(Vin_)))},
    {'Vehicle','transaction_log_vehicle.TransactionLogVehicle','model_year',COUNT(__d0(__NL(Vehicle_Year_Make_))),COUNT(__d0(__NN(Vehicle_Year_Make_)))},
    {'Vehicle','transaction_log_vehicle.TransactionLogVehicle','make',COUNT(__d0(__NL(Vehicle_Make_))),COUNT(__d0(__NN(Vehicle_Make_)))},
    {'Vehicle','transaction_log_vehicle.TransactionLogVehicle','model',COUNT(__d0(__NL(Vehicle_Model_))),COUNT(__d0(__NN(Vehicle_Model_)))},
    {'Vehicle','transaction_log_vehicle.TransactionLogVehicle','plate_data',COUNT(__d0(__NL(Plate_Data_))),COUNT(__d0(__NN(Plate_Data_)))},
    {'Vehicle','transaction_log_vehicle.TransactionLogVehicle','plate_state',COUNT(__d0(__NL(Plate_State_))),COUNT(__d0(__NN(Plate_State_)))},
    {'Vehicle','transaction_log_vehicle.TransactionLogVehicle','DateFirstSeen',COUNT(__d0(Date_First_Seen_=0)),COUNT(__d0(Date_First_Seen_!=0))},
    {'Vehicle','transaction_log_vehicle.TransactionLogVehicle','DateLastSeen',COUNT(__d0(Date_Last_Seen_=0)),COUNT(__d0(Date_Last_Seen_!=0))}]
  ,{KEL.typ.str entity,KEL.typ.str fileName,KEL.typ.str fieldName,KEL.typ.int nullCount,KEL.typ.int notNullCount});
END;
