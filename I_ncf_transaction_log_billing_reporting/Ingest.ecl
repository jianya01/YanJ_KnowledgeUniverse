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
  Ingest0 := JOIN( Base0,FilesToIngest0,LEFT.vault_uid_hash=RIGHT.vault_uid_hash AND LEFT.transaction_id=RIGHT.transaction_id AND LEFT.product_id=RIGHT.product_id AND LEFT.date_added=RIGHT.date_added AND LEFT.end_user=RIGHT.end_user AND LEFT.special_billing_id=RIGHT.special_billing_id AND LEFT.report_service_type=RIGHT.report_service_type
              AND LEFT.eqx_report_code=RIGHT.eqx_report_code AND LEFT.exp_report_code=RIGHT.exp_report_code AND LEFT.tran_report_code=RIGHT.tran_report_code AND LEFT.ln_report_code=RIGHT.ln_report_code AND LEFT.condition_code=RIGHT.condition_code AND LEFT.account_base=RIGHT.account_base AND LEFT.account_suffix=RIGHT.account_suffix AND LEFT.account_id=RIGHT.account_id AND LEFT.consumer_number=RIGHT.consumer_number AND LEFT.customer_number=RIGHT.customer_number
              AND LEFT.i_full_quote_back=RIGHT.i_full_quote_back AND LEFT.i_date_ordered=RIGHT.i_date_ordered AND LEFT.i_individual_ssn=RIGHT.i_individual_ssn AND LEFT.i_individual_name_prefix=RIGHT.i_individual_name_prefix AND LEFT.i_individual_last_name=RIGHT.i_individual_last_name AND LEFT.i_individual_first_name=RIGHT.i_individual_first_name AND LEFT.i_individual_middle_name=RIGHT.i_individual_middle_name AND LEFT.i_individual_name_suffix=RIGHT.i_individual_name_suffix AND LEFT.i_individual_dob_age=RIGHT.i_individual_dob_age AND LEFT.o_individual_ssn=RIGHT.o_individual_ssn
              AND LEFT.o_individual_vendor_ssn=RIGHT.o_individual_vendor_ssn AND LEFT.o_individual_name_prefix=RIGHT.o_individual_name_prefix AND LEFT.o_individual_last_name=RIGHT.o_individual_last_name AND LEFT.o_individual_first_name=RIGHT.o_individual_first_name AND LEFT.o_individual_middle_name=RIGHT.o_individual_middle_name AND LEFT.o_individual_name_suffix=RIGHT.o_individual_name_suffix AND LEFT.o_individual_dob_age=RIGHT.o_individual_dob_age AND LEFT.o_individual_processing_status=RIGHT.o_individual_processing_status AND LEFT.o_individual_error_code=RIGHT.o_individual_error_code AND LEFT.i_spouse_ssn=RIGHT.i_spouse_ssn
              AND LEFT.i_spouse_name_prefix=RIGHT.i_spouse_name_prefix AND LEFT.i_spouse_last_name=RIGHT.i_spouse_last_name AND LEFT.i_spouse_first_name=RIGHT.i_spouse_first_name AND LEFT.i_spouse_middle_name=RIGHT.i_spouse_middle_name AND LEFT.i_spouse_name_suffix=RIGHT.i_spouse_name_suffix AND LEFT.i_spouse_dob_age=RIGHT.i_spouse_dob_age AND LEFT.o_spouse_ssn=RIGHT.o_spouse_ssn AND LEFT.o_spouse_vendor_ssn=RIGHT.o_spouse_vendor_ssn AND LEFT.o_spouse_name_prefix=RIGHT.o_spouse_name_prefix AND LEFT.o_spouse_last_name=RIGHT.o_spouse_last_name
              AND LEFT.o_spouse_first_name=RIGHT.o_spouse_first_name AND LEFT.o_spouse_middle_name=RIGHT.o_spouse_middle_name AND LEFT.o_spouse_name_suffix=RIGHT.o_spouse_name_suffix AND LEFT.o_spouse_dob_age=RIGHT.o_spouse_dob_age AND LEFT.o_spouse_processing_status=RIGHT.o_spouse_processing_status AND LEFT.o_spouse_error_code=RIGHT.o_spouse_error_code AND LEFT.count_person_in=RIGHT.count_person_in AND LEFT.o_house_num_current_addr=RIGHT.o_house_num_current_addr AND LEFT.o_quad_current_addr=RIGHT.o_quad_current_addr AND LEFT.o_apt_current_addr=RIGHT.o_apt_current_addr
              AND LEFT.o_street_name_current_addr=RIGHT.o_street_name_current_addr AND LEFT.o_street_type_current_addr=RIGHT.o_street_type_current_addr AND LEFT.o_state_current_addr=RIGHT.o_state_current_addr AND LEFT.o_city_current_addr=RIGHT.o_city_current_addr AND LEFT.o_zip_current_addr=RIGHT.o_zip_current_addr AND LEFT.o_county_current_addr=RIGHT.o_county_current_addr AND LEFT.o_country_current_addr=RIGHT.o_country_current_addr AND LEFT.o_house_num_prior_addr=RIGHT.o_house_num_prior_addr AND LEFT.o_quad_prior_addr=RIGHT.o_quad_prior_addr AND LEFT.o_apt_prior_addr=RIGHT.o_apt_prior_addr
              AND LEFT.o_street_name_prior_addr=RIGHT.o_street_name_prior_addr AND LEFT.o_street_type_prior_addr=RIGHT.o_street_type_prior_addr AND LEFT.o_state_prior_addr=RIGHT.o_state_prior_addr AND LEFT.o_city_prior_addr=RIGHT.o_city_prior_addr AND LEFT.o_zip_prior_addr=RIGHT.o_zip_prior_addr AND LEFT.o_county_prior_addr=RIGHT.o_county_prior_addr AND LEFT.o_country_prior_addr=RIGHT.o_country_prior_addr AND LEFT.count_addr_in=RIGHT.count_addr_in AND LEFT.order_indicator=RIGHT.order_indicator AND LEFT.test_prod_indicator=RIGHT.test_prod_indicator
              AND LEFT.report_usage_code=RIGHT.report_usage_code AND LEFT.type_of_business=RIGHT.type_of_business AND LEFT.i_state_specific_account=RIGHT.i_state_specific_account AND LEFT.first_vendor=RIGHT.first_vendor AND LEFT.second_vendor=RIGHT.second_vendor AND LEFT.final_vendor=RIGHT.final_vendor AND LEFT.vendor_switch_condition=RIGHT.vendor_switch_condition AND LEFT.dupe_keys_selected=RIGHT.dupe_keys_selected AND LEFT.enhanced_ssn=RIGHT.enhanced_ssn AND LEFT.enhanced_dob=RIGHT.enhanced_dob
              AND LEFT.override_score_type=RIGHT.override_score_type AND LEFT.override_vendor=RIGHT.override_vendor AND LEFT.override_state=RIGHT.override_state AND LEFT.letter_indicator=RIGHT.letter_indicator AND LEFT.dupe_vendor_flag=RIGHT.dupe_vendor_flag AND LEFT.inquiry_single_order=RIGHT.inquiry_single_order AND LEFT.individual_beacon_score=RIGHT.individual_beacon_score AND LEFT.spouse_beacon_score=RIGHT.spouse_beacon_score AND LEFT.score_type_indicator=RIGHT.score_type_indicator AND LEFT.carrier_cnt=RIGHT.carrier_cnt
              AND LEFT.record_version=RIGHT.record_version AND LEFT.reference_number=RIGHT.reference_number AND LEFT.original_reference_number=RIGHT.original_reference_number AND LEFT.bill_location_code=RIGHT.bill_location_code AND LEFT.billing_type_id=RIGHT.billing_type_id AND LEFT.price=RIGHT.price AND LEFT.currency=RIGHT.currency AND LEFT.pricing_error_code=RIGHT.pricing_error_code AND LEFT.free=RIGHT.free AND LEFT.result_format=RIGHT.result_format
              AND LEFT.report_options=RIGHT.report_options AND LEFT.transaction_code=RIGHT.transaction_code AND LEFT.return_node_id=RIGHT.return_node_id AND LEFT.request_node_id=RIGHT.request_node_id AND LEFT.order_status_code=RIGHT.order_status_code AND LEFT.product_line=RIGHT.product_line AND LEFT.login_history_id=RIGHT.login_history_id AND LEFT.ip_address=RIGHT.ip_address AND LEFT.response_time=RIGHT.response_time AND LEFT.esp_method=RIGHT.esp_method
              AND LEFT.batch_job_id=RIGHT.batch_job_id AND LEFT.batch_seq_number=RIGHT.batch_seq_number AND LEFT.is_active=RIGHT.is_active AND LEFT.user_added=RIGHT.user_added AND LEFT.user_changed=RIGHT.user_changed AND LEFT.date_changed=RIGHT.date_changed AND LEFT.vendor_to_bill=RIGHT.vendor_to_bill AND LEFT.after_dup_order_status_code=RIGHT.after_dup_order_status_code AND LEFT.order_indicator_coded=RIGHT.order_indicator_coded AND LEFT.run_date=RIGHT.run_date
              AND LEFT.input_start_date=RIGHT.input_start_date AND LEFT.input_end_date=RIGHT.input_end_date AND LEFT.billable_report_code=RIGHT.billable_report_code AND LEFT.individual_lex_id=RIGHT.individual_lex_id AND LEFT.spouse_lex_id=RIGHT.spouse_lex_id AND LEFT.enhanced_fa=RIGHT.enhanced_fa AND LEFT.vault_date_first_seen=RIGHT.vault_date_first_seen AND LEFT.vault_date_last_seen=RIGHT.vault_date_last_seen,MergeData(LEFT,RIGHT),FULL OUTER,HASH);
  WithRT MergeData1(WithRT le, WithRT ri) := TRANSFORM // old, updated, new
    SELF.vault_date_first_seen := MAP (le.__Tpe = 0 => ri.vault_date_first_seen,ri.__Tpe = 0 => le.vault_date_first_seen,le.vault_date_first_seen<ri.vault_date_first_seen => le.vault_date_first_seen,ri.vault_date_first_seen);
    SELF.__Tpe := MAP (le.__Tpe = 0 => ri.__Tpe,ri.__Tpe = 0 => le.__Tpe,RecordType.Updated);
    SELF := IF( le.__Tpe=0,ri,le);
  END;
 
  // Ingest1: Merge Open Old with Open New to get old, updated, new
  Ingest1 := JOIN( Ingest0(__Tpe=RecordType.Old),Ingest0(__Tpe=RecordType.New),LEFT.vault_uid_hash=RIGHT.vault_uid_hash AND LEFT.transaction_id=RIGHT.transaction_id AND LEFT.product_id=RIGHT.product_id AND LEFT.date_added=RIGHT.date_added AND LEFT.end_user=RIGHT.end_user AND LEFT.special_billing_id=RIGHT.special_billing_id AND LEFT.report_service_type=RIGHT.report_service_type
              AND LEFT.eqx_report_code=RIGHT.eqx_report_code AND LEFT.exp_report_code=RIGHT.exp_report_code AND LEFT.tran_report_code=RIGHT.tran_report_code AND LEFT.ln_report_code=RIGHT.ln_report_code AND LEFT.condition_code=RIGHT.condition_code AND LEFT.account_base=RIGHT.account_base AND LEFT.account_suffix=RIGHT.account_suffix AND LEFT.account_id=RIGHT.account_id AND LEFT.consumer_number=RIGHT.consumer_number AND LEFT.customer_number=RIGHT.customer_number
              AND LEFT.i_full_quote_back=RIGHT.i_full_quote_back AND LEFT.i_date_ordered=RIGHT.i_date_ordered AND LEFT.i_individual_ssn=RIGHT.i_individual_ssn AND LEFT.i_individual_name_prefix=RIGHT.i_individual_name_prefix AND LEFT.i_individual_last_name=RIGHT.i_individual_last_name AND LEFT.i_individual_first_name=RIGHT.i_individual_first_name AND LEFT.i_individual_middle_name=RIGHT.i_individual_middle_name AND LEFT.i_individual_name_suffix=RIGHT.i_individual_name_suffix AND LEFT.i_individual_dob_age=RIGHT.i_individual_dob_age AND LEFT.o_individual_ssn=RIGHT.o_individual_ssn
              AND LEFT.o_individual_vendor_ssn=RIGHT.o_individual_vendor_ssn AND LEFT.o_individual_name_prefix=RIGHT.o_individual_name_prefix AND LEFT.o_individual_last_name=RIGHT.o_individual_last_name AND LEFT.o_individual_first_name=RIGHT.o_individual_first_name AND LEFT.o_individual_middle_name=RIGHT.o_individual_middle_name AND LEFT.o_individual_name_suffix=RIGHT.o_individual_name_suffix AND LEFT.o_individual_dob_age=RIGHT.o_individual_dob_age AND LEFT.o_individual_processing_status=RIGHT.o_individual_processing_status AND LEFT.o_individual_error_code=RIGHT.o_individual_error_code AND LEFT.i_spouse_ssn=RIGHT.i_spouse_ssn
              AND LEFT.i_spouse_name_prefix=RIGHT.i_spouse_name_prefix AND LEFT.i_spouse_last_name=RIGHT.i_spouse_last_name AND LEFT.i_spouse_first_name=RIGHT.i_spouse_first_name AND LEFT.i_spouse_middle_name=RIGHT.i_spouse_middle_name AND LEFT.i_spouse_name_suffix=RIGHT.i_spouse_name_suffix AND LEFT.i_spouse_dob_age=RIGHT.i_spouse_dob_age AND LEFT.o_spouse_ssn=RIGHT.o_spouse_ssn AND LEFT.o_spouse_vendor_ssn=RIGHT.o_spouse_vendor_ssn AND LEFT.o_spouse_name_prefix=RIGHT.o_spouse_name_prefix AND LEFT.o_spouse_last_name=RIGHT.o_spouse_last_name
              AND LEFT.o_spouse_first_name=RIGHT.o_spouse_first_name AND LEFT.o_spouse_middle_name=RIGHT.o_spouse_middle_name AND LEFT.o_spouse_name_suffix=RIGHT.o_spouse_name_suffix AND LEFT.o_spouse_dob_age=RIGHT.o_spouse_dob_age AND LEFT.o_spouse_processing_status=RIGHT.o_spouse_processing_status AND LEFT.o_spouse_error_code=RIGHT.o_spouse_error_code AND LEFT.count_person_in=RIGHT.count_person_in AND LEFT.o_house_num_current_addr=RIGHT.o_house_num_current_addr AND LEFT.o_quad_current_addr=RIGHT.o_quad_current_addr AND LEFT.o_apt_current_addr=RIGHT.o_apt_current_addr
              AND LEFT.o_street_name_current_addr=RIGHT.o_street_name_current_addr AND LEFT.o_street_type_current_addr=RIGHT.o_street_type_current_addr AND LEFT.o_state_current_addr=RIGHT.o_state_current_addr AND LEFT.o_city_current_addr=RIGHT.o_city_current_addr AND LEFT.o_zip_current_addr=RIGHT.o_zip_current_addr AND LEFT.o_county_current_addr=RIGHT.o_county_current_addr AND LEFT.o_country_current_addr=RIGHT.o_country_current_addr AND LEFT.o_house_num_prior_addr=RIGHT.o_house_num_prior_addr AND LEFT.o_quad_prior_addr=RIGHT.o_quad_prior_addr AND LEFT.o_apt_prior_addr=RIGHT.o_apt_prior_addr
              AND LEFT.o_street_name_prior_addr=RIGHT.o_street_name_prior_addr AND LEFT.o_street_type_prior_addr=RIGHT.o_street_type_prior_addr AND LEFT.o_state_prior_addr=RIGHT.o_state_prior_addr AND LEFT.o_city_prior_addr=RIGHT.o_city_prior_addr AND LEFT.o_zip_prior_addr=RIGHT.o_zip_prior_addr AND LEFT.o_county_prior_addr=RIGHT.o_county_prior_addr AND LEFT.o_country_prior_addr=RIGHT.o_country_prior_addr AND LEFT.count_addr_in=RIGHT.count_addr_in AND LEFT.order_indicator=RIGHT.order_indicator AND LEFT.test_prod_indicator=RIGHT.test_prod_indicator
              AND LEFT.report_usage_code=RIGHT.report_usage_code AND LEFT.type_of_business=RIGHT.type_of_business AND LEFT.i_state_specific_account=RIGHT.i_state_specific_account AND LEFT.first_vendor=RIGHT.first_vendor AND LEFT.second_vendor=RIGHT.second_vendor AND LEFT.final_vendor=RIGHT.final_vendor AND LEFT.vendor_switch_condition=RIGHT.vendor_switch_condition AND LEFT.dupe_keys_selected=RIGHT.dupe_keys_selected AND LEFT.enhanced_ssn=RIGHT.enhanced_ssn AND LEFT.enhanced_dob=RIGHT.enhanced_dob
              AND LEFT.override_score_type=RIGHT.override_score_type AND LEFT.override_vendor=RIGHT.override_vendor AND LEFT.override_state=RIGHT.override_state AND LEFT.letter_indicator=RIGHT.letter_indicator AND LEFT.dupe_vendor_flag=RIGHT.dupe_vendor_flag AND LEFT.inquiry_single_order=RIGHT.inquiry_single_order AND LEFT.individual_beacon_score=RIGHT.individual_beacon_score AND LEFT.spouse_beacon_score=RIGHT.spouse_beacon_score AND LEFT.score_type_indicator=RIGHT.score_type_indicator AND LEFT.carrier_cnt=RIGHT.carrier_cnt
              AND LEFT.record_version=RIGHT.record_version AND LEFT.reference_number=RIGHT.reference_number AND LEFT.original_reference_number=RIGHT.original_reference_number AND LEFT.bill_location_code=RIGHT.bill_location_code AND LEFT.billing_type_id=RIGHT.billing_type_id AND LEFT.price=RIGHT.price AND LEFT.currency=RIGHT.currency AND LEFT.pricing_error_code=RIGHT.pricing_error_code AND LEFT.free=RIGHT.free AND LEFT.result_format=RIGHT.result_format
              AND LEFT.report_options=RIGHT.report_options AND LEFT.transaction_code=RIGHT.transaction_code AND LEFT.return_node_id=RIGHT.return_node_id AND LEFT.request_node_id=RIGHT.request_node_id AND LEFT.order_status_code=RIGHT.order_status_code AND LEFT.product_line=RIGHT.product_line AND LEFT.login_history_id=RIGHT.login_history_id AND LEFT.ip_address=RIGHT.ip_address AND LEFT.response_time=RIGHT.response_time AND LEFT.esp_method=RIGHT.esp_method
              AND LEFT.batch_job_id=RIGHT.batch_job_id AND LEFT.batch_seq_number=RIGHT.batch_seq_number AND LEFT.is_active=RIGHT.is_active AND LEFT.user_added=RIGHT.user_added AND LEFT.user_changed=RIGHT.user_changed AND LEFT.date_changed=RIGHT.date_changed AND LEFT.vendor_to_bill=RIGHT.vendor_to_bill AND LEFT.after_dup_order_status_code=RIGHT.after_dup_order_status_code AND LEFT.order_indicator_coded=RIGHT.order_indicator_coded AND LEFT.run_date=RIGHT.run_date
              AND LEFT.input_start_date=RIGHT.input_start_date AND LEFT.input_end_date=RIGHT.input_end_date AND LEFT.billable_report_code=RIGHT.billable_report_code AND LEFT.individual_lex_id=RIGHT.individual_lex_id AND LEFT.spouse_lex_id=RIGHT.spouse_lex_id AND LEFT.enhanced_fa=RIGHT.enhanced_fa AND LEFT.vault_date_last_seen=0 AND RIGHT.vault_date_last_seen=0,MergeData1(LEFT,RIGHT),FULL OUTER,HASH);
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
  SHARED AllRecs := ORe+NR1+NR(vault_rid<>0) : PERSIST('~temp::I_ncf_transaction_log_billing_reporting::Ingest_Cache',EXPIRE(I_ncf_transaction_log_billing_reporting.Config.PersistExpire));
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
