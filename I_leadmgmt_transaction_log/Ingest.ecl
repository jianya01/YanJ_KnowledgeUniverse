IMPORT STD,SALT38;
EXPORT Ingest(BOOLEAN CloseOlds = FALSE, DATASET(Layout_Vault) dsBase = In_Vault // Change IN_Vault to change input to ingest process
, DATASET(RECORDOF(Source))  infile = Source
) := MODULE
  SHARED NullFile := DATASET([],Layout_Vault); // Use to replace files you wish to remove
 
  SHARED FilesToIngest := infile;
  // Now need to discover which records are old / new / updated
  EXPORT RecordType := ENUM(UNSIGNED1,Unknown,Ancient,Old,Unchanged,Updated,New);
  EXPORT RTToText(unsigned1 c) := CHOOSE(c,'UNKNOWN','Ancient','Old','Unchanged','Updated','New','UNKNOWN');
  SHARED WithRT := RECORD
    Layout_Vault;
    __Tpe := RecordType.Unknown;
  END;
 
  // Base recs start out Old, Ingest recs start out New -- matched records will become Unchanged or Updated below
  SHARED FilesToIngest0 := PROJECT(FilesToIngest,TRANSFORM(WithRT,SELF.__Tpe:=RecordType.New,SELF:=LEFT));
  SHARED Base0 := PROJECT(dsBase,TRANSFORM(WithRT,SELF.__Tpe:=RecordType.Old,SELF:=LEFT));
 
  WithRT MergeData(WithRT le, WithRT ri) := TRANSFORM // Old,Unchanged,New
    SELF.__Tpe := MAP (le.__Tpe = 0 => ri.__Tpe,ri.__Tpe = 0 => le.__Tpe,RecordType.Unchanged);
    SELF := IF( le.__Tpe=0,ri,le);
  END;
 
  // Ingest0: Merge Base with IngestFiles to get old, new and unchanged
  Ingest0 := JOIN( Base0,FilesToIngest0,LEFT.vault_uid_hash=RIGHT.vault_uid_hash AND LEFT.transaction_id=RIGHT.transaction_id AND LEFT.product_id=RIGHT.product_id AND LEFT.date_added=RIGHT.date_added AND LEFT.login_id=RIGHT.login_id AND LEFT.billing_code=RIGHT.billing_code AND LEFT.function_name=RIGHT.function_name
              AND LEFT.report_code=RIGHT.report_code AND LEFT.account_base=RIGHT.account_base AND LEFT.account_suffix=RIGHT.account_suffix AND LEFT.account_id=RIGHT.account_id AND LEFT.customer_number=RIGHT.customer_number AND LEFT.source_account_base=RIGHT.source_account_base AND LEFT.source_account_suffix=RIGHT.source_account_suffix AND LEFT.source_account_id=RIGHT.source_account_id AND LEFT.source_customer_number=RIGHT.source_customer_number AND LEFT.customer_reference_code=RIGHT.customer_reference_code
              AND LEFT.i_date_ordered=RIGHT.i_date_ordered AND LEFT.i_source_lead_id=RIGHT.i_source_lead_id AND LEFT.i_target_business_line=RIGHT.i_target_business_line AND LEFT.i_lead_price=RIGHT.i_lead_price AND LEFT.i_person_first_name=RIGHT.i_person_first_name AND LEFT.i_person_middle_name=RIGHT.i_person_middle_name AND LEFT.i_person_last_name=RIGHT.i_person_last_name AND LEFT.i_person_name_suffix=RIGHT.i_person_name_suffix AND LEFT.i_person_ssn=RIGHT.i_person_ssn AND LEFT.i_dl_state=RIGHT.i_dl_state
              AND LEFT.i_dl_number=RIGHT.i_dl_number AND LEFT.i_person_dob=RIGHT.i_person_dob AND LEFT.i_addr_line=RIGHT.i_addr_line AND LEFT.i_addr_city=RIGHT.i_addr_city AND LEFT.i_addr_state=RIGHT.i_addr_state AND LEFT.i_addr_zip=RIGHT.i_addr_zip AND LEFT.i_addr_country=RIGHT.i_addr_country AND LEFT.i_phone_1=RIGHT.i_phone_1 AND LEFT.i_phone_2=RIGHT.i_phone_2 AND LEFT.i_phone_3=RIGHT.i_phone_3
              AND LEFT.i_email=RIGHT.i_email AND LEFT.i_person_gender=RIGHT.i_person_gender AND LEFT.scoring_marketview_maybecount=RIGHT.scoring_marketview_maybecount AND LEFT.scoring_marketview_passcount=RIGHT.scoring_marketview_passcount AND LEFT.scoring_marketview_failcount=RIGHT.scoring_marketview_failcount AND LEFT.scoring_email=RIGHT.scoring_email AND LEFT.scoring_instantid=RIGHT.scoring_instantid AND LEFT.scoring_carrierdisc=RIGHT.scoring_carrierdisc AND LEFT.on_do_not_solicit=RIGHT.on_do_not_solicit AND LEFT.is_duplicate=RIGHT.is_duplicate
              AND LEFT.append_vehicle_count=RIGHT.append_vehicle_count AND LEFT.append_driver_count=RIGHT.append_driver_count AND LEFT.append_hsi_score=RIGHT.append_hsi_score AND LEFT.append_hsi_message=RIGHT.append_hsi_message AND LEFT.append_watercraft=RIGHT.append_watercraft AND LEFT.processing_status=RIGHT.processing_status AND LEFT.reject_reason_code=RIGHT.reject_reason_code AND LEFT.billing_type_id=RIGHT.billing_type_id AND LEFT.price=RIGHT.price AND LEFT.currency=RIGHT.currency
              AND LEFT.pricing_error_code=RIGHT.pricing_error_code AND LEFT.free=RIGHT.free AND LEFT.ln_lead_id=RIGHT.ln_lead_id AND LEFT.record_version=RIGHT.record_version AND LEFT.reference_number=RIGHT.reference_number AND LEFT.request_format=RIGHT.request_format AND LEFT.result_format=RIGHT.result_format AND LEFT.request_node_id=RIGHT.request_node_id AND LEFT.return_node_id=RIGHT.return_node_id AND LEFT.report_options=RIGHT.report_options
              AND LEFT.transaction_code=RIGHT.transaction_code AND LEFT.order_status_code=RIGHT.order_status_code AND LEFT.login_history_id=RIGHT.login_history_id AND LEFT.ip_address=RIGHT.ip_address AND LEFT.response_time=RIGHT.response_time AND LEFT.esp_method=RIGHT.esp_method AND LEFT.batch_job_id=RIGHT.batch_job_id AND LEFT.batch_seq_number=RIGHT.batch_seq_number AND LEFT.user_added=RIGHT.user_added AND LEFT.user_changed=RIGHT.user_changed
              AND LEFT.date_changed=RIGHT.date_changed AND LEFT.vault_date_first_seen=RIGHT.vault_date_first_seen AND LEFT.vault_date_last_seen=RIGHT.vault_date_last_seen,MergeData(LEFT,RIGHT),FULL OUTER,HASH);
  WithRT MergeData1(WithRT le, WithRT ri) := TRANSFORM // old, updated, new
    SELF.vault_date_first_seen := MAP (le.__Tpe = 0 => ri.vault_date_first_seen,ri.__Tpe = 0 => le.vault_date_first_seen,le.vault_date_first_seen<ri.vault_date_first_seen => le.vault_date_first_seen,ri.vault_date_first_seen);
    SELF.__Tpe := MAP (le.__Tpe = 0 => ri.__Tpe,ri.__Tpe = 0 => le.__Tpe,RecordType.Updated);
    SELF := IF( le.__Tpe=0,ri,le);
  END;
 
  // Ingest1: Merge Open Old with Open New to get old, updated, new
  Ingest1 := JOIN( Ingest0(__Tpe=RecordType.Old),Ingest0(__Tpe=RecordType.New),LEFT.vault_uid_hash=RIGHT.vault_uid_hash AND LEFT.transaction_id=RIGHT.transaction_id AND LEFT.product_id=RIGHT.product_id AND LEFT.date_added=RIGHT.date_added AND LEFT.login_id=RIGHT.login_id AND LEFT.billing_code=RIGHT.billing_code AND LEFT.function_name=RIGHT.function_name
              AND LEFT.report_code=RIGHT.report_code AND LEFT.account_base=RIGHT.account_base AND LEFT.account_suffix=RIGHT.account_suffix AND LEFT.account_id=RIGHT.account_id AND LEFT.customer_number=RIGHT.customer_number AND LEFT.source_account_base=RIGHT.source_account_base AND LEFT.source_account_suffix=RIGHT.source_account_suffix AND LEFT.source_account_id=RIGHT.source_account_id AND LEFT.source_customer_number=RIGHT.source_customer_number AND LEFT.customer_reference_code=RIGHT.customer_reference_code
              AND LEFT.i_date_ordered=RIGHT.i_date_ordered AND LEFT.i_source_lead_id=RIGHT.i_source_lead_id AND LEFT.i_target_business_line=RIGHT.i_target_business_line AND LEFT.i_lead_price=RIGHT.i_lead_price AND LEFT.i_person_first_name=RIGHT.i_person_first_name AND LEFT.i_person_middle_name=RIGHT.i_person_middle_name AND LEFT.i_person_last_name=RIGHT.i_person_last_name AND LEFT.i_person_name_suffix=RIGHT.i_person_name_suffix AND LEFT.i_person_ssn=RIGHT.i_person_ssn AND LEFT.i_dl_state=RIGHT.i_dl_state
              AND LEFT.i_dl_number=RIGHT.i_dl_number AND LEFT.i_person_dob=RIGHT.i_person_dob AND LEFT.i_addr_line=RIGHT.i_addr_line AND LEFT.i_addr_city=RIGHT.i_addr_city AND LEFT.i_addr_state=RIGHT.i_addr_state AND LEFT.i_addr_zip=RIGHT.i_addr_zip AND LEFT.i_addr_country=RIGHT.i_addr_country AND LEFT.i_phone_1=RIGHT.i_phone_1 AND LEFT.i_phone_2=RIGHT.i_phone_2 AND LEFT.i_phone_3=RIGHT.i_phone_3
              AND LEFT.i_email=RIGHT.i_email AND LEFT.i_person_gender=RIGHT.i_person_gender AND LEFT.scoring_marketview_maybecount=RIGHT.scoring_marketview_maybecount AND LEFT.scoring_marketview_passcount=RIGHT.scoring_marketview_passcount AND LEFT.scoring_marketview_failcount=RIGHT.scoring_marketview_failcount AND LEFT.scoring_email=RIGHT.scoring_email AND LEFT.scoring_instantid=RIGHT.scoring_instantid AND LEFT.scoring_carrierdisc=RIGHT.scoring_carrierdisc AND LEFT.on_do_not_solicit=RIGHT.on_do_not_solicit AND LEFT.is_duplicate=RIGHT.is_duplicate
              AND LEFT.append_vehicle_count=RIGHT.append_vehicle_count AND LEFT.append_driver_count=RIGHT.append_driver_count AND LEFT.append_hsi_score=RIGHT.append_hsi_score AND LEFT.append_hsi_message=RIGHT.append_hsi_message AND LEFT.append_watercraft=RIGHT.append_watercraft AND LEFT.processing_status=RIGHT.processing_status AND LEFT.reject_reason_code=RIGHT.reject_reason_code AND LEFT.billing_type_id=RIGHT.billing_type_id AND LEFT.price=RIGHT.price AND LEFT.currency=RIGHT.currency
              AND LEFT.pricing_error_code=RIGHT.pricing_error_code AND LEFT.free=RIGHT.free AND LEFT.ln_lead_id=RIGHT.ln_lead_id AND LEFT.record_version=RIGHT.record_version AND LEFT.reference_number=RIGHT.reference_number AND LEFT.request_format=RIGHT.request_format AND LEFT.result_format=RIGHT.result_format AND LEFT.request_node_id=RIGHT.request_node_id AND LEFT.return_node_id=RIGHT.return_node_id AND LEFT.report_options=RIGHT.report_options
              AND LEFT.transaction_code=RIGHT.transaction_code AND LEFT.order_status_code=RIGHT.order_status_code AND LEFT.login_history_id=RIGHT.login_history_id AND LEFT.ip_address=RIGHT.ip_address AND LEFT.response_time=RIGHT.response_time AND LEFT.esp_method=RIGHT.esp_method AND LEFT.batch_job_id=RIGHT.batch_job_id AND LEFT.batch_seq_number=RIGHT.batch_seq_number AND LEFT.user_added=RIGHT.user_added AND LEFT.user_changed=RIGHT.user_changed
              AND LEFT.date_changed=RIGHT.date_changed AND LEFT.vault_date_last_seen=0 AND RIGHT.vault_date_last_seen=0,MergeData1(LEFT,RIGHT),FULL OUTER,HASH);
  WithRT CloseRecords(WithRT le, WithRT ri) := TRANSFORM
    SELF.vault_date_last_seen := IF(ri.__Tpe=0,le.vault_date_last_seen,(TYPEOF(ri.vault_date_first_seen))SALT38.Fn_DecrementDate(ri.vault_date_first_seen,'YYYYMMDD'));
    SELF.__Tpe := IF(ri.__Tpe=0,le.__Tpe,RecordType.Updated);
    SELF := le;
  END;
  // Ingest2: Close Open Old to get old, updated
  Ingest2 := JOIN( Ingest1(__Tpe=RecordType.Old),Ingest1(__Tpe=RecordType.New), LEFT.vault_uid_hash=RIGHT.vault_uid_hash AND LEFT.vault_date_last_seen=0,CloseRecords(LEFT,RIGHT),LEFT OUTER,HASH);
  TimeStamp := SALT38.Fn_DecrementDate((UNSIGNED6)SALT38.Fn_Now('YYYYMMDD'),'YYYYMMDD') : INDEPENDENT;
  WithRT CloseOldRecords(WithRT le) := TRANSFORM
    SELF.vault_date_last_seen := IF(le.vault_date_last_seen>0,le.vault_date_last_seen,(TYPEOF(le.vault_date_last_seen))TimeStamp);
    SELF.__Tpe := IF(le.vault_date_last_seen>0,le.__Tpe,RecordType.Updated);
    SELF := le;
  END;
  // Ingest3: Close Open Old to get old, updated
  Ingest3 := PROJECT( Ingest2(__Tpe=RecordType.Old),CloseOldRecords(LEFT));
  Ingest2_new := Ingest3 & Ingest2(__Tpe=RecordType.Updated);
  AllRecs0 := IF(CloseOlds,Ingest2_New,Ingest2) & Ingest1(__Tpe=RecordType.New OR __Tpe=RecordType.updated) & Ingest0(__Tpe=RecordType.Unchanged);
  //Now need to update 'rid' numbers on new records
  //Base upon SALT38.utMac_Sequence_Records
  // Do not use PROJECT,COUNTER because it is very slow if any of the fields are not fixed length
  NR := AllRecs0(__Tpe=RecordType.New);
  ORe := AllRecs0(__Tpe<>RecordType.New);
  PrevBase := MAX(ORe,vault_rid);
  WithRT AddNewRid(WithRT le, WithRT ri) := TRANSFORM
    SELF.vault_rid := IF ( le.vault_rid=0, PrevBase+1+thorlib.node(), le.vault_rid+thorlib.nodes() );
    SELF := ri;
  END;
  NR1 := ITERATE(NR(vault_rid=0),AddNewRid(LEFT,RIGHT),LOCAL);
  SHARED AllRecs := ORe+NR1+NR(vault_rid<>0) : PERSIST('~temp::I_leadmgmt_transaction_log::Ingest_Cache',EXPIRE(I_leadmgmt_transaction_log.Config.PersistExpire));
  EXPORT UpdateStats := SORT(TABLE(AllRecs, {__Tpe,SALT38.StrType INGESTSTATUS:=RTToText(AllRecs.__Tpe),UNSIGNED Cnt:=COUNT(GROUP)}, __Tpe, FEW),__Tpe, FEW);
  SHARED S0 := OUTPUT(UpdateStats, {{UpdateStats} AND NOT __Tpe}, ALL, NAMED('UpdateStats'));
 
  SHARED NoFlagsRec := WithRT;
  SHARED emptyDS := DATASET([], NoFlagsRec);
  EXPORT NewRecords := PROJECT(AllRecs(__Tpe=RecordType.New), NoFlagsRec);
  EXPORT NewRecords_NoTag := PROJECT(NewRecords,Layout_Vault);
  EXPORT OldRecords :=PROJECT( AllRecs(__Tpe=RecordType.Old), NoFlagsRec);
  EXPORT OldRecords_NoTag := PROJECT(OldRecords,Layout_Vault);
  EXPORT UpdatedRecords := PROJECT(AllRecs(__Tpe=RecordType.Updated), NoFlagsRec);
  EXPORT UpdatedRecords_NoTag := PROJECT(UpdatedRecords,Layout_Vault);
  EXPORT AllRecords := PROJECT(AllRecs, NoFlagsRec);
  EXPORT AllRecords_NoTag := PROJECT(AllRecords,Layout_Vault); // Records in 'pure' format
 
  EXPORT DoStats := S0;
 
END;
