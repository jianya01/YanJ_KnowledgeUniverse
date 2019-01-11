//HPCC Systems KEL Compiler Version 0.11.6
IMPORT KEL011 AS KEL;
IMPORT inquiry_history,transaction_log_vehicle;
IMPORT * FROM KEL011.Null;
EXPORT E_Vehicle := MODULE
  EXPORT Typ := KEL.typ.uid;
  EXPORT InLayout := RECORD
    KEL.typ.nuid UID;
    KEL.typ.nstr Vin_;
    KEL.typ.nstr Transaction_I_D_;
    KEL.typ.nint Year_Make_;
    KEL.typ.nstr Vehicle_Make_;
    KEL.typ.nstr Vehicle_Model_;
    KEL.typ.nstr Body_;
    KEL.typ.nstr Engine_;
    KEL.typ.nstr Country_Of_Assembly_;
    KEL.typ.nstr Class_;
    KEL.typ.nint Result_Code_;
    KEL.typ.nstr Result_Message_;
    KEL.typ.nint Historical_Events_Count_;
    KEL.typ.nbool Is_Odometer_Reading_;
    KEL.typ.nbool Is_Mixed_Odometer_Reading_;
    KEL.typ.nbool Is_Possible_Rollback_;
    KEL.typ.nbool Is_Auto_Check_Assured_;
    KEL.typ.nint B_B_P_;
    KEL.typ.nfloat Last_Odometer_;
    KEL.typ.nint Accident_Count_;
    KEL.typ.nint Recall_Count_;
    KEL.typ.nbool Is_Condition_Report_;
    KEL.typ.nbool Is_Recall_Data_Available_;
    KEL.typ.nfloat Estimated_Average_Miles_;
    KEL.typ.nint Reported_Owner_Count_;
    KEL.typ.nint Reported_Age_;
    KEL.typ.nint Reported_Score_;
    KEL.typ.nint Reported_Compare_Score_Range_High_;
    KEL.typ.nint Reported_Compare_Score_Range_Low_;
    KEL.typ.nstr Reported_Positive_Score_Factor1_;
    KEL.typ.nstr Reported_Positive_Score_Factor2_;
    KEL.typ.nstr Reported_Positive_Score_Factor3_;
    KEL.typ.nstr Reported_Negative_Score_Factor1_;
    KEL.typ.nstr Reported_Negative_Score_Factor2_;
    KEL.typ.nstr Reported_Negative_Score_Factor3_;
    KEL.typ.epoch Date_First_Seen_ := 0;
    KEL.typ.epoch Date_Last_Seen_ := 0;
  END;
  SHARED VIRTUAL __SourceFilter(DATASET(InLayout) __ds) := __ds;
  SHARED VIRTUAL __GroupedFilter(GROUPED DATASET(InLayout) __ds) := __ds;
  SHARED __Mapping := 'UID(UID),vin(Vin_:\'\'),transactionid(Transaction_I_D_:\'\'),yearmake(Year_Make_:0),vehiclemake(Vehicle_Make_:\'\'),vehiclemodel(Vehicle_Model_:\'\'),body(Body_:\'\'),engine(Engine_:\'\'),countryofassembly(Country_Of_Assembly_:\'\'),class(Class_:\'\'),resultcode(Result_Code_:0),resultmessage(Result_Message_:\'\'),historicaleventscount(Historical_Events_Count_:0),isodometerreading(Is_Odometer_Reading_),ismixedodometerreading(Is_Mixed_Odometer_Reading_),ispossiblerollback(Is_Possible_Rollback_),isautocheckassured(Is_Auto_Check_Assured_),bbp(B_B_P_:0),lastodometer(Last_Odometer_:0.0),accidentcount(Accident_Count_:0),recallcount(Recall_Count_:0),isconditionreport(Is_Condition_Report_),isrecalldataavailable(Is_Recall_Data_Available_),estimatedaveragemiles(Estimated_Average_Miles_:0.0),reportedownercount(Reported_Owner_Count_:0),reportedage(Reported_Age_:0),reportedscore(Reported_Score_:0),reportedcomparescorerangehigh(Reported_Compare_Score_Range_High_:0),reportedcomparescorerangelow(Reported_Compare_Score_Range_Low_:0),reportedpositivescorefactor1(Reported_Positive_Score_Factor1_:\'\'),reportedpositivescorefactor2(Reported_Positive_Score_Factor2_:\'\'),reportedpositivescorefactor3(Reported_Positive_Score_Factor3_:\'\'),reportednegativescorefactor1(Reported_Negative_Score_Factor1_:\'\'),reportednegativescorefactor2(Reported_Negative_Score_Factor2_:\'\'),reportednegativescorefactor3(Reported_Negative_Score_Factor3_:\'\'),datefirstseen(Date_First_Seen_:EPOCH),datelastseen(Date_Last_Seen_:EPOCH)';
  SHARED __Trimmed := RECORD, MAXLENGTH(5000)
    STRING KeyVal;
  END;
  SHARED __d0_Trim := PROJECT(inquiry_history.IntermediateLog.Vehicles,TRANSFORM(__Trimmed,SELF.KeyVal:=TRIM((STRING)LEFT.transaction_id) + '|' + TRIM((STRING)LEFT.vin)));
  SHARED __d1_Trim := PROJECT(transaction_log_vehicle.TransactionLogVehicle,TRANSFORM(__Trimmed,SELF.KeyVal:=TRIM((STRING)LEFT.transaction_id) + '|' + TRIM((STRING)LEFT.vin)));
  EXPORT __All_Trim := __d0_Trim + __d1_Trim;
  SHARED __TabRec := RECORD, MAXLENGTH(5000)
    __All_Trim.KeyVal;
    UNSIGNED4 Cnt := COUNT(GROUP);
    KEL.typ.uid UID := 0;
  END;
  EXPORT NullKeyVal := TRIM((STRING)'') + '|' + TRIM((STRING)'');
  SHARED __Table := TABLE(__All_Trim(KeyVal <> NullKeyVal),__TabRec,KeyVal,MERGE);
  SHARED NullLookupRec := DATASET([{NullKeyVal,1,0}],__TabRec);
  EXPORT Lookup := NullLookupRec + PROJECT(__Table,TRANSFORM(__TabRec,SELF.UID:=COUNTER,SELF:=LEFT)) : PERSIST('~temp::KEL::KnowledgeUniverse::VehicleHistoryReport_KEL::Vehicle::UidLookup',EXPIRE(30));
  EXPORT UID_IdToText := INDEX(Lookup,{UID},{Lookup},'~temp::KEL::IDtoT::KnowledgeUniverse::VehicleHistoryReport_KEL::Vehicle');
  EXPORT UID_TextToId := INDEX(Lookup,{ht:=HASH32(KeyVal)},{Lookup},'~temp::KEL::TtoID::KnowledgeUniverse::VehicleHistoryReport_KEL::Vehicle');
  EXPORT BuildAll := PARALLEL(BUILDINDEX(UID_IdToText,OVERWRITE),BUILDINDEX(UID_TextToId,OVERWRITE));
  EXPORT GetText(KEL.typ.uid i) := UID_IdToText(UID=i)[1];
  EXPORT GetId(STRING s) := UID_TextToId(ht=HASH32(s),KeyVal=s)[1];
  SHARED __Mapping0 := 'UID(UID),vin(Vin_:\'\'),transaction_id(Transaction_I_D_:\'\'),vindecode.year(Year_Make_:0),vindecode.mfg(Vehicle_Make_:\'\'),vindecode.model(Vehicle_Model_:\'\'),vindecode.body(Body_:\'\'),vindecode.engine(Engine_:\'\'),vindecode.country(Country_Of_Assembly_:\'\'),vindecode.class(Class_:\'\'),vindecode.resultcode(Result_Code_:0),vindecode.resultmessage(Result_Message_:\'\'),history.count(Historical_Events_Count_:0),history.odometer(Is_Odometer_Reading_),history.mixedodometer(Is_Mixed_Odometer_Reading_),history.rollback(Is_Possible_Rollback_),history.assured(Is_Auto_Check_Assured_),history.bbp(B_B_P_:0),history.lastodometer(Last_Odometer_:0.0),history.accidentcount(Accident_Count_:0),history.recallcount(Recall_Count_:0),history.conditionrpt(Is_Condition_Report_),history.recalldataavailable(Is_Recall_Data_Available_),history.estimatedaveragemiles(Estimated_Average_Miles_:0.0),ownercount(Reported_Owner_Count_:0),age(Reported_Age_:0),score(Reported_Score_:0),comparescorerangehigh(Reported_Compare_Score_Range_High_:0),comparescorerangelow(Reported_Compare_Score_Range_Low_:0),posscorefactor1(Reported_Positive_Score_Factor1_:\'\'),posscorefactor2(Reported_Positive_Score_Factor2_:\'\'),posscorefactor3(Reported_Positive_Score_Factor3_:\'\'),negscorefactor1(Reported_Negative_Score_Factor1_:\'\'),negscorefactor2(Reported_Negative_Score_Factor2_:\'\'),negscorefactor3(Reported_Negative_Score_Factor3_:\'\'),datefirstseen(Date_First_Seen_:EPOCH),datelastseen(Date_Last_Seen_:EPOCH)';
  SHARED __d0_Out := RECORD
    RECORDOF(inquiry_history.IntermediateLog.Vehicles);
    KEL.typ.uid UID := 0;
  END;
  SHARED __d0_UID_Mapped := JOIN(inquiry_history.IntermediateLog.Vehicles,Lookup,TRIM((STRING)LEFT.transaction_id) + '|' + TRIM((STRING)LEFT.vin) = RIGHT.KeyVal,TRANSFORM(__d0_Out,SELF.UID:=RIGHT.UID,SELF:=LEFT),HASH);
  EXPORT inquiry_history_IntermediateLog_Vehicles_Invalid := __d0_UID_Mapped(UID = 0);
  SHARED __d0_Prefiltered := __d0_UID_Mapped(UID <> 0);
  SHARED __d0 := __SourceFilter(KEL.FromFlat.Convert(__d0_Prefiltered,InLayout,__Mapping0));
  SHARED __Mapping1 := 'UID(UID),vin(Vin_:\'\'),transaction_id(Transaction_I_D_:\'\'),model_year(Year_Make_:0),make(Vehicle_Make_:\'\'),model(Vehicle_Model_:\'\'),body(Body_:\'\'),engine(Engine_:\'\'),countryofassembly(Country_Of_Assembly_:\'\'),class(Class_:\'\'),resultcode(Result_Code_:0),resultmessage(Result_Message_:\'\'),historicaleventscount(Historical_Events_Count_:0),isodometerreading(Is_Odometer_Reading_),ismixedodometerreading(Is_Mixed_Odometer_Reading_),ispossiblerollback(Is_Possible_Rollback_),isautocheckassured(Is_Auto_Check_Assured_),bbp(B_B_P_:0),lastodometer(Last_Odometer_:0.0),accidentcount(Accident_Count_:0),recallcount(Recall_Count_:0),isconditionreport(Is_Condition_Report_),isrecalldataavailable(Is_Recall_Data_Available_),estimatedaveragemiles(Estimated_Average_Miles_:0.0),reportedownercount(Reported_Owner_Count_:0),reportedage(Reported_Age_:0),reportedscore(Reported_Score_:0),reportedcomparescorerangehigh(Reported_Compare_Score_Range_High_:0),reportedcomparescorerangelow(Reported_Compare_Score_Range_Low_:0),reportedpositivescorefactor1(Reported_Positive_Score_Factor1_:\'\'),reportedpositivescorefactor2(Reported_Positive_Score_Factor2_:\'\'),reportedpositivescorefactor3(Reported_Positive_Score_Factor3_:\'\'),reportednegativescorefactor1(Reported_Negative_Score_Factor1_:\'\'),reportednegativescorefactor2(Reported_Negative_Score_Factor2_:\'\'),reportednegativescorefactor3(Reported_Negative_Score_Factor3_:\'\'),date_added(Date_First_Seen_:EPOCH|Date_Last_Seen_:EPOCH)';
  SHARED __d1_Out := RECORD
    RECORDOF(transaction_log_vehicle.TransactionLogVehicle);
    KEL.typ.uid UID := 0;
  END;
  SHARED __d1_UID_Mapped := JOIN(transaction_log_vehicle.TransactionLogVehicle,Lookup,TRIM((STRING)LEFT.transaction_id) + '|' + TRIM((STRING)LEFT.vin) = RIGHT.KeyVal,TRANSFORM(__d1_Out,SELF.UID:=RIGHT.UID,SELF:=LEFT),HASH);
  EXPORT transaction_log_vehicle_TransactionLogVehicle_Invalid := __d1_UID_Mapped(UID = 0);
  SHARED __d1_Prefiltered := __d1_UID_Mapped(UID <> 0);
  SHARED __d1 := __SourceFilter(KEL.FromFlat.Convert(__d1_Prefiltered,InLayout,__Mapping1));
  EXPORT InData := __d0 + __d1;
  EXPORT Layout := RECORD
    KEL.typ.nuid UID;
    KEL.typ.nstr Vin_;
    KEL.typ.nstr Transaction_I_D_;
    KEL.typ.nint Year_Make_;
    KEL.typ.nstr Vehicle_Make_;
    KEL.typ.nstr Vehicle_Model_;
    KEL.typ.nstr Body_;
    KEL.typ.nstr Engine_;
    KEL.typ.nstr Country_Of_Assembly_;
    KEL.typ.nstr Class_;
    KEL.typ.nint Result_Code_;
    KEL.typ.nstr Result_Message_;
    KEL.typ.nint Historical_Events_Count_;
    KEL.typ.nbool Is_Odometer_Reading_;
    KEL.typ.nbool Is_Mixed_Odometer_Reading_;
    KEL.typ.nbool Is_Possible_Rollback_;
    KEL.typ.nbool Is_Auto_Check_Assured_;
    KEL.typ.nint B_B_P_;
    KEL.typ.nfloat Last_Odometer_;
    KEL.typ.nint Accident_Count_;
    KEL.typ.nint Recall_Count_;
    KEL.typ.nbool Is_Condition_Report_;
    KEL.typ.nbool Is_Recall_Data_Available_;
    KEL.typ.nfloat Estimated_Average_Miles_;
    KEL.typ.nint Reported_Owner_Count_;
    KEL.typ.nint Reported_Age_;
    KEL.typ.nint Reported_Score_;
    KEL.typ.nint Reported_Compare_Score_Range_High_;
    KEL.typ.nint Reported_Compare_Score_Range_Low_;
    KEL.typ.nstr Reported_Positive_Score_Factor1_;
    KEL.typ.nstr Reported_Positive_Score_Factor2_;
    KEL.typ.nstr Reported_Positive_Score_Factor3_;
    KEL.typ.nstr Reported_Negative_Score_Factor1_;
    KEL.typ.nstr Reported_Negative_Score_Factor2_;
    KEL.typ.nstr Reported_Negative_Score_Factor3_;
    KEL.typ.epoch Date_First_Seen_ := 0;
    KEL.typ.epoch Date_Last_Seen_ := 0;
    KEL.typ.int __RecordCount := 0;
  END;
  EXPORT __PostFilter := __GroupedFilter(GROUP(DISTRIBUTE(InData,HASH(UID)),UID,LOCAL,ALL));
  Vehicle_Group := __PostFilter;
  Layout Vehicle__Rollup(InLayout __r, DATASET(InLayout) __recs) := TRANSFORM
    SELF.Vin_ := KEL.Intake.SingleValue(__recs,Vin_);
    SELF.Transaction_I_D_ := KEL.Intake.SingleValue(__recs,Transaction_I_D_);
    SELF.Year_Make_ := KEL.Intake.SingleValue(__recs,Year_Make_);
    SELF.Vehicle_Make_ := KEL.Intake.SingleValue(__recs,Vehicle_Make_);
    SELF.Vehicle_Model_ := KEL.Intake.SingleValue(__recs,Vehicle_Model_);
    SELF.Body_ := KEL.Intake.SingleValue(__recs,Body_);
    SELF.Engine_ := KEL.Intake.SingleValue(__recs,Engine_);
    SELF.Country_Of_Assembly_ := KEL.Intake.SingleValue(__recs,Country_Of_Assembly_);
    SELF.Class_ := KEL.Intake.SingleValue(__recs,Class_);
    SELF.Result_Code_ := KEL.Intake.SingleValue(__recs,Result_Code_);
    SELF.Result_Message_ := KEL.Intake.SingleValue(__recs,Result_Message_);
    SELF.Historical_Events_Count_ := KEL.Intake.SingleValue(__recs,Historical_Events_Count_);
    SELF.Is_Odometer_Reading_ := KEL.Intake.SingleValue(__recs,Is_Odometer_Reading_);
    SELF.Is_Mixed_Odometer_Reading_ := KEL.Intake.SingleValue(__recs,Is_Mixed_Odometer_Reading_);
    SELF.Is_Possible_Rollback_ := KEL.Intake.SingleValue(__recs,Is_Possible_Rollback_);
    SELF.Is_Auto_Check_Assured_ := KEL.Intake.SingleValue(__recs,Is_Auto_Check_Assured_);
    SELF.B_B_P_ := KEL.Intake.SingleValue(__recs,B_B_P_);
    SELF.Last_Odometer_ := KEL.Intake.SingleValue(__recs,Last_Odometer_);
    SELF.Accident_Count_ := KEL.Intake.SingleValue(__recs,Accident_Count_);
    SELF.Recall_Count_ := KEL.Intake.SingleValue(__recs,Recall_Count_);
    SELF.Is_Condition_Report_ := KEL.Intake.SingleValue(__recs,Is_Condition_Report_);
    SELF.Is_Recall_Data_Available_ := KEL.Intake.SingleValue(__recs,Is_Recall_Data_Available_);
    SELF.Estimated_Average_Miles_ := KEL.Intake.SingleValue(__recs,Estimated_Average_Miles_);
    SELF.Reported_Owner_Count_ := KEL.Intake.SingleValue(__recs,Reported_Owner_Count_);
    SELF.Reported_Age_ := KEL.Intake.SingleValue(__recs,Reported_Age_);
    SELF.Reported_Score_ := KEL.Intake.SingleValue(__recs,Reported_Score_);
    SELF.Reported_Compare_Score_Range_High_ := KEL.Intake.SingleValue(__recs,Reported_Compare_Score_Range_High_);
    SELF.Reported_Compare_Score_Range_Low_ := KEL.Intake.SingleValue(__recs,Reported_Compare_Score_Range_Low_);
    SELF.Reported_Positive_Score_Factor1_ := KEL.Intake.SingleValue(__recs,Reported_Positive_Score_Factor1_);
    SELF.Reported_Positive_Score_Factor2_ := KEL.Intake.SingleValue(__recs,Reported_Positive_Score_Factor2_);
    SELF.Reported_Positive_Score_Factor3_ := KEL.Intake.SingleValue(__recs,Reported_Positive_Score_Factor3_);
    SELF.Reported_Negative_Score_Factor1_ := KEL.Intake.SingleValue(__recs,Reported_Negative_Score_Factor1_);
    SELF.Reported_Negative_Score_Factor2_ := KEL.Intake.SingleValue(__recs,Reported_Negative_Score_Factor2_);
    SELF.Reported_Negative_Score_Factor3_ := KEL.Intake.SingleValue(__recs,Reported_Negative_Score_Factor3_);
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
  EXPORT Transaction_I_D__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Transaction_I_D_);
  EXPORT Year_Make__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Year_Make_);
  EXPORT Vehicle_Make__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Vehicle_Make_);
  EXPORT Vehicle_Model__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Vehicle_Model_);
  EXPORT Body__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Body_);
  EXPORT Engine__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Engine_);
  EXPORT Country_Of_Assembly__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Country_Of_Assembly_);
  EXPORT Class__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Class_);
  EXPORT Result_Code__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Result_Code_);
  EXPORT Result_Message__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Result_Message_);
  EXPORT Historical_Events_Count__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Historical_Events_Count_);
  EXPORT Is_Odometer_Reading__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Is_Odometer_Reading_);
  EXPORT Is_Mixed_Odometer_Reading__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Is_Mixed_Odometer_Reading_);
  EXPORT Is_Possible_Rollback__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Is_Possible_Rollback_);
  EXPORT Is_Auto_Check_Assured__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Is_Auto_Check_Assured_);
  EXPORT B_B_P__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,B_B_P_);
  EXPORT Last_Odometer__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Last_Odometer_);
  EXPORT Accident_Count__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Accident_Count_);
  EXPORT Recall_Count__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Recall_Count_);
  EXPORT Is_Condition_Report__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Is_Condition_Report_);
  EXPORT Is_Recall_Data_Available__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Is_Recall_Data_Available_);
  EXPORT Estimated_Average_Miles__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Estimated_Average_Miles_);
  EXPORT Reported_Owner_Count__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Reported_Owner_Count_);
  EXPORT Reported_Age__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Reported_Age_);
  EXPORT Reported_Score__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Reported_Score_);
  EXPORT Reported_Compare_Score_Range_High__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Reported_Compare_Score_Range_High_);
  EXPORT Reported_Compare_Score_Range_Low__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Reported_Compare_Score_Range_Low_);
  EXPORT Reported_Positive_Score_Factor1__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Reported_Positive_Score_Factor1_);
  EXPORT Reported_Positive_Score_Factor2__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Reported_Positive_Score_Factor2_);
  EXPORT Reported_Positive_Score_Factor3__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Reported_Positive_Score_Factor3_);
  EXPORT Reported_Negative_Score_Factor1__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Reported_Negative_Score_Factor1_);
  EXPORT Reported_Negative_Score_Factor2__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Reported_Negative_Score_Factor2_);
  EXPORT Reported_Negative_Score_Factor3__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Reported_Negative_Score_Factor3_);
  EXPORT SanityCheck := DATASET([{COUNT(inquiry_history_IntermediateLog_Vehicles_Invalid),COUNT(transaction_log_vehicle_TransactionLogVehicle_Invalid),COUNT(Vin__SingleValue_Invalid),COUNT(Transaction_I_D__SingleValue_Invalid),COUNT(Year_Make__SingleValue_Invalid),COUNT(Vehicle_Make__SingleValue_Invalid),COUNT(Vehicle_Model__SingleValue_Invalid),COUNT(Body__SingleValue_Invalid),COUNT(Engine__SingleValue_Invalid),COUNT(Country_Of_Assembly__SingleValue_Invalid),COUNT(Class__SingleValue_Invalid),COUNT(Result_Code__SingleValue_Invalid),COUNT(Result_Message__SingleValue_Invalid),COUNT(Historical_Events_Count__SingleValue_Invalid),COUNT(Is_Odometer_Reading__SingleValue_Invalid),COUNT(Is_Mixed_Odometer_Reading__SingleValue_Invalid),COUNT(Is_Possible_Rollback__SingleValue_Invalid),COUNT(Is_Auto_Check_Assured__SingleValue_Invalid),COUNT(B_B_P__SingleValue_Invalid),COUNT(Last_Odometer__SingleValue_Invalid),COUNT(Accident_Count__SingleValue_Invalid),COUNT(Recall_Count__SingleValue_Invalid),COUNT(Is_Condition_Report__SingleValue_Invalid),COUNT(Is_Recall_Data_Available__SingleValue_Invalid),COUNT(Estimated_Average_Miles__SingleValue_Invalid),COUNT(Reported_Owner_Count__SingleValue_Invalid),COUNT(Reported_Age__SingleValue_Invalid),COUNT(Reported_Score__SingleValue_Invalid),COUNT(Reported_Compare_Score_Range_High__SingleValue_Invalid),COUNT(Reported_Compare_Score_Range_Low__SingleValue_Invalid),COUNT(Reported_Positive_Score_Factor1__SingleValue_Invalid),COUNT(Reported_Positive_Score_Factor2__SingleValue_Invalid),COUNT(Reported_Positive_Score_Factor3__SingleValue_Invalid),COUNT(Reported_Negative_Score_Factor1__SingleValue_Invalid),COUNT(Reported_Negative_Score_Factor2__SingleValue_Invalid),COUNT(Reported_Negative_Score_Factor3__SingleValue_Invalid)}],{KEL.typ.int inquiry_history_IntermediateLog_Vehicles_Invalid,KEL.typ.int transaction_log_vehicle_TransactionLogVehicle_Invalid,KEL.typ.int Vin__SingleValue_Invalid,KEL.typ.int Transaction_I_D__SingleValue_Invalid,KEL.typ.int Year_Make__SingleValue_Invalid,KEL.typ.int Vehicle_Make__SingleValue_Invalid,KEL.typ.int Vehicle_Model__SingleValue_Invalid,KEL.typ.int Body__SingleValue_Invalid,KEL.typ.int Engine__SingleValue_Invalid,KEL.typ.int Country_Of_Assembly__SingleValue_Invalid,KEL.typ.int Class__SingleValue_Invalid,KEL.typ.int Result_Code__SingleValue_Invalid,KEL.typ.int Result_Message__SingleValue_Invalid,KEL.typ.int Historical_Events_Count__SingleValue_Invalid,KEL.typ.int Is_Odometer_Reading__SingleValue_Invalid,KEL.typ.int Is_Mixed_Odometer_Reading__SingleValue_Invalid,KEL.typ.int Is_Possible_Rollback__SingleValue_Invalid,KEL.typ.int Is_Auto_Check_Assured__SingleValue_Invalid,KEL.typ.int B_B_P__SingleValue_Invalid,KEL.typ.int Last_Odometer__SingleValue_Invalid,KEL.typ.int Accident_Count__SingleValue_Invalid,KEL.typ.int Recall_Count__SingleValue_Invalid,KEL.typ.int Is_Condition_Report__SingleValue_Invalid,KEL.typ.int Is_Recall_Data_Available__SingleValue_Invalid,KEL.typ.int Estimated_Average_Miles__SingleValue_Invalid,KEL.typ.int Reported_Owner_Count__SingleValue_Invalid,KEL.typ.int Reported_Age__SingleValue_Invalid,KEL.typ.int Reported_Score__SingleValue_Invalid,KEL.typ.int Reported_Compare_Score_Range_High__SingleValue_Invalid,KEL.typ.int Reported_Compare_Score_Range_Low__SingleValue_Invalid,KEL.typ.int Reported_Positive_Score_Factor1__SingleValue_Invalid,KEL.typ.int Reported_Positive_Score_Factor2__SingleValue_Invalid,KEL.typ.int Reported_Positive_Score_Factor3__SingleValue_Invalid,KEL.typ.int Reported_Negative_Score_Factor1__SingleValue_Invalid,KEL.typ.int Reported_Negative_Score_Factor2__SingleValue_Invalid,KEL.typ.int Reported_Negative_Score_Factor3__SingleValue_Invalid});
  EXPORT NullCounts := DATASET([
    {'Vehicle','inquiry_history.IntermediateLog.Vehicles','UID',COUNT(inquiry_history_IntermediateLog_Vehicles_Invalid),COUNT(__d0)},
    {'Vehicle','inquiry_history.IntermediateLog.Vehicles','vin',COUNT(__d0(__NL(Vin_))),COUNT(__d0(__NN(Vin_)))},
    {'Vehicle','inquiry_history.IntermediateLog.Vehicles','transaction_id',COUNT(__d0(__NL(Transaction_I_D_))),COUNT(__d0(__NN(Transaction_I_D_)))},
    {'Vehicle','inquiry_history.IntermediateLog.Vehicles','VINDecode.Year',COUNT(__d0(__NL(Year_Make_))),COUNT(__d0(__NN(Year_Make_)))},
    {'Vehicle','inquiry_history.IntermediateLog.Vehicles','VINDecode.Mfg',COUNT(__d0(__NL(Vehicle_Make_))),COUNT(__d0(__NN(Vehicle_Make_)))},
    {'Vehicle','inquiry_history.IntermediateLog.Vehicles','VINDecode.Model',COUNT(__d0(__NL(Vehicle_Model_))),COUNT(__d0(__NN(Vehicle_Model_)))},
    {'Vehicle','inquiry_history.IntermediateLog.Vehicles','VINDecode.Body',COUNT(__d0(__NL(Body_))),COUNT(__d0(__NN(Body_)))},
    {'Vehicle','inquiry_history.IntermediateLog.Vehicles','VINDecode.Engine',COUNT(__d0(__NL(Engine_))),COUNT(__d0(__NN(Engine_)))},
    {'Vehicle','inquiry_history.IntermediateLog.Vehicles','VINDecode.Country',COUNT(__d0(__NL(Country_Of_Assembly_))),COUNT(__d0(__NN(Country_Of_Assembly_)))},
    {'Vehicle','inquiry_history.IntermediateLog.Vehicles','VINDecode.Class',COUNT(__d0(__NL(Class_))),COUNT(__d0(__NN(Class_)))},
    {'Vehicle','inquiry_history.IntermediateLog.Vehicles','VINDecode.ResultCode',COUNT(__d0(__NL(Result_Code_))),COUNT(__d0(__NN(Result_Code_)))},
    {'Vehicle','inquiry_history.IntermediateLog.Vehicles','VINDecode.ResultMessage',COUNT(__d0(__NL(Result_Message_))),COUNT(__d0(__NN(Result_Message_)))},
    {'Vehicle','inquiry_history.IntermediateLog.Vehicles','History.Count',COUNT(__d0(__NL(Historical_Events_Count_))),COUNT(__d0(__NN(Historical_Events_Count_)))},
    {'Vehicle','inquiry_history.IntermediateLog.Vehicles','History.Odometer',COUNT(__d0(__NL(Is_Odometer_Reading_))),COUNT(__d0(__NN(Is_Odometer_Reading_)))},
    {'Vehicle','inquiry_history.IntermediateLog.Vehicles','History.MixedOdometer',COUNT(__d0(__NL(Is_Mixed_Odometer_Reading_))),COUNT(__d0(__NN(Is_Mixed_Odometer_Reading_)))},
    {'Vehicle','inquiry_history.IntermediateLog.Vehicles','History.Rollback',COUNT(__d0(__NL(Is_Possible_Rollback_))),COUNT(__d0(__NN(Is_Possible_Rollback_)))},
    {'Vehicle','inquiry_history.IntermediateLog.Vehicles','History.Assured',COUNT(__d0(__NL(Is_Auto_Check_Assured_))),COUNT(__d0(__NN(Is_Auto_Check_Assured_)))},
    {'Vehicle','inquiry_history.IntermediateLog.Vehicles','History.BBP',COUNT(__d0(__NL(B_B_P_))),COUNT(__d0(__NN(B_B_P_)))},
    {'Vehicle','inquiry_history.IntermediateLog.Vehicles','History.LastOdometer',COUNT(__d0(__NL(Last_Odometer_))),COUNT(__d0(__NN(Last_Odometer_)))},
    {'Vehicle','inquiry_history.IntermediateLog.Vehicles','History.AccidentCount',COUNT(__d0(__NL(Accident_Count_))),COUNT(__d0(__NN(Accident_Count_)))},
    {'Vehicle','inquiry_history.IntermediateLog.Vehicles','History.RecallCount',COUNT(__d0(__NL(Recall_Count_))),COUNT(__d0(__NN(Recall_Count_)))},
    {'Vehicle','inquiry_history.IntermediateLog.Vehicles','History.ConditionRpt',COUNT(__d0(__NL(Is_Condition_Report_))),COUNT(__d0(__NN(Is_Condition_Report_)))},
    {'Vehicle','inquiry_history.IntermediateLog.Vehicles','History.RecallDataAvailable',COUNT(__d0(__NL(Is_Recall_Data_Available_))),COUNT(__d0(__NN(Is_Recall_Data_Available_)))},
    {'Vehicle','inquiry_history.IntermediateLog.Vehicles','History.EstimatedAverageMiles',COUNT(__d0(__NL(Estimated_Average_Miles_))),COUNT(__d0(__NN(Estimated_Average_Miles_)))},
    {'Vehicle','inquiry_history.IntermediateLog.Vehicles','OwnerCount',COUNT(__d0(__NL(Reported_Owner_Count_))),COUNT(__d0(__NN(Reported_Owner_Count_)))},
    {'Vehicle','inquiry_history.IntermediateLog.Vehicles','Age',COUNT(__d0(__NL(Reported_Age_))),COUNT(__d0(__NN(Reported_Age_)))},
    {'Vehicle','inquiry_history.IntermediateLog.Vehicles','Score',COUNT(__d0(__NL(Reported_Score_))),COUNT(__d0(__NN(Reported_Score_)))},
    {'Vehicle','inquiry_history.IntermediateLog.Vehicles','CompareScoreRangeHigh',COUNT(__d0(__NL(Reported_Compare_Score_Range_High_))),COUNT(__d0(__NN(Reported_Compare_Score_Range_High_)))},
    {'Vehicle','inquiry_history.IntermediateLog.Vehicles','CompareScoreRangeLow',COUNT(__d0(__NL(Reported_Compare_Score_Range_Low_))),COUNT(__d0(__NN(Reported_Compare_Score_Range_Low_)))},
    {'Vehicle','inquiry_history.IntermediateLog.Vehicles','PosScoreFactor1',COUNT(__d0(__NL(Reported_Positive_Score_Factor1_))),COUNT(__d0(__NN(Reported_Positive_Score_Factor1_)))},
    {'Vehicle','inquiry_history.IntermediateLog.Vehicles','PosScoreFactor2',COUNT(__d0(__NL(Reported_Positive_Score_Factor2_))),COUNT(__d0(__NN(Reported_Positive_Score_Factor2_)))},
    {'Vehicle','inquiry_history.IntermediateLog.Vehicles','PosScoreFactor3',COUNT(__d0(__NL(Reported_Positive_Score_Factor3_))),COUNT(__d0(__NN(Reported_Positive_Score_Factor3_)))},
    {'Vehicle','inquiry_history.IntermediateLog.Vehicles','NegScoreFactor1',COUNT(__d0(__NL(Reported_Negative_Score_Factor1_))),COUNT(__d0(__NN(Reported_Negative_Score_Factor1_)))},
    {'Vehicle','inquiry_history.IntermediateLog.Vehicles','NegScoreFactor2',COUNT(__d0(__NL(Reported_Negative_Score_Factor2_))),COUNT(__d0(__NN(Reported_Negative_Score_Factor2_)))},
    {'Vehicle','inquiry_history.IntermediateLog.Vehicles','NegScoreFactor3',COUNT(__d0(__NL(Reported_Negative_Score_Factor3_))),COUNT(__d0(__NN(Reported_Negative_Score_Factor3_)))},
    {'Vehicle','inquiry_history.IntermediateLog.Vehicles','DateFirstSeen',COUNT(__d0(Date_First_Seen_=0)),COUNT(__d0(Date_First_Seen_!=0))},
    {'Vehicle','inquiry_history.IntermediateLog.Vehicles','DateLastSeen',COUNT(__d0(Date_Last_Seen_=0)),COUNT(__d0(Date_Last_Seen_!=0))},
    {'Vehicle','transaction_log_vehicle.TransactionLogVehicle','UID',COUNT(transaction_log_vehicle_TransactionLogVehicle_Invalid),COUNT(__d1)},
    {'Vehicle','transaction_log_vehicle.TransactionLogVehicle','vin',COUNT(__d1(__NL(Vin_))),COUNT(__d1(__NN(Vin_)))},
    {'Vehicle','transaction_log_vehicle.TransactionLogVehicle','transaction_id',COUNT(__d1(__NL(Transaction_I_D_))),COUNT(__d1(__NN(Transaction_I_D_)))},
    {'Vehicle','transaction_log_vehicle.TransactionLogVehicle','model_year',COUNT(__d1(__NL(Year_Make_))),COUNT(__d1(__NN(Year_Make_)))},
    {'Vehicle','transaction_log_vehicle.TransactionLogVehicle','make',COUNT(__d1(__NL(Vehicle_Make_))),COUNT(__d1(__NN(Vehicle_Make_)))},
    {'Vehicle','transaction_log_vehicle.TransactionLogVehicle','model',COUNT(__d1(__NL(Vehicle_Model_))),COUNT(__d1(__NN(Vehicle_Model_)))},
    {'Vehicle','transaction_log_vehicle.TransactionLogVehicle','Body',COUNT(__d1(__NL(Body_))),COUNT(__d1(__NN(Body_)))},
    {'Vehicle','transaction_log_vehicle.TransactionLogVehicle','Engine',COUNT(__d1(__NL(Engine_))),COUNT(__d1(__NN(Engine_)))},
    {'Vehicle','transaction_log_vehicle.TransactionLogVehicle','CountryOfAssembly',COUNT(__d1(__NL(Country_Of_Assembly_))),COUNT(__d1(__NN(Country_Of_Assembly_)))},
    {'Vehicle','transaction_log_vehicle.TransactionLogVehicle','Class',COUNT(__d1(__NL(Class_))),COUNT(__d1(__NN(Class_)))},
    {'Vehicle','transaction_log_vehicle.TransactionLogVehicle','ResultCode',COUNT(__d1(__NL(Result_Code_))),COUNT(__d1(__NN(Result_Code_)))},
    {'Vehicle','transaction_log_vehicle.TransactionLogVehicle','ResultMessage',COUNT(__d1(__NL(Result_Message_))),COUNT(__d1(__NN(Result_Message_)))},
    {'Vehicle','transaction_log_vehicle.TransactionLogVehicle','HistoricalEventsCount',COUNT(__d1(__NL(Historical_Events_Count_))),COUNT(__d1(__NN(Historical_Events_Count_)))},
    {'Vehicle','transaction_log_vehicle.TransactionLogVehicle','IsOdometerReading',COUNT(__d1(__NL(Is_Odometer_Reading_))),COUNT(__d1(__NN(Is_Odometer_Reading_)))},
    {'Vehicle','transaction_log_vehicle.TransactionLogVehicle','IsMixedOdometerReading',COUNT(__d1(__NL(Is_Mixed_Odometer_Reading_))),COUNT(__d1(__NN(Is_Mixed_Odometer_Reading_)))},
    {'Vehicle','transaction_log_vehicle.TransactionLogVehicle','IsPossibleRollback',COUNT(__d1(__NL(Is_Possible_Rollback_))),COUNT(__d1(__NN(Is_Possible_Rollback_)))},
    {'Vehicle','transaction_log_vehicle.TransactionLogVehicle','IsAutoCheckAssured',COUNT(__d1(__NL(Is_Auto_Check_Assured_))),COUNT(__d1(__NN(Is_Auto_Check_Assured_)))},
    {'Vehicle','transaction_log_vehicle.TransactionLogVehicle','BBP',COUNT(__d1(__NL(B_B_P_))),COUNT(__d1(__NN(B_B_P_)))},
    {'Vehicle','transaction_log_vehicle.TransactionLogVehicle','LastOdometer',COUNT(__d1(__NL(Last_Odometer_))),COUNT(__d1(__NN(Last_Odometer_)))},
    {'Vehicle','transaction_log_vehicle.TransactionLogVehicle','AccidentCount',COUNT(__d1(__NL(Accident_Count_))),COUNT(__d1(__NN(Accident_Count_)))},
    {'Vehicle','transaction_log_vehicle.TransactionLogVehicle','RecallCount',COUNT(__d1(__NL(Recall_Count_))),COUNT(__d1(__NN(Recall_Count_)))},
    {'Vehicle','transaction_log_vehicle.TransactionLogVehicle','IsConditionReport',COUNT(__d1(__NL(Is_Condition_Report_))),COUNT(__d1(__NN(Is_Condition_Report_)))},
    {'Vehicle','transaction_log_vehicle.TransactionLogVehicle','IsRecallDataAvailable',COUNT(__d1(__NL(Is_Recall_Data_Available_))),COUNT(__d1(__NN(Is_Recall_Data_Available_)))},
    {'Vehicle','transaction_log_vehicle.TransactionLogVehicle','EstimatedAverageMiles',COUNT(__d1(__NL(Estimated_Average_Miles_))),COUNT(__d1(__NN(Estimated_Average_Miles_)))},
    {'Vehicle','transaction_log_vehicle.TransactionLogVehicle','ReportedOwnerCount',COUNT(__d1(__NL(Reported_Owner_Count_))),COUNT(__d1(__NN(Reported_Owner_Count_)))},
    {'Vehicle','transaction_log_vehicle.TransactionLogVehicle','ReportedAge',COUNT(__d1(__NL(Reported_Age_))),COUNT(__d1(__NN(Reported_Age_)))},
    {'Vehicle','transaction_log_vehicle.TransactionLogVehicle','ReportedScore',COUNT(__d1(__NL(Reported_Score_))),COUNT(__d1(__NN(Reported_Score_)))},
    {'Vehicle','transaction_log_vehicle.TransactionLogVehicle','ReportedCompareScoreRangeHigh',COUNT(__d1(__NL(Reported_Compare_Score_Range_High_))),COUNT(__d1(__NN(Reported_Compare_Score_Range_High_)))},
    {'Vehicle','transaction_log_vehicle.TransactionLogVehicle','ReportedCompareScoreRangeLow',COUNT(__d1(__NL(Reported_Compare_Score_Range_Low_))),COUNT(__d1(__NN(Reported_Compare_Score_Range_Low_)))},
    {'Vehicle','transaction_log_vehicle.TransactionLogVehicle','ReportedPositiveScoreFactor1',COUNT(__d1(__NL(Reported_Positive_Score_Factor1_))),COUNT(__d1(__NN(Reported_Positive_Score_Factor1_)))},
    {'Vehicle','transaction_log_vehicle.TransactionLogVehicle','ReportedPositiveScoreFactor2',COUNT(__d1(__NL(Reported_Positive_Score_Factor2_))),COUNT(__d1(__NN(Reported_Positive_Score_Factor2_)))},
    {'Vehicle','transaction_log_vehicle.TransactionLogVehicle','ReportedPositiveScoreFactor3',COUNT(__d1(__NL(Reported_Positive_Score_Factor3_))),COUNT(__d1(__NN(Reported_Positive_Score_Factor3_)))},
    {'Vehicle','transaction_log_vehicle.TransactionLogVehicle','ReportedNegativeScoreFactor1',COUNT(__d1(__NL(Reported_Negative_Score_Factor1_))),COUNT(__d1(__NN(Reported_Negative_Score_Factor1_)))},
    {'Vehicle','transaction_log_vehicle.TransactionLogVehicle','ReportedNegativeScoreFactor2',COUNT(__d1(__NL(Reported_Negative_Score_Factor2_))),COUNT(__d1(__NN(Reported_Negative_Score_Factor2_)))},
    {'Vehicle','transaction_log_vehicle.TransactionLogVehicle','ReportedNegativeScoreFactor3',COUNT(__d1(__NL(Reported_Negative_Score_Factor3_))),COUNT(__d1(__NN(Reported_Negative_Score_Factor3_)))},
    {'Vehicle','transaction_log_vehicle.TransactionLogVehicle','DateFirstSeen',COUNT(__d1(Date_First_Seen_=0)),COUNT(__d1(Date_First_Seen_!=0))},
    {'Vehicle','transaction_log_vehicle.TransactionLogVehicle','DateLastSeen',COUNT(__d1(Date_Last_Seen_=0)),COUNT(__d1(Date_Last_Seen_!=0))}]
  ,{KEL.typ.str entity,KEL.typ.str fileName,KEL.typ.str fieldName,KEL.typ.int nullCount,KEL.typ.int notNullCount});
END;
