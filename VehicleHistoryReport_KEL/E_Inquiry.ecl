//HPCC Systems KEL Compiler Version 0.11.6
IMPORT KEL011 AS KEL;
IMPORT inquiry_history,transaction_log,transaction_log_vehicle;
IMPORT * FROM KEL011.Null;
EXPORT E_Inquiry := MODULE
  EXPORT Typ := KEL.typ.uid;
  EXPORT InLayout := RECORD
    KEL.typ.nuid UID;
    KEL.typ.nstr Transaction_I_D_;
    KEL.typ.nint Sequence_;
    KEL.typ.nint Product_I_D_;
    KEL.typ.nkdate Date_Added_;
    KEL.typ.nstr Login_I_D_;
    KEL.typ.nstr Billing_Code_;
    KEL.typ.nstr Function_Name_;
    KEL.typ.nstr Report_Code_;
    KEL.typ.nstr Account_Base_;
    KEL.typ.nstr Account_Suffix_;
    KEL.typ.nint Account_I_D_;
    KEL.typ.nint Customer_Number_;
    KEL.typ.nstr Customer_Reference_Number_;
    KEL.typ.nkdate Date_Ordered_;
    KEL.typ.nstr Reference_Number_;
    KEL.typ.nint Process_Type_;
    KEL.typ.nfloat Processing_Time_;
    KEL.typ.nstr Processing_Status_;
    KEL.typ.nint Billing_Type_I_D_;
    KEL.typ.nfloat Price_;
    KEL.typ.nint Record_Count1_;
    KEL.typ.nint Record_Count1_Type_;
    KEL.typ.nint Record_Count2_;
    KEL.typ.nint Record_Count2_Type_;
    KEL.typ.nstr Result_Format_;
    KEL.typ.nstr Report_Options_;
    KEL.typ.nstr Transaction_Code_;
    KEL.typ.nstr Return_Node_I_D_;
    KEL.typ.nstr Request_Type_;
    KEL.typ.nint Order_Status_Code_;
    KEL.typ.nstr Product_Line_;
    KEL.typ.nstr Product_Version_;
    KEL.typ.nstr Ip_Address_;
    KEL.typ.nstr Response_Time_;
    KEL.typ.nstr Vendor_Code_;
    KEL.typ.nstr Esp_Method_;
    KEL.typ.nint Batch_Job_I_D_;
    KEL.typ.nint Batch_Seq_Number_;
    KEL.typ.nstr User_Added_;
    KEL.typ.nstr User_Changed_;
    KEL.typ.nkdate Date_Changed_;
    KEL.typ.epoch Date_First_Seen_ := 0;
    KEL.typ.epoch Date_Last_Seen_ := 0;
  END;
  SHARED VIRTUAL __SourceFilter(DATASET(InLayout) __ds) := __ds;
  SHARED VIRTUAL __GroupedFilter(GROUPED DATASET(InLayout) __ds) := __ds;
  SHARED Date_Added_Rule(STRING a) := MAP(KEL.Routines.IsValidDate((KEL.typ.kdate)(a[1..4]+a[6..7]+a[9..10]))=>a[1..4]+a[6..7]+a[9..10],'0');
  SHARED Date_Ordered_Rule(STRING a) := MAP(KEL.Routines.IsValidDate((KEL.typ.kdate)(a[1..4]+a[6..7]+a[9..10]))=>a[1..4]+a[6..7]+a[9..10],'0');
  SHARED Date_Changed_Rule(STRING a) := MAP(KEL.Routines.IsValidDate((KEL.typ.kdate)(a[1..4]+a[6..7]+a[9..10]))=>a[1..4]+a[6..7]+a[9..10],'0');
  SHARED __Mapping := 'UID(UID),transactionid(Transaction_I_D_:\'\'),sequence(Sequence_:0),productid(Product_I_D_:0),dateadded(Date_Added_:DATE:Date_Added_Rule),loginid(Login_I_D_:\'\'),billingcode(Billing_Code_:\'\'),functionname(Function_Name_:\'\'),reportcode(Report_Code_:\'\'),accountbase(Account_Base_:\'\'),accountsuffix(Account_Suffix_:\'\'),accountid(Account_I_D_:0),customernumber(Customer_Number_:0),customerreferencenumber(Customer_Reference_Number_:\'\'),dateordered(Date_Ordered_:DATE:Date_Ordered_Rule),referencenumber(Reference_Number_:\'\'),processtype(Process_Type_:0),processingtime(Processing_Time_:0.0),processingstatus(Processing_Status_:\'\'),billingtypeid(Billing_Type_I_D_:0),price(Price_:0.0),recordcount1(Record_Count1_:0),recordcount1type(Record_Count1_Type_:0),recordcount2(Record_Count2_:0),recordcount2type(Record_Count2_Type_:0),resultformat(Result_Format_:\'\'),reportoptions(Report_Options_:\'\'),transactioncode(Transaction_Code_:\'\'),returnnodeid(Return_Node_I_D_:\'\'),requesttype(Request_Type_:\'\'),orderstatuscode(Order_Status_Code_:0),productline(Product_Line_:\'\'),productversion(Product_Version_:\'\'),ipaddress(Ip_Address_:\'\'),responsetime(Response_Time_:\'\'),vendorcode(Vendor_Code_:\'\'),espmethod(Esp_Method_:\'\'),batchjobid(Batch_Job_I_D_:0),batchseqnumber(Batch_Seq_Number_:0),useradded(User_Added_:\'\'),userchanged(User_Changed_:\'\'),datechanged(Date_Changed_:DATE:Date_Changed_Rule),datefirstseen(Date_First_Seen_:EPOCH),datelastseen(Date_Last_Seen_:EPOCH)';
  SHARED __Trimmed := RECORD, MAXLENGTH(5000)
    STRING KeyVal;
  END;
  SHARED __d0_Trim := PROJECT(inquiry_history.IntermediateLog.VHR,TRANSFORM(__Trimmed,SELF.KeyVal:=TRIM((STRING)LEFT.transaction_id)));
  SHARED __d1_KELfiltered := transaction_log.TransactionLog(transaction_id != '');
  SHARED __d1_Trim := PROJECT(__d1_KELfiltered,TRANSFORM(__Trimmed,SELF.KeyVal:=TRIM((STRING)LEFT.transaction_id)));
  SHARED __d2_Trim := PROJECT(transaction_log_vehicle.TransactionLogVehicle,TRANSFORM(__Trimmed,SELF.KeyVal:=TRIM((STRING)LEFT.transaction_id)));
  EXPORT __All_Trim := __d0_Trim + __d1_Trim + __d2_Trim;
  SHARED __TabRec := RECORD, MAXLENGTH(5000)
    __All_Trim.KeyVal;
    UNSIGNED4 Cnt := COUNT(GROUP);
    KEL.typ.uid UID := 0;
  END;
  EXPORT NullKeyVal := TRIM((STRING)'');
  SHARED __Table := TABLE(__All_Trim(KeyVal <> NullKeyVal),__TabRec,KeyVal,MERGE);
  SHARED NullLookupRec := DATASET([{NullKeyVal,1,0}],__TabRec);
  EXPORT Lookup := NullLookupRec + PROJECT(__Table,TRANSFORM(__TabRec,SELF.UID:=COUNTER,SELF:=LEFT)) : PERSIST('~temp::KEL::KnowledgeUniverse::VehicleHistoryReport_KEL::Inquiry::UidLookup',EXPIRE(30));
  EXPORT UID_IdToText := INDEX(Lookup,{UID},{Lookup},'~temp::KEL::IDtoT::KnowledgeUniverse::VehicleHistoryReport_KEL::Inquiry');
  EXPORT UID_TextToId := INDEX(Lookup,{ht:=HASH32(KeyVal)},{Lookup},'~temp::KEL::TtoID::KnowledgeUniverse::VehicleHistoryReport_KEL::Inquiry');
  EXPORT BuildAll := PARALLEL(BUILDINDEX(UID_IdToText,OVERWRITE),BUILDINDEX(UID_TextToId,OVERWRITE));
  EXPORT GetText(KEL.typ.uid i) := UID_IdToText(UID=i)[1];
  EXPORT GetId(STRING s) := UID_TextToId(ht=HASH32(s),KeyVal=s)[1];
  SHARED Date_Added_0Rule(STRING a) := MAP(KEL.Routines.IsValidDate((KEL.typ.kdate)(a[1..4]+a[6..7]+a[9..10]))=>a[1..4]+a[6..7]+a[9..10],'0');
  SHARED Date_Ordered_0Rule(STRING a) := MAP(KEL.Routines.IsValidDate((KEL.typ.kdate)(a[1..4]+a[6..7]+a[9..10]))=>a[1..4]+a[6..7]+a[9..10],'0');
  SHARED Date_Changed_0Rule(STRING a) := MAP(KEL.Routines.IsValidDate((KEL.typ.kdate)(a[1..4]+a[6..7]+a[9..10]))=>a[1..4]+a[6..7]+a[9..10],'0');
  SHARED __Mapping0 := 'UID(UID),transaction_id(Transaction_I_D_:\'\'),sequence(Sequence_:0),product_id(Product_I_D_:0),date_added(Date_Added_:DATE:Date_Added_0Rule|Date_First_Seen_:EPOCH|Date_Last_Seen_:EPOCH),loginid(Login_I_D_:\'\'),billingcode(Billing_Code_:\'\'),functionname(Function_Name_:\'\'),reportcode(Report_Code_:\'\'),accountbase(Account_Base_:\'\'),accountsuffix(Account_Suffix_:\'\'),accountid(Account_I_D_:0),customernumber(Customer_Number_:0),customerreferencenumber(Customer_Reference_Number_:\'\'),dateordered(Date_Ordered_:DATE:Date_Ordered_0Rule),reference_number(Reference_Number_:\'\'),process_type(Process_Type_:0),processing_time(Processing_Time_:0.0),process_status(Processing_Status_:\'\'),billingtypeid(Billing_Type_I_D_:0),price(Price_:0.0),recordcount1(Record_Count1_:0),recordcount1type(Record_Count1_Type_:0),recordcount2(Record_Count2_:0),recordcount2type(Record_Count2_Type_:0),resultformat(Result_Format_:\'\'),reportoptions(Report_Options_:\'\'),transactioncode(Transaction_Code_:\'\'),returnnodeid(Return_Node_I_D_:\'\'),request_type(Request_Type_:\'\'),orderstatuscode(Order_Status_Code_:0),productline(Product_Line_:\'\'),product_version(Product_Version_:\'\'),ipaddress(Ip_Address_:\'\'),responsetime(Response_Time_:\'\'),vendor_code(Vendor_Code_:\'\'),espmethod(Esp_Method_:\'\'),batchjobid(Batch_Job_I_D_:0),batchseqnumber(Batch_Seq_Number_:0),useradded(User_Added_:\'\'),userchanged(User_Changed_:\'\'),datechanged(Date_Changed_:DATE:Date_Changed_0Rule)';
  SHARED __d0_Out := RECORD
    RECORDOF(inquiry_history.IntermediateLog.VHR);
    KEL.typ.uid UID := 0;
  END;
  SHARED __d0_UID_Mapped := JOIN(inquiry_history.IntermediateLog.VHR,Lookup,TRIM((STRING)LEFT.transaction_id) = RIGHT.KeyVal,TRANSFORM(__d0_Out,SELF.UID:=RIGHT.UID,SELF:=LEFT),HASH);
  EXPORT inquiry_history_IntermediateLog_VHR_Invalid := __d0_UID_Mapped(UID = 0);
  SHARED __d0_Prefiltered := __d0_UID_Mapped(UID <> 0);
  SHARED __d0 := __SourceFilter(KEL.FromFlat.Convert(__d0_Prefiltered,InLayout,__Mapping0));
  SHARED Date_Added_1Rule(STRING a) := MAP(KEL.Routines.IsValidDate((KEL.typ.kdate)(a[1..4]+a[6..7]+a[9..10]))=>a[1..4]+a[6..7]+a[9..10],'0');
  SHARED Date_Ordered_1Rule(STRING a) := MAP(KEL.Routines.IsValidDate((KEL.typ.kdate)(a[1..4]+a[6..7]+a[9..10]))=>a[1..4]+a[6..7]+a[9..10],'0');
  SHARED Date_Changed_1Rule(STRING a) := MAP(KEL.Routines.IsValidDate((KEL.typ.kdate)(a[1..4]+a[6..7]+a[9..10]))=>a[1..4]+a[6..7]+a[9..10],'0');
  SHARED __Mapping1 := 'UID(UID),transaction_id(Transaction_I_D_:\'\'),sequence(Sequence_:0),product_id(Product_I_D_:0),date_added(Date_Added_:DATE:Date_Added_1Rule),login_id(Login_I_D_:\'\'),billing_code(Billing_Code_:\'\'),function_name(Function_Name_:\'\'),report_code(Report_Code_:\'\'),account_base(Account_Base_:\'\'),account_suffix(Account_Suffix_:\'\'),account_id(Account_I_D_:0),customer_number(Customer_Number_:0),customer_reference_code(Customer_Reference_Number_:\'\'),i_date_ordered(Date_Ordered_:DATE:Date_Ordered_1Rule|Date_First_Seen_:EPOCH),reference_number(Reference_Number_:\'\'),processtype(Process_Type_:0),processingtime(Processing_Time_:0.0),processing_status(Processing_Status_:\'\'),billingtypeid(Billing_Type_I_D_:0),price(Price_:0.0),record_count_1(Record_Count1_:0),record_count_1_type(Record_Count1_Type_:0),record_count_2(Record_Count2_:0),record_count_2_type(Record_Count2_Type_:0),result_format(Result_Format_:\'\'),report_options(Report_Options_:\'\'),transactioncode(Transaction_Code_:\'\'),return_node_id(Return_Node_I_D_:\'\'),requesttype(Request_Type_:\'\'),order_status_code(Order_Status_Code_:0),product_line(Product_Line_:\'\'),productversion(Product_Version_:\'\'),ip_address(Ip_Address_:\'\'),response_time(Response_Time_:\'\'),vendorcode(Vendor_Code_:\'\'),esp_method(Esp_Method_:\'\'),batch_job_id(Batch_Job_I_D_:0),batchseqnumber(Batch_Seq_Number_:0),user_added(User_Added_:\'\'),user_changed(User_Changed_:\'\'),date_changed(Date_Changed_:DATE:Date_Changed_1Rule|Date_Last_Seen_:EPOCH)';
  SHARED __d1_Out := RECORD
    RECORDOF(transaction_log.TransactionLog);
    KEL.typ.uid UID := 0;
  END;
  SHARED __d1_UID_Mapped := JOIN(__d1_KELfiltered,Lookup,TRIM((STRING)LEFT.transaction_id) = RIGHT.KeyVal,TRANSFORM(__d1_Out,SELF.UID:=RIGHT.UID,SELF:=LEFT),HASH);
  EXPORT transaction_log_TransactionLog_Invalid := __d1_UID_Mapped(UID = 0);
  SHARED __d1_Prefiltered := __d1_UID_Mapped(UID <> 0);
  SHARED __d1 := __SourceFilter(KEL.FromFlat.Convert(__d1_Prefiltered,InLayout,__Mapping1));
  SHARED Date_Added_2Rule(STRING a) := MAP(KEL.Routines.IsValidDate((KEL.typ.kdate)(a[1..4]+a[6..7]+a[9..10]))=>a[1..4]+a[6..7]+a[9..10],'0');
  SHARED Date_Ordered_2Rule(STRING a) := MAP(KEL.Routines.IsValidDate((KEL.typ.kdate)(a[1..4]+a[6..7]+a[9..10]))=>a[1..4]+a[6..7]+a[9..10],'0');
  SHARED Date_Changed_2Rule(STRING a) := MAP(KEL.Routines.IsValidDate((KEL.typ.kdate)(a[1..4]+a[6..7]+a[9..10]))=>a[1..4]+a[6..7]+a[9..10],'0');
  SHARED __Mapping2 := 'UID(UID),transaction_id(Transaction_I_D_:\'\'),sequence(Sequence_:0),product_id(Product_I_D_:0),date_added(Date_Added_:DATE:Date_Added_2Rule|Date_First_Seen_:EPOCH|Date_Last_Seen_:EPOCH),loginid(Login_I_D_:\'\'),billingcode(Billing_Code_:\'\'),functionname(Function_Name_:\'\'),reportcode(Report_Code_:\'\'),accountbase(Account_Base_:\'\'),accountsuffix(Account_Suffix_:\'\'),accountid(Account_I_D_:0),customernumber(Customer_Number_:0),customerreferencenumber(Customer_Reference_Number_:\'\'),order_date(Date_Ordered_:DATE:Date_Ordered_2Rule),referencenumber(Reference_Number_:\'\'),processtype(Process_Type_:0),processingtime(Processing_Time_:0.0),processingstatus(Processing_Status_:\'\'),billingtypeid(Billing_Type_I_D_:0),price(Price_:0.0),recordcount1(Record_Count1_:0),recordcount1type(Record_Count1_Type_:0),recordcount2(Record_Count2_:0),recordcount2type(Record_Count2_Type_:0),resultformat(Result_Format_:\'\'),reportoptions(Report_Options_:\'\'),transactioncode(Transaction_Code_:\'\'),returnnodeid(Return_Node_I_D_:\'\'),requesttype(Request_Type_:\'\'),orderstatuscode(Order_Status_Code_:0),productline(Product_Line_:\'\'),productversion(Product_Version_:\'\'),ipaddress(Ip_Address_:\'\'),responsetime(Response_Time_:\'\'),vendorcode(Vendor_Code_:\'\'),espmethod(Esp_Method_:\'\'),batchjobid(Batch_Job_I_D_:0),batchseqnumber(Batch_Seq_Number_:0),useradded(User_Added_:\'\'),userchanged(User_Changed_:\'\'),datechanged(Date_Changed_:DATE:Date_Changed_2Rule)';
  SHARED __d2_Out := RECORD
    RECORDOF(transaction_log_vehicle.TransactionLogVehicle);
    KEL.typ.uid UID := 0;
  END;
  SHARED __d2_UID_Mapped := JOIN(transaction_log_vehicle.TransactionLogVehicle,Lookup,TRIM((STRING)LEFT.transaction_id) = RIGHT.KeyVal,TRANSFORM(__d2_Out,SELF.UID:=RIGHT.UID,SELF:=LEFT),HASH);
  EXPORT transaction_log_vehicle_TransactionLogVehicle_Invalid := __d2_UID_Mapped(UID = 0);
  SHARED __d2_Prefiltered := __d2_UID_Mapped(UID <> 0);
  SHARED __d2 := __SourceFilter(KEL.FromFlat.Convert(__d2_Prefiltered,InLayout,__Mapping2));
  EXPORT InData := __d0 + __d1 + __d2;
  EXPORT Layout := RECORD
    KEL.typ.nuid UID;
    KEL.typ.nstr Transaction_I_D_;
    KEL.typ.nint Sequence_;
    KEL.typ.nint Product_I_D_;
    KEL.typ.nkdate Date_Added_;
    KEL.typ.nstr Login_I_D_;
    KEL.typ.nstr Billing_Code_;
    KEL.typ.nstr Function_Name_;
    KEL.typ.nstr Report_Code_;
    KEL.typ.nstr Account_Base_;
    KEL.typ.nstr Account_Suffix_;
    KEL.typ.nint Account_I_D_;
    KEL.typ.nint Customer_Number_;
    KEL.typ.nstr Customer_Reference_Number_;
    KEL.typ.nkdate Date_Ordered_;
    KEL.typ.nstr Reference_Number_;
    KEL.typ.nint Process_Type_;
    KEL.typ.nfloat Processing_Time_;
    KEL.typ.nstr Processing_Status_;
    KEL.typ.nint Billing_Type_I_D_;
    KEL.typ.nfloat Price_;
    KEL.typ.nint Record_Count1_;
    KEL.typ.nint Record_Count1_Type_;
    KEL.typ.nint Record_Count2_;
    KEL.typ.nint Record_Count2_Type_;
    KEL.typ.nstr Result_Format_;
    KEL.typ.nstr Report_Options_;
    KEL.typ.nstr Transaction_Code_;
    KEL.typ.nstr Return_Node_I_D_;
    KEL.typ.nstr Request_Type_;
    KEL.typ.nint Order_Status_Code_;
    KEL.typ.nstr Product_Version_;
    KEL.typ.nstr Product_Line_;
    KEL.typ.nstr Ip_Address_;
    KEL.typ.nstr Response_Time_;
    KEL.typ.nstr Vendor_Code_;
    KEL.typ.nstr Esp_Method_;
    KEL.typ.nint Batch_Job_I_D_;
    KEL.typ.nint Batch_Seq_Number_;
    KEL.typ.nstr User_Added_;
    KEL.typ.nstr User_Changed_;
    KEL.typ.nkdate Date_Changed_;
    KEL.typ.epoch Date_First_Seen_ := 0;
    KEL.typ.epoch Date_Last_Seen_ := 0;
    KEL.typ.int __RecordCount := 0;
  END;
  EXPORT __PostFilter := __GroupedFilter(GROUP(DISTRIBUTE(InData,HASH(UID)),UID,LOCAL,ALL));
  Inquiry_Group := __PostFilter;
  Layout Inquiry__Rollup(InLayout __r, DATASET(InLayout) __recs) := TRANSFORM
    SELF.Transaction_I_D_ := KEL.Intake.SingleValue(__recs,Transaction_I_D_);
    SELF.Sequence_ := KEL.Intake.SingleValue(__recs,Sequence_);
    SELF.Product_I_D_ := KEL.Intake.SingleValue(__recs,Product_I_D_);
    SELF.Date_Added_ := KEL.Intake.SingleValue(__recs,Date_Added_);
    SELF.Login_I_D_ := KEL.Intake.SingleValue(__recs,Login_I_D_);
    SELF.Billing_Code_ := KEL.Intake.SingleValue(__recs,Billing_Code_);
    SELF.Function_Name_ := KEL.Intake.SingleValue(__recs,Function_Name_);
    SELF.Report_Code_ := KEL.Intake.SingleValue(__recs,Report_Code_);
    SELF.Account_Base_ := KEL.Intake.SingleValue(__recs,Account_Base_);
    SELF.Account_Suffix_ := KEL.Intake.SingleValue(__recs,Account_Suffix_);
    SELF.Account_I_D_ := KEL.Intake.SingleValue(__recs,Account_I_D_);
    SELF.Customer_Number_ := KEL.Intake.SingleValue(__recs,Customer_Number_);
    SELF.Customer_Reference_Number_ := KEL.Intake.SingleValue(__recs,Customer_Reference_Number_);
    SELF.Date_Ordered_ := KEL.Intake.SingleValue(__recs,Date_Ordered_);
    SELF.Reference_Number_ := KEL.Intake.SingleValue(__recs,Reference_Number_);
    SELF.Process_Type_ := KEL.Intake.SingleValue(__recs,Process_Type_);
    SELF.Processing_Time_ := KEL.Intake.SingleValue(__recs,Processing_Time_);
    SELF.Processing_Status_ := KEL.Intake.SingleValue(__recs,Processing_Status_);
    SELF.Billing_Type_I_D_ := KEL.Intake.SingleValue(__recs,Billing_Type_I_D_);
    SELF.Price_ := KEL.Intake.SingleValue(__recs,Price_);
    SELF.Record_Count1_ := KEL.Intake.SingleValue(__recs,Record_Count1_);
    SELF.Record_Count1_Type_ := KEL.Intake.SingleValue(__recs,Record_Count1_Type_);
    SELF.Record_Count2_ := KEL.Intake.SingleValue(__recs,Record_Count2_);
    SELF.Record_Count2_Type_ := KEL.Intake.SingleValue(__recs,Record_Count2_Type_);
    SELF.Result_Format_ := KEL.Intake.SingleValue(__recs,Result_Format_);
    SELF.Report_Options_ := KEL.Intake.SingleValue(__recs,Report_Options_);
    SELF.Transaction_Code_ := KEL.Intake.SingleValue(__recs,Transaction_Code_);
    SELF.Return_Node_I_D_ := KEL.Intake.SingleValue(__recs,Return_Node_I_D_);
    SELF.Request_Type_ := KEL.Intake.SingleValue(__recs,Request_Type_);
    SELF.Order_Status_Code_ := KEL.Intake.SingleValue(__recs,Order_Status_Code_);
    SELF.Product_Version_ := KEL.Intake.SingleValue(__recs,Product_Version_);
    SELF.Product_Line_ := KEL.Intake.SingleValue(__recs,Product_Line_);
    SELF.Ip_Address_ := KEL.Intake.SingleValue(__recs,Ip_Address_);
    SELF.Response_Time_ := KEL.Intake.SingleValue(__recs,Response_Time_);
    SELF.Vendor_Code_ := KEL.Intake.SingleValue(__recs,Vendor_Code_);
    SELF.Esp_Method_ := KEL.Intake.SingleValue(__recs,Esp_Method_);
    SELF.Batch_Job_I_D_ := KEL.Intake.SingleValue(__recs,Batch_Job_I_D_);
    SELF.Batch_Seq_Number_ := KEL.Intake.SingleValue(__recs,Batch_Seq_Number_);
    SELF.User_Added_ := KEL.Intake.SingleValue(__recs,User_Added_);
    SELF.User_Changed_ := KEL.Intake.SingleValue(__recs,User_Changed_);
    SELF.Date_Changed_ := KEL.Intake.SingleValue(__recs,Date_Changed_);
    SELF.__RecordCount := COUNT(__recs);
    SELF.Date_First_Seen_ := KEL.era.SimpleRoll(__recs,Date_First_Seen_,MIN,TRUE);
    SELF.Date_Last_Seen_ := KEL.era.SimpleRoll(__recs,Date_Last_Seen_,MAX,FALSE);
    SELF := __r;
  END;
  Layout Inquiry__Single_Rollup(InLayout __r) := TRANSFORM
    SELF.__RecordCount := 1;
    SELF := __r;
  END;
  EXPORT __PreResult := ROLLUP(HAVING(Inquiry_Group,COUNT(ROWS(LEFT))=1),GROUP,Inquiry__Single_Rollup(LEFT)) + ROLLUP(HAVING(Inquiry_Group,COUNT(ROWS(LEFT))>1),GROUP,Inquiry__Rollup(LEFT, ROWS(LEFT)));
  EXPORT __Result := __CLEARFLAGS(__PreResult);
  EXPORT Result := __UNWRAP(__Result);
  EXPORT Transaction_I_D__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Transaction_I_D_);
  EXPORT Sequence__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Sequence_);
  EXPORT Product_I_D__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Product_I_D_);
  EXPORT Date_Added__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Date_Added_);
  EXPORT Login_I_D__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Login_I_D_);
  EXPORT Billing_Code__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Billing_Code_);
  EXPORT Function_Name__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Function_Name_);
  EXPORT Report_Code__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Report_Code_);
  EXPORT Account_Base__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Account_Base_);
  EXPORT Account_Suffix__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Account_Suffix_);
  EXPORT Account_I_D__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Account_I_D_);
  EXPORT Customer_Number__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Customer_Number_);
  EXPORT Customer_Reference_Number__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Customer_Reference_Number_);
  EXPORT Date_Ordered__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Date_Ordered_);
  EXPORT Reference_Number__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Reference_Number_);
  EXPORT Process_Type__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Process_Type_);
  EXPORT Processing_Time__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Processing_Time_);
  EXPORT Processing_Status__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Processing_Status_);
  EXPORT Billing_Type_I_D__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Billing_Type_I_D_);
  EXPORT Price__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Price_);
  EXPORT Record_Count1__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Record_Count1_);
  EXPORT Record_Count1_Type__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Record_Count1_Type_);
  EXPORT Record_Count2__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Record_Count2_);
  EXPORT Record_Count2_Type__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Record_Count2_Type_);
  EXPORT Result_Format__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Result_Format_);
  EXPORT Report_Options__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Report_Options_);
  EXPORT Transaction_Code__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Transaction_Code_);
  EXPORT Return_Node_I_D__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Return_Node_I_D_);
  EXPORT Request_Type__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Request_Type_);
  EXPORT Order_Status_Code__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Order_Status_Code_);
  EXPORT Product_Version__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Product_Version_);
  EXPORT Product_Line__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Product_Line_);
  EXPORT Ip_Address__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Ip_Address_);
  EXPORT Response_Time__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Response_Time_);
  EXPORT Vendor_Code__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Vendor_Code_);
  EXPORT Esp_Method__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Esp_Method_);
  EXPORT Batch_Job_I_D__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Batch_Job_I_D_);
  EXPORT Batch_Seq_Number__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Batch_Seq_Number_);
  EXPORT User_Added__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,User_Added_);
  EXPORT User_Changed__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,User_Changed_);
  EXPORT Date_Changed__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,Date_Changed_);
  EXPORT SanityCheck := DATASET([{COUNT(inquiry_history_IntermediateLog_VHR_Invalid),COUNT(transaction_log_TransactionLog_Invalid),COUNT(transaction_log_vehicle_TransactionLogVehicle_Invalid),COUNT(Transaction_I_D__SingleValue_Invalid),COUNT(Sequence__SingleValue_Invalid),COUNT(Product_I_D__SingleValue_Invalid),COUNT(Date_Added__SingleValue_Invalid),COUNT(Login_I_D__SingleValue_Invalid),COUNT(Billing_Code__SingleValue_Invalid),COUNT(Function_Name__SingleValue_Invalid),COUNT(Report_Code__SingleValue_Invalid),COUNT(Account_Base__SingleValue_Invalid),COUNT(Account_Suffix__SingleValue_Invalid),COUNT(Account_I_D__SingleValue_Invalid),COUNT(Customer_Number__SingleValue_Invalid),COUNT(Customer_Reference_Number__SingleValue_Invalid),COUNT(Date_Ordered__SingleValue_Invalid),COUNT(Reference_Number__SingleValue_Invalid),COUNT(Process_Type__SingleValue_Invalid),COUNT(Processing_Time__SingleValue_Invalid),COUNT(Processing_Status__SingleValue_Invalid),COUNT(Billing_Type_I_D__SingleValue_Invalid),COUNT(Price__SingleValue_Invalid),COUNT(Record_Count1__SingleValue_Invalid),COUNT(Record_Count1_Type__SingleValue_Invalid),COUNT(Record_Count2__SingleValue_Invalid),COUNT(Record_Count2_Type__SingleValue_Invalid),COUNT(Result_Format__SingleValue_Invalid),COUNT(Report_Options__SingleValue_Invalid),COUNT(Transaction_Code__SingleValue_Invalid),COUNT(Return_Node_I_D__SingleValue_Invalid),COUNT(Request_Type__SingleValue_Invalid),COUNT(Order_Status_Code__SingleValue_Invalid),COUNT(Product_Version__SingleValue_Invalid),COUNT(Product_Line__SingleValue_Invalid),COUNT(Ip_Address__SingleValue_Invalid),COUNT(Response_Time__SingleValue_Invalid),COUNT(Vendor_Code__SingleValue_Invalid),COUNT(Esp_Method__SingleValue_Invalid),COUNT(Batch_Job_I_D__SingleValue_Invalid),COUNT(Batch_Seq_Number__SingleValue_Invalid),COUNT(User_Added__SingleValue_Invalid),COUNT(User_Changed__SingleValue_Invalid),COUNT(Date_Changed__SingleValue_Invalid)}],{KEL.typ.int inquiry_history_IntermediateLog_VHR_Invalid,KEL.typ.int transaction_log_TransactionLog_Invalid,KEL.typ.int transaction_log_vehicle_TransactionLogVehicle_Invalid,KEL.typ.int Transaction_I_D__SingleValue_Invalid,KEL.typ.int Sequence__SingleValue_Invalid,KEL.typ.int Product_I_D__SingleValue_Invalid,KEL.typ.int Date_Added__SingleValue_Invalid,KEL.typ.int Login_I_D__SingleValue_Invalid,KEL.typ.int Billing_Code__SingleValue_Invalid,KEL.typ.int Function_Name__SingleValue_Invalid,KEL.typ.int Report_Code__SingleValue_Invalid,KEL.typ.int Account_Base__SingleValue_Invalid,KEL.typ.int Account_Suffix__SingleValue_Invalid,KEL.typ.int Account_I_D__SingleValue_Invalid,KEL.typ.int Customer_Number__SingleValue_Invalid,KEL.typ.int Customer_Reference_Number__SingleValue_Invalid,KEL.typ.int Date_Ordered__SingleValue_Invalid,KEL.typ.int Reference_Number__SingleValue_Invalid,KEL.typ.int Process_Type__SingleValue_Invalid,KEL.typ.int Processing_Time__SingleValue_Invalid,KEL.typ.int Processing_Status__SingleValue_Invalid,KEL.typ.int Billing_Type_I_D__SingleValue_Invalid,KEL.typ.int Price__SingleValue_Invalid,KEL.typ.int Record_Count1__SingleValue_Invalid,KEL.typ.int Record_Count1_Type__SingleValue_Invalid,KEL.typ.int Record_Count2__SingleValue_Invalid,KEL.typ.int Record_Count2_Type__SingleValue_Invalid,KEL.typ.int Result_Format__SingleValue_Invalid,KEL.typ.int Report_Options__SingleValue_Invalid,KEL.typ.int Transaction_Code__SingleValue_Invalid,KEL.typ.int Return_Node_I_D__SingleValue_Invalid,KEL.typ.int Request_Type__SingleValue_Invalid,KEL.typ.int Order_Status_Code__SingleValue_Invalid,KEL.typ.int Product_Version__SingleValue_Invalid,KEL.typ.int Product_Line__SingleValue_Invalid,KEL.typ.int Ip_Address__SingleValue_Invalid,KEL.typ.int Response_Time__SingleValue_Invalid,KEL.typ.int Vendor_Code__SingleValue_Invalid,KEL.typ.int Esp_Method__SingleValue_Invalid,KEL.typ.int Batch_Job_I_D__SingleValue_Invalid,KEL.typ.int Batch_Seq_Number__SingleValue_Invalid,KEL.typ.int User_Added__SingleValue_Invalid,KEL.typ.int User_Changed__SingleValue_Invalid,KEL.typ.int Date_Changed__SingleValue_Invalid});
  EXPORT NullCounts := DATASET([
    {'Inquiry','inquiry_history.IntermediateLog.VHR','UID',COUNT(inquiry_history_IntermediateLog_VHR_Invalid),COUNT(__d0)},
    {'Inquiry','inquiry_history.IntermediateLog.VHR','transaction_id',COUNT(__d0(__NL(Transaction_I_D_))),COUNT(__d0(__NN(Transaction_I_D_)))},
    {'Inquiry','inquiry_history.IntermediateLog.VHR','Sequence',COUNT(__d0(__NL(Sequence_))),COUNT(__d0(__NN(Sequence_)))},
    {'Inquiry','inquiry_history.IntermediateLog.VHR','product_id',COUNT(__d0(__NL(Product_I_D_))),COUNT(__d0(__NN(Product_I_D_)))},
    {'Inquiry','inquiry_history.IntermediateLog.VHR','date_added',COUNT(__d0(__NL(Date_Added_))),COUNT(__d0(__NN(Date_Added_)))},
    {'Inquiry','inquiry_history.IntermediateLog.VHR','LoginID',COUNT(__d0(__NL(Login_I_D_))),COUNT(__d0(__NN(Login_I_D_)))},
    {'Inquiry','inquiry_history.IntermediateLog.VHR','BillingCode',COUNT(__d0(__NL(Billing_Code_))),COUNT(__d0(__NN(Billing_Code_)))},
    {'Inquiry','inquiry_history.IntermediateLog.VHR','FunctionName',COUNT(__d0(__NL(Function_Name_))),COUNT(__d0(__NN(Function_Name_)))},
    {'Inquiry','inquiry_history.IntermediateLog.VHR','ReportCode',COUNT(__d0(__NL(Report_Code_))),COUNT(__d0(__NN(Report_Code_)))},
    {'Inquiry','inquiry_history.IntermediateLog.VHR','AccountBase',COUNT(__d0(__NL(Account_Base_))),COUNT(__d0(__NN(Account_Base_)))},
    {'Inquiry','inquiry_history.IntermediateLog.VHR','AccountSuffix',COUNT(__d0(__NL(Account_Suffix_))),COUNT(__d0(__NN(Account_Suffix_)))},
    {'Inquiry','inquiry_history.IntermediateLog.VHR','AccountID',COUNT(__d0(__NL(Account_I_D_))),COUNT(__d0(__NN(Account_I_D_)))},
    {'Inquiry','inquiry_history.IntermediateLog.VHR','CustomerNumber',COUNT(__d0(__NL(Customer_Number_))),COUNT(__d0(__NN(Customer_Number_)))},
    {'Inquiry','inquiry_history.IntermediateLog.VHR','CustomerReferenceNumber',COUNT(__d0(__NL(Customer_Reference_Number_))),COUNT(__d0(__NN(Customer_Reference_Number_)))},
    {'Inquiry','inquiry_history.IntermediateLog.VHR','DateOrdered',COUNT(__d0(__NL(Date_Ordered_))),COUNT(__d0(__NN(Date_Ordered_)))},
    {'Inquiry','inquiry_history.IntermediateLog.VHR','reference_number',COUNT(__d0(__NL(Reference_Number_))),COUNT(__d0(__NN(Reference_Number_)))},
    {'Inquiry','inquiry_history.IntermediateLog.VHR','process_type',COUNT(__d0(__NL(Process_Type_))),COUNT(__d0(__NN(Process_Type_)))},
    {'Inquiry','inquiry_history.IntermediateLog.VHR','processing_time',COUNT(__d0(__NL(Processing_Time_))),COUNT(__d0(__NN(Processing_Time_)))},
    {'Inquiry','inquiry_history.IntermediateLog.VHR','process_status',COUNT(__d0(__NL(Processing_Status_))),COUNT(__d0(__NN(Processing_Status_)))},
    {'Inquiry','inquiry_history.IntermediateLog.VHR','BillingTypeID',COUNT(__d0(__NL(Billing_Type_I_D_))),COUNT(__d0(__NN(Billing_Type_I_D_)))},
    {'Inquiry','inquiry_history.IntermediateLog.VHR','Price',COUNT(__d0(__NL(Price_))),COUNT(__d0(__NN(Price_)))},
    {'Inquiry','inquiry_history.IntermediateLog.VHR','RecordCount1',COUNT(__d0(__NL(Record_Count1_))),COUNT(__d0(__NN(Record_Count1_)))},
    {'Inquiry','inquiry_history.IntermediateLog.VHR','RecordCount1Type',COUNT(__d0(__NL(Record_Count1_Type_))),COUNT(__d0(__NN(Record_Count1_Type_)))},
    {'Inquiry','inquiry_history.IntermediateLog.VHR','RecordCount2',COUNT(__d0(__NL(Record_Count2_))),COUNT(__d0(__NN(Record_Count2_)))},
    {'Inquiry','inquiry_history.IntermediateLog.VHR','RecordCount2Type',COUNT(__d0(__NL(Record_Count2_Type_))),COUNT(__d0(__NN(Record_Count2_Type_)))},
    {'Inquiry','inquiry_history.IntermediateLog.VHR','ResultFormat',COUNT(__d0(__NL(Result_Format_))),COUNT(__d0(__NN(Result_Format_)))},
    {'Inquiry','inquiry_history.IntermediateLog.VHR','ReportOptions',COUNT(__d0(__NL(Report_Options_))),COUNT(__d0(__NN(Report_Options_)))},
    {'Inquiry','inquiry_history.IntermediateLog.VHR','TransactionCode',COUNT(__d0(__NL(Transaction_Code_))),COUNT(__d0(__NN(Transaction_Code_)))},
    {'Inquiry','inquiry_history.IntermediateLog.VHR','ReturnNodeID',COUNT(__d0(__NL(Return_Node_I_D_))),COUNT(__d0(__NN(Return_Node_I_D_)))},
    {'Inquiry','inquiry_history.IntermediateLog.VHR','request_type',COUNT(__d0(__NL(Request_Type_))),COUNT(__d0(__NN(Request_Type_)))},
    {'Inquiry','inquiry_history.IntermediateLog.VHR','OrderStatusCode',COUNT(__d0(__NL(Order_Status_Code_))),COUNT(__d0(__NN(Order_Status_Code_)))},
    {'Inquiry','inquiry_history.IntermediateLog.VHR','ProductLine',COUNT(__d0(__NL(Product_Line_))),COUNT(__d0(__NN(Product_Line_)))},
    {'Inquiry','inquiry_history.IntermediateLog.VHR','product_version',COUNT(__d0(__NL(Product_Version_))),COUNT(__d0(__NN(Product_Version_)))},
    {'Inquiry','inquiry_history.IntermediateLog.VHR','IpAddress',COUNT(__d0(__NL(Ip_Address_))),COUNT(__d0(__NN(Ip_Address_)))},
    {'Inquiry','inquiry_history.IntermediateLog.VHR','ResponseTime',COUNT(__d0(__NL(Response_Time_))),COUNT(__d0(__NN(Response_Time_)))},
    {'Inquiry','inquiry_history.IntermediateLog.VHR','vendor_code',COUNT(__d0(__NL(Vendor_Code_))),COUNT(__d0(__NN(Vendor_Code_)))},
    {'Inquiry','inquiry_history.IntermediateLog.VHR','EspMethod',COUNT(__d0(__NL(Esp_Method_))),COUNT(__d0(__NN(Esp_Method_)))},
    {'Inquiry','inquiry_history.IntermediateLog.VHR','BatchJobID',COUNT(__d0(__NL(Batch_Job_I_D_))),COUNT(__d0(__NN(Batch_Job_I_D_)))},
    {'Inquiry','inquiry_history.IntermediateLog.VHR','BatchSeqNumber',COUNT(__d0(__NL(Batch_Seq_Number_))),COUNT(__d0(__NN(Batch_Seq_Number_)))},
    {'Inquiry','inquiry_history.IntermediateLog.VHR','UserAdded',COUNT(__d0(__NL(User_Added_))),COUNT(__d0(__NN(User_Added_)))},
    {'Inquiry','inquiry_history.IntermediateLog.VHR','UserChanged',COUNT(__d0(__NL(User_Changed_))),COUNT(__d0(__NN(User_Changed_)))},
    {'Inquiry','inquiry_history.IntermediateLog.VHR','DateChanged',COUNT(__d0(__NL(Date_Changed_))),COUNT(__d0(__NN(Date_Changed_)))},
    {'Inquiry','inquiry_history.IntermediateLog.VHR','DateFirstSeen',COUNT(__d0(Date_First_Seen_=0)),COUNT(__d0(Date_First_Seen_!=0))},
    {'Inquiry','inquiry_history.IntermediateLog.VHR','DateLastSeen',COUNT(__d0(Date_Last_Seen_=0)),COUNT(__d0(Date_Last_Seen_!=0))},
    {'Inquiry','transaction_log.TransactionLog','UID',COUNT(transaction_log_TransactionLog_Invalid),COUNT(__d1)},
    {'Inquiry','transaction_log.TransactionLog','transaction_id',COUNT(__d1(__NL(Transaction_I_D_))),COUNT(__d1(__NN(Transaction_I_D_)))},
    {'Inquiry','transaction_log.TransactionLog','Sequence',COUNT(__d1(__NL(Sequence_))),COUNT(__d1(__NN(Sequence_)))},
    {'Inquiry','transaction_log.TransactionLog','product_id',COUNT(__d1(__NL(Product_I_D_))),COUNT(__d1(__NN(Product_I_D_)))},
    {'Inquiry','transaction_log.TransactionLog','date_added',COUNT(__d1(__NL(Date_Added_))),COUNT(__d1(__NN(Date_Added_)))},
    {'Inquiry','transaction_log.TransactionLog','login_id',COUNT(__d1(__NL(Login_I_D_))),COUNT(__d1(__NN(Login_I_D_)))},
    {'Inquiry','transaction_log.TransactionLog','billing_code',COUNT(__d1(__NL(Billing_Code_))),COUNT(__d1(__NN(Billing_Code_)))},
    {'Inquiry','transaction_log.TransactionLog','function_name',COUNT(__d1(__NL(Function_Name_))),COUNT(__d1(__NN(Function_Name_)))},
    {'Inquiry','transaction_log.TransactionLog','report_code',COUNT(__d1(__NL(Report_Code_))),COUNT(__d1(__NN(Report_Code_)))},
    {'Inquiry','transaction_log.TransactionLog','account_base',COUNT(__d1(__NL(Account_Base_))),COUNT(__d1(__NN(Account_Base_)))},
    {'Inquiry','transaction_log.TransactionLog','account_suffix',COUNT(__d1(__NL(Account_Suffix_))),COUNT(__d1(__NN(Account_Suffix_)))},
    {'Inquiry','transaction_log.TransactionLog','account_id',COUNT(__d1(__NL(Account_I_D_))),COUNT(__d1(__NN(Account_I_D_)))},
    {'Inquiry','transaction_log.TransactionLog','customer_number',COUNT(__d1(__NL(Customer_Number_))),COUNT(__d1(__NN(Customer_Number_)))},
    {'Inquiry','transaction_log.TransactionLog','customer_reference_code',COUNT(__d1(__NL(Customer_Reference_Number_))),COUNT(__d1(__NN(Customer_Reference_Number_)))},
    {'Inquiry','transaction_log.TransactionLog','i_date_ordered',COUNT(__d1(__NL(Date_Ordered_))),COUNT(__d1(__NN(Date_Ordered_)))},
    {'Inquiry','transaction_log.TransactionLog','reference_number',COUNT(__d1(__NL(Reference_Number_))),COUNT(__d1(__NN(Reference_Number_)))},
    {'Inquiry','transaction_log.TransactionLog','ProcessType',COUNT(__d1(__NL(Process_Type_))),COUNT(__d1(__NN(Process_Type_)))},
    {'Inquiry','transaction_log.TransactionLog','ProcessingTime',COUNT(__d1(__NL(Processing_Time_))),COUNT(__d1(__NN(Processing_Time_)))},
    {'Inquiry','transaction_log.TransactionLog','processing_status',COUNT(__d1(__NL(Processing_Status_))),COUNT(__d1(__NN(Processing_Status_)))},
    {'Inquiry','transaction_log.TransactionLog','BillingTypeID',COUNT(__d1(__NL(Billing_Type_I_D_))),COUNT(__d1(__NN(Billing_Type_I_D_)))},
    {'Inquiry','transaction_log.TransactionLog','price',COUNT(__d1(__NL(Price_))),COUNT(__d1(__NN(Price_)))},
    {'Inquiry','transaction_log.TransactionLog','record_count_1',COUNT(__d1(__NL(Record_Count1_))),COUNT(__d1(__NN(Record_Count1_)))},
    {'Inquiry','transaction_log.TransactionLog','record_count_1_type',COUNT(__d1(__NL(Record_Count1_Type_))),COUNT(__d1(__NN(Record_Count1_Type_)))},
    {'Inquiry','transaction_log.TransactionLog','record_count_2',COUNT(__d1(__NL(Record_Count2_))),COUNT(__d1(__NN(Record_Count2_)))},
    {'Inquiry','transaction_log.TransactionLog','record_count_2_type',COUNT(__d1(__NL(Record_Count2_Type_))),COUNT(__d1(__NN(Record_Count2_Type_)))},
    {'Inquiry','transaction_log.TransactionLog','result_format',COUNT(__d1(__NL(Result_Format_))),COUNT(__d1(__NN(Result_Format_)))},
    {'Inquiry','transaction_log.TransactionLog','report_options',COUNT(__d1(__NL(Report_Options_))),COUNT(__d1(__NN(Report_Options_)))},
    {'Inquiry','transaction_log.TransactionLog','TransactionCode',COUNT(__d1(__NL(Transaction_Code_))),COUNT(__d1(__NN(Transaction_Code_)))},
    {'Inquiry','transaction_log.TransactionLog','return_node_id',COUNT(__d1(__NL(Return_Node_I_D_))),COUNT(__d1(__NN(Return_Node_I_D_)))},
    {'Inquiry','transaction_log.TransactionLog','RequestType',COUNT(__d1(__NL(Request_Type_))),COUNT(__d1(__NN(Request_Type_)))},
    {'Inquiry','transaction_log.TransactionLog','order_status_code',COUNT(__d1(__NL(Order_Status_Code_))),COUNT(__d1(__NN(Order_Status_Code_)))},
    {'Inquiry','transaction_log.TransactionLog','product_line',COUNT(__d1(__NL(Product_Line_))),COUNT(__d1(__NN(Product_Line_)))},
    {'Inquiry','transaction_log.TransactionLog','ProductVersion',COUNT(__d1(__NL(Product_Version_))),COUNT(__d1(__NN(Product_Version_)))},
    {'Inquiry','transaction_log.TransactionLog','ip_address',COUNT(__d1(__NL(Ip_Address_))),COUNT(__d1(__NN(Ip_Address_)))},
    {'Inquiry','transaction_log.TransactionLog','response_time',COUNT(__d1(__NL(Response_Time_))),COUNT(__d1(__NN(Response_Time_)))},
    {'Inquiry','transaction_log.TransactionLog','VendorCode',COUNT(__d1(__NL(Vendor_Code_))),COUNT(__d1(__NN(Vendor_Code_)))},
    {'Inquiry','transaction_log.TransactionLog','esp_method',COUNT(__d1(__NL(Esp_Method_))),COUNT(__d1(__NN(Esp_Method_)))},
    {'Inquiry','transaction_log.TransactionLog','batch_job_id',COUNT(__d1(__NL(Batch_Job_I_D_))),COUNT(__d1(__NN(Batch_Job_I_D_)))},
    {'Inquiry','transaction_log.TransactionLog','BatchSeqNumber',COUNT(__d1(__NL(Batch_Seq_Number_))),COUNT(__d1(__NN(Batch_Seq_Number_)))},
    {'Inquiry','transaction_log.TransactionLog','user_added',COUNT(__d1(__NL(User_Added_))),COUNT(__d1(__NN(User_Added_)))},
    {'Inquiry','transaction_log.TransactionLog','user_changed',COUNT(__d1(__NL(User_Changed_))),COUNT(__d1(__NN(User_Changed_)))},
    {'Inquiry','transaction_log.TransactionLog','date_changed',COUNT(__d1(__NL(Date_Changed_))),COUNT(__d1(__NN(Date_Changed_)))},
    {'Inquiry','transaction_log.TransactionLog','DateFirstSeen',COUNT(__d1(Date_First_Seen_=0)),COUNT(__d1(Date_First_Seen_!=0))},
    {'Inquiry','transaction_log.TransactionLog','DateLastSeen',COUNT(__d1(Date_Last_Seen_=0)),COUNT(__d1(Date_Last_Seen_!=0))},
    {'Inquiry','transaction_log_vehicle.TransactionLogVehicle','UID',COUNT(transaction_log_vehicle_TransactionLogVehicle_Invalid),COUNT(__d2)},
    {'Inquiry','transaction_log_vehicle.TransactionLogVehicle','transaction_id',COUNT(__d2(__NL(Transaction_I_D_))),COUNT(__d2(__NN(Transaction_I_D_)))},
    {'Inquiry','transaction_log_vehicle.TransactionLogVehicle','sequence',COUNT(__d2(__NL(Sequence_))),COUNT(__d2(__NN(Sequence_)))},
    {'Inquiry','transaction_log_vehicle.TransactionLogVehicle','product_id',COUNT(__d2(__NL(Product_I_D_))),COUNT(__d2(__NN(Product_I_D_)))},
    {'Inquiry','transaction_log_vehicle.TransactionLogVehicle','date_added',COUNT(__d2(__NL(Date_Added_))),COUNT(__d2(__NN(Date_Added_)))},
    {'Inquiry','transaction_log_vehicle.TransactionLogVehicle','LoginID',COUNT(__d2(__NL(Login_I_D_))),COUNT(__d2(__NN(Login_I_D_)))},
    {'Inquiry','transaction_log_vehicle.TransactionLogVehicle','BillingCode',COUNT(__d2(__NL(Billing_Code_))),COUNT(__d2(__NN(Billing_Code_)))},
    {'Inquiry','transaction_log_vehicle.TransactionLogVehicle','FunctionName',COUNT(__d2(__NL(Function_Name_))),COUNT(__d2(__NN(Function_Name_)))},
    {'Inquiry','transaction_log_vehicle.TransactionLogVehicle','ReportCode',COUNT(__d2(__NL(Report_Code_))),COUNT(__d2(__NN(Report_Code_)))},
    {'Inquiry','transaction_log_vehicle.TransactionLogVehicle','AccountBase',COUNT(__d2(__NL(Account_Base_))),COUNT(__d2(__NN(Account_Base_)))},
    {'Inquiry','transaction_log_vehicle.TransactionLogVehicle','AccountSuffix',COUNT(__d2(__NL(Account_Suffix_))),COUNT(__d2(__NN(Account_Suffix_)))},
    {'Inquiry','transaction_log_vehicle.TransactionLogVehicle','AccountID',COUNT(__d2(__NL(Account_I_D_))),COUNT(__d2(__NN(Account_I_D_)))},
    {'Inquiry','transaction_log_vehicle.TransactionLogVehicle','CustomerNumber',COUNT(__d2(__NL(Customer_Number_))),COUNT(__d2(__NN(Customer_Number_)))},
    {'Inquiry','transaction_log_vehicle.TransactionLogVehicle','CustomerReferenceNumber',COUNT(__d2(__NL(Customer_Reference_Number_))),COUNT(__d2(__NN(Customer_Reference_Number_)))},
    {'Inquiry','transaction_log_vehicle.TransactionLogVehicle','order_date',COUNT(__d2(__NL(Date_Ordered_))),COUNT(__d2(__NN(Date_Ordered_)))},
    {'Inquiry','transaction_log_vehicle.TransactionLogVehicle','ReferenceNumber',COUNT(__d2(__NL(Reference_Number_))),COUNT(__d2(__NN(Reference_Number_)))},
    {'Inquiry','transaction_log_vehicle.TransactionLogVehicle','ProcessType',COUNT(__d2(__NL(Process_Type_))),COUNT(__d2(__NN(Process_Type_)))},
    {'Inquiry','transaction_log_vehicle.TransactionLogVehicle','ProcessingTime',COUNT(__d2(__NL(Processing_Time_))),COUNT(__d2(__NN(Processing_Time_)))},
    {'Inquiry','transaction_log_vehicle.TransactionLogVehicle','ProcessingStatus',COUNT(__d2(__NL(Processing_Status_))),COUNT(__d2(__NN(Processing_Status_)))},
    {'Inquiry','transaction_log_vehicle.TransactionLogVehicle','BillingTypeID',COUNT(__d2(__NL(Billing_Type_I_D_))),COUNT(__d2(__NN(Billing_Type_I_D_)))},
    {'Inquiry','transaction_log_vehicle.TransactionLogVehicle','Price',COUNT(__d2(__NL(Price_))),COUNT(__d2(__NN(Price_)))},
    {'Inquiry','transaction_log_vehicle.TransactionLogVehicle','RecordCount1',COUNT(__d2(__NL(Record_Count1_))),COUNT(__d2(__NN(Record_Count1_)))},
    {'Inquiry','transaction_log_vehicle.TransactionLogVehicle','RecordCount1Type',COUNT(__d2(__NL(Record_Count1_Type_))),COUNT(__d2(__NN(Record_Count1_Type_)))},
    {'Inquiry','transaction_log_vehicle.TransactionLogVehicle','RecordCount2',COUNT(__d2(__NL(Record_Count2_))),COUNT(__d2(__NN(Record_Count2_)))},
    {'Inquiry','transaction_log_vehicle.TransactionLogVehicle','RecordCount2Type',COUNT(__d2(__NL(Record_Count2_Type_))),COUNT(__d2(__NN(Record_Count2_Type_)))},
    {'Inquiry','transaction_log_vehicle.TransactionLogVehicle','ResultFormat',COUNT(__d2(__NL(Result_Format_))),COUNT(__d2(__NN(Result_Format_)))},
    {'Inquiry','transaction_log_vehicle.TransactionLogVehicle','ReportOptions',COUNT(__d2(__NL(Report_Options_))),COUNT(__d2(__NN(Report_Options_)))},
    {'Inquiry','transaction_log_vehicle.TransactionLogVehicle','TransactionCode',COUNT(__d2(__NL(Transaction_Code_))),COUNT(__d2(__NN(Transaction_Code_)))},
    {'Inquiry','transaction_log_vehicle.TransactionLogVehicle','ReturnNodeID',COUNT(__d2(__NL(Return_Node_I_D_))),COUNT(__d2(__NN(Return_Node_I_D_)))},
    {'Inquiry','transaction_log_vehicle.TransactionLogVehicle','RequestType',COUNT(__d2(__NL(Request_Type_))),COUNT(__d2(__NN(Request_Type_)))},
    {'Inquiry','transaction_log_vehicle.TransactionLogVehicle','OrderStatusCode',COUNT(__d2(__NL(Order_Status_Code_))),COUNT(__d2(__NN(Order_Status_Code_)))},
    {'Inquiry','transaction_log_vehicle.TransactionLogVehicle','ProductLine',COUNT(__d2(__NL(Product_Line_))),COUNT(__d2(__NN(Product_Line_)))},
    {'Inquiry','transaction_log_vehicle.TransactionLogVehicle','ProductVersion',COUNT(__d2(__NL(Product_Version_))),COUNT(__d2(__NN(Product_Version_)))},
    {'Inquiry','transaction_log_vehicle.TransactionLogVehicle','IpAddress',COUNT(__d2(__NL(Ip_Address_))),COUNT(__d2(__NN(Ip_Address_)))},
    {'Inquiry','transaction_log_vehicle.TransactionLogVehicle','ResponseTime',COUNT(__d2(__NL(Response_Time_))),COUNT(__d2(__NN(Response_Time_)))},
    {'Inquiry','transaction_log_vehicle.TransactionLogVehicle','VendorCode',COUNT(__d2(__NL(Vendor_Code_))),COUNT(__d2(__NN(Vendor_Code_)))},
    {'Inquiry','transaction_log_vehicle.TransactionLogVehicle','EspMethod',COUNT(__d2(__NL(Esp_Method_))),COUNT(__d2(__NN(Esp_Method_)))},
    {'Inquiry','transaction_log_vehicle.TransactionLogVehicle','BatchJobID',COUNT(__d2(__NL(Batch_Job_I_D_))),COUNT(__d2(__NN(Batch_Job_I_D_)))},
    {'Inquiry','transaction_log_vehicle.TransactionLogVehicle','BatchSeqNumber',COUNT(__d2(__NL(Batch_Seq_Number_))),COUNT(__d2(__NN(Batch_Seq_Number_)))},
    {'Inquiry','transaction_log_vehicle.TransactionLogVehicle','UserAdded',COUNT(__d2(__NL(User_Added_))),COUNT(__d2(__NN(User_Added_)))},
    {'Inquiry','transaction_log_vehicle.TransactionLogVehicle','UserChanged',COUNT(__d2(__NL(User_Changed_))),COUNT(__d2(__NN(User_Changed_)))},
    {'Inquiry','transaction_log_vehicle.TransactionLogVehicle','DateChanged',COUNT(__d2(__NL(Date_Changed_))),COUNT(__d2(__NN(Date_Changed_)))},
    {'Inquiry','transaction_log_vehicle.TransactionLogVehicle','DateFirstSeen',COUNT(__d2(Date_First_Seen_=0)),COUNT(__d2(Date_First_Seen_!=0))},
    {'Inquiry','transaction_log_vehicle.TransactionLogVehicle','DateLastSeen',COUNT(__d2(Date_Last_Seen_=0)),COUNT(__d2(Date_Last_Seen_!=0))}]
  ,{KEL.typ.str entity,KEL.typ.str fileName,KEL.typ.str fieldName,KEL.typ.int nullCount,KEL.typ.int notNullCount});
END;
