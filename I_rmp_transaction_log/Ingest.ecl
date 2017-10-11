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
  Ingest0 := JOIN( Base0,FilesToIngest0,LEFT.vault_uid_hash=RIGHT.vault_uid_hash AND LEFT.transaction_id=RIGHT.transaction_id AND LEFT.product_id=RIGHT.product_id AND LEFT.date_added=RIGHT.date_added AND LEFT.login_id=RIGHT.login_id AND LEFT.billing_code=RIGHT.billing_code AND LEFT.service_type=RIGHT.service_type
              AND LEFT.report_code=RIGHT.report_code AND LEFT.account_base=RIGHT.account_base AND LEFT.account_suffix=RIGHT.account_suffix AND LEFT.account_id=RIGHT.account_id AND LEFT.customer_number=RIGHT.customer_number AND LEFT.full_quote_back=RIGHT.full_quote_back AND LEFT.i_date_ordered=RIGHT.i_date_ordered AND LEFT.i_person_ssn=RIGHT.i_person_ssn AND LEFT.i_person_name_prefix=RIGHT.i_person_name_prefix AND LEFT.i_person_last_name=RIGHT.i_person_last_name
              AND LEFT.i_person_first_name=RIGHT.i_person_first_name AND LEFT.i_person_middle_name=RIGHT.i_person_middle_name AND LEFT.i_person_name_suffix=RIGHT.i_person_name_suffix AND LEFT.i_person_dob=RIGHT.i_person_dob AND LEFT.count_person_in=RIGHT.count_person_in AND LEFT.i_dl1_number=RIGHT.i_dl1_number AND LEFT.i_dl1_state=RIGHT.i_dl1_state AND LEFT.i_dl1_type=RIGHT.i_dl1_type AND LEFT.count_dl_in=RIGHT.count_dl_in AND LEFT.i_addr_line=RIGHT.i_addr_line
              AND LEFT.i_addr_street_type=RIGHT.i_addr_street_type AND LEFT.i_addr_state=RIGHT.i_addr_state AND LEFT.i_addr_zip=RIGHT.i_addr_zip AND LEFT.i_addr_city=RIGHT.i_addr_city AND LEFT.i_addr_county=RIGHT.i_addr_county AND LEFT.i_addr_country=RIGHT.i_addr_country AND LEFT.i_addr_type=RIGHT.i_addr_type AND LEFT.count_addr_in=RIGHT.count_addr_in AND LEFT.i_vehicle_vin=RIGHT.i_vehicle_vin AND LEFT.i_vehicle_year=RIGHT.i_vehicle_year
              AND LEFT.i_vehicle_make=RIGHT.i_vehicle_make AND LEFT.i_vehicle_model=RIGHT.i_vehicle_model AND LEFT.i_vehicle_plate_data=RIGHT.i_vehicle_plate_data AND LEFT.i_vehicle_state=RIGHT.i_vehicle_state AND LEFT.count_vehicle_in=RIGHT.count_vehicle_in AND LEFT.i_unique_id=RIGHT.i_unique_id AND LEFT.i_unique_id_type=RIGHT.i_unique_id_type AND LEFT.record_version=RIGHT.record_version AND LEFT.reference_number=RIGHT.reference_number AND LEFT.processing_status=RIGHT.processing_status
              AND LEFT.billing_type_id=RIGHT.billing_type_id AND LEFT.price=RIGHT.price AND LEFT.currency=RIGHT.currency AND LEFT.pricing_error_code=RIGHT.pricing_error_code AND LEFT.free=RIGHT.free AND LEFT.result_format=RIGHT.result_format AND LEFT.report_options=RIGHT.report_options AND LEFT.phone_number=RIGHT.phone_number AND LEFT.participant_type=RIGHT.participant_type AND LEFT.participant_policy_number=RIGHT.participant_policy_number
              AND LEFT.participant_carrier_name=RIGHT.participant_carrier_name AND LEFT.ordering_carrier_policy_number=RIGHT.ordering_carrier_policy_number AND LEFT.ordering_carrier_name=RIGHT.ordering_carrier_name AND LEFT.datafill_start=RIGHT.datafill_start AND LEFT.name_present_cnt=RIGHT.name_present_cnt AND LEFT.full_address_present_cnt=RIGHT.full_address_present_cnt AND LEFT.phone_present_cnt=RIGHT.phone_present_cnt AND LEFT.plate_present_cnt=RIGHT.plate_present_cnt AND LEFT.dob_present_cnt=RIGHT.dob_present_cnt AND LEFT.dob_appended_cnt=RIGHT.dob_appended_cnt
              AND LEFT.ssn_present_cnt=RIGHT.ssn_present_cnt AND LEFT.ssn_appended_cnt=RIGHT.ssn_appended_cnt AND LEFT.dln_present_cnt=RIGHT.dln_present_cnt AND LEFT.dln_appended_cnt=RIGHT.dln_appended_cnt AND LEFT.policy_number_present_cnt=RIGHT.policy_number_present_cnt AND LEFT.carrier_name_present_cnt=RIGHT.carrier_name_present_cnt AND LEFT.rpl_search_cnt=RIGHT.rpl_search_cnt AND LEFT.rpl_hit_cnt=RIGHT.rpl_hit_cnt AND LEFT.rps_search_cnt=RIGHT.rps_search_cnt AND LEFT.rps_hit_cnt=RIGHT.rps_hit_cnt
              AND LEFT.subject_priority=RIGHT.subject_priority AND LEFT.vehicle_priority=RIGHT.vehicle_priority AND LEFT.name_addr_search_cnt=RIGHT.name_addr_search_cnt AND LEFT.name_addr_hit_cnt=RIGHT.name_addr_hit_cnt AND LEFT.vin_search_cnt=RIGHT.vin_search_cnt AND LEFT.vin_hit_cnt=RIGHT.vin_hit_cnt AND LEFT.curr_coverage_cnt=RIGHT.curr_coverage_cnt AND LEFT.rps_addr_fill_cnt=RIGHT.rps_addr_fill_cnt AND LEFT.rps_addr_new_cnt=RIGHT.rps_addr_new_cnt AND LEFT.rps_addr_addtl_cnt=RIGHT.rps_addr_addtl_cnt
              AND LEFT.rps_phone_fill_cnt=RIGHT.rps_phone_fill_cnt AND LEFT.rps_phone_new_cnt=RIGHT.rps_phone_new_cnt AND LEFT.rps_phone_addtl_cnt=RIGHT.rps_phone_addtl_cnt AND LEFT.rps_dob_fill_cnt=RIGHT.rps_dob_fill_cnt AND LEFT.rps_dob_new_cnt=RIGHT.rps_dob_new_cnt AND LEFT.rps_dob_addl_cnt=RIGHT.rps_dob_addl_cnt AND LEFT.rps_ssn_fill_cnt=RIGHT.rps_ssn_fill_cnt AND LEFT.rps_ssn_new_cnt=RIGHT.rps_ssn_new_cnt AND LEFT.rps_ssn_addtl_cnt=RIGHT.rps_ssn_addtl_cnt AND LEFT.ccfc_vin_search_cnt=RIGHT.ccfc_vin_search_cnt
              AND LEFT.ccfc_vin_match_during_dol_cnt=RIGHT.ccfc_vin_match_during_dol_cnt AND LEFT.ccfc_vin_match_during_grace_cnt=RIGHT.ccfc_vin_match_during_grace_cnt AND LEFT.ccfc_vin_match_beyond_dol_cnt=RIGHT.ccfc_vin_match_beyond_dol_cnt AND LEFT.ccfc_vin_no_match_cnt=RIGHT.ccfc_vin_no_match_cnt AND LEFT.experian_no_hit_cnt=RIGHT.experian_no_hit_cnt AND LEFT.rps_no_hit_cnt=RIGHT.rps_no_hit_cnt AND LEFT.rpl_no_hit_cnt=RIGHT.rpl_no_hit_cnt AND LEFT.nal_no_hit_cnt=RIGHT.nal_no_hit_cnt AND LEFT.risk_ind_cnt_5=RIGHT.risk_ind_cnt_5 AND LEFT.claim_billing_period=RIGHT.claim_billing_period
              AND LEFT.claim_number=RIGHT.claim_number AND LEFT.claim_state=RIGHT.claim_state AND LEFT.valid_inquiry_cnt=RIGHT.valid_inquiry_cnt AND LEFT.ccfc_na_search_cnt=RIGHT.ccfc_na_search_cnt AND LEFT.zip_code_present_cnt=RIGHT.zip_code_present_cnt AND LEFT.phone_hits_cnt=RIGHT.phone_hits_cnt AND LEFT.dob_hits_cnt=RIGHT.dob_hits_cnt AND LEFT.ssn_hits_cnt=RIGHT.ssn_hits_cnt AND LEFT.number_days_claim=RIGHT.number_days_claim AND LEFT.ccfc_na_match_during_dol_cnt=RIGHT.ccfc_na_match_during_dol_cnt
              AND LEFT.ccfc_na_match_during_grace_cnt=RIGHT.ccfc_na_match_during_grace_cnt AND LEFT.ccfc_na_match_beyond_dol_cnt=RIGHT.ccfc_na_match_beyond_dol_cnt AND LEFT.ccfc_na_no_match_cnt=RIGHT.ccfc_na_no_match_cnt AND LEFT.vin_present_cnt=RIGHT.vin_present_cnt AND LEFT.policy_or_carrier_present_cnt=RIGHT.policy_or_carrier_present_cnt AND LEFT.nal_search_cnt=RIGHT.nal_search_cnt AND LEFT.nal_hit_cnt=RIGHT.nal_hit_cnt AND LEFT.nal_addtl_cnt=RIGHT.nal_addtl_cnt AND LEFT.nal_new_cnt=RIGHT.nal_new_cnt AND LEFT.rps_addr_hit_cnt=RIGHT.rps_addr_hit_cnt
              AND LEFT.rps_dob_hit_cnt=RIGHT.rps_dob_hit_cnt AND LEFT.rps_ssn_hit_cnt=RIGHT.rps_ssn_hit_cnt AND LEFT.experian_search_cnt=RIGHT.experian_search_cnt AND LEFT.experian_hit_cnt=RIGHT.experian_hit_cnt AND LEFT.unique_claims_cnt=RIGHT.unique_claims_cnt AND LEFT.total_rejected_cnt=RIGHT.total_rejected_cnt AND LEFT.transaction_code=RIGHT.transaction_code AND LEFT.return_node_id=RIGHT.return_node_id AND LEFT.request_node_id=RIGHT.request_node_id AND LEFT.order_status_code=RIGHT.order_status_code
              AND LEFT.product_line=RIGHT.product_line AND LEFT.login_history_id=RIGHT.login_history_id AND LEFT.ip_address=RIGHT.ip_address AND LEFT.response_time=RIGHT.response_time AND LEFT.esp_method=RIGHT.esp_method AND LEFT.batch_job_id=RIGHT.batch_job_id AND LEFT.batch_seq_number=RIGHT.batch_seq_number AND LEFT.user_added=RIGHT.user_added AND LEFT.user_changed=RIGHT.user_changed AND LEFT.date_changed=RIGHT.date_changed
              AND LEFT.date_of_loss=RIGHT.date_of_loss AND LEFT.participant_role=RIGHT.participant_role AND LEFT.cdsc_na_search_cnt=RIGHT.cdsc_na_search_cnt AND LEFT.cdsc_na_hit_cnt=RIGHT.cdsc_na_hit_cnt AND LEFT.cdsc_na_no_hit_cnt=RIGHT.cdsc_na_no_hit_cnt AND LEFT.cdsc_vin_search_cnt=RIGHT.cdsc_vin_search_cnt AND LEFT.cdsc_vin_hit_cnt=RIGHT.cdsc_vin_hit_cnt AND LEFT.cdsc_vin_no_hit_cnt=RIGHT.cdsc_vin_no_hit_cnt AND LEFT.ambest_number=RIGHT.ambest_number AND LEFT.policy_id=RIGHT.policy_id AND LEFT.vault_date_first_seen=RIGHT.vault_date_first_seen AND LEFT.vault_date_last_seen=RIGHT.vault_date_last_seen,MergeData(LEFT,RIGHT),FULL OUTER,HASH);
  WithRT MergeData1(WithRT le, WithRT ri) := TRANSFORM // old, updated, new
    SELF.vault_date_first_seen := MAP (le.__Tpe = 0 => ri.vault_date_first_seen,ri.__Tpe = 0 => le.vault_date_first_seen,le.vault_date_first_seen<ri.vault_date_first_seen => le.vault_date_first_seen,ri.vault_date_first_seen);
    SELF.__Tpe := MAP (le.__Tpe = 0 => ri.__Tpe,ri.__Tpe = 0 => le.__Tpe,RecordType.Updated);
    SELF := IF( le.__Tpe=0,ri,le);
  END;
 
  // Ingest1: Merge Open Old with Open New to get old, updated, new
  Ingest1 := JOIN( Ingest0(__Tpe=RecordType.Old),Ingest0(__Tpe=RecordType.New),LEFT.vault_uid_hash=RIGHT.vault_uid_hash AND LEFT.transaction_id=RIGHT.transaction_id AND LEFT.product_id=RIGHT.product_id AND LEFT.date_added=RIGHT.date_added AND LEFT.login_id=RIGHT.login_id AND LEFT.billing_code=RIGHT.billing_code AND LEFT.service_type=RIGHT.service_type
              AND LEFT.report_code=RIGHT.report_code AND LEFT.account_base=RIGHT.account_base AND LEFT.account_suffix=RIGHT.account_suffix AND LEFT.account_id=RIGHT.account_id AND LEFT.customer_number=RIGHT.customer_number AND LEFT.full_quote_back=RIGHT.full_quote_back AND LEFT.i_date_ordered=RIGHT.i_date_ordered AND LEFT.i_person_ssn=RIGHT.i_person_ssn AND LEFT.i_person_name_prefix=RIGHT.i_person_name_prefix AND LEFT.i_person_last_name=RIGHT.i_person_last_name
              AND LEFT.i_person_first_name=RIGHT.i_person_first_name AND LEFT.i_person_middle_name=RIGHT.i_person_middle_name AND LEFT.i_person_name_suffix=RIGHT.i_person_name_suffix AND LEFT.i_person_dob=RIGHT.i_person_dob AND LEFT.count_person_in=RIGHT.count_person_in AND LEFT.i_dl1_number=RIGHT.i_dl1_number AND LEFT.i_dl1_state=RIGHT.i_dl1_state AND LEFT.i_dl1_type=RIGHT.i_dl1_type AND LEFT.count_dl_in=RIGHT.count_dl_in AND LEFT.i_addr_line=RIGHT.i_addr_line
              AND LEFT.i_addr_street_type=RIGHT.i_addr_street_type AND LEFT.i_addr_state=RIGHT.i_addr_state AND LEFT.i_addr_zip=RIGHT.i_addr_zip AND LEFT.i_addr_city=RIGHT.i_addr_city AND LEFT.i_addr_county=RIGHT.i_addr_county AND LEFT.i_addr_country=RIGHT.i_addr_country AND LEFT.i_addr_type=RIGHT.i_addr_type AND LEFT.count_addr_in=RIGHT.count_addr_in AND LEFT.i_vehicle_vin=RIGHT.i_vehicle_vin AND LEFT.i_vehicle_year=RIGHT.i_vehicle_year
              AND LEFT.i_vehicle_make=RIGHT.i_vehicle_make AND LEFT.i_vehicle_model=RIGHT.i_vehicle_model AND LEFT.i_vehicle_plate_data=RIGHT.i_vehicle_plate_data AND LEFT.i_vehicle_state=RIGHT.i_vehicle_state AND LEFT.count_vehicle_in=RIGHT.count_vehicle_in AND LEFT.i_unique_id=RIGHT.i_unique_id AND LEFT.i_unique_id_type=RIGHT.i_unique_id_type AND LEFT.record_version=RIGHT.record_version AND LEFT.reference_number=RIGHT.reference_number AND LEFT.processing_status=RIGHT.processing_status
              AND LEFT.billing_type_id=RIGHT.billing_type_id AND LEFT.price=RIGHT.price AND LEFT.currency=RIGHT.currency AND LEFT.pricing_error_code=RIGHT.pricing_error_code AND LEFT.free=RIGHT.free AND LEFT.result_format=RIGHT.result_format AND LEFT.report_options=RIGHT.report_options AND LEFT.phone_number=RIGHT.phone_number AND LEFT.participant_type=RIGHT.participant_type AND LEFT.participant_policy_number=RIGHT.participant_policy_number
              AND LEFT.participant_carrier_name=RIGHT.participant_carrier_name AND LEFT.ordering_carrier_policy_number=RIGHT.ordering_carrier_policy_number AND LEFT.ordering_carrier_name=RIGHT.ordering_carrier_name AND LEFT.datafill_start=RIGHT.datafill_start AND LEFT.name_present_cnt=RIGHT.name_present_cnt AND LEFT.full_address_present_cnt=RIGHT.full_address_present_cnt AND LEFT.phone_present_cnt=RIGHT.phone_present_cnt AND LEFT.plate_present_cnt=RIGHT.plate_present_cnt AND LEFT.dob_present_cnt=RIGHT.dob_present_cnt AND LEFT.dob_appended_cnt=RIGHT.dob_appended_cnt
              AND LEFT.ssn_present_cnt=RIGHT.ssn_present_cnt AND LEFT.ssn_appended_cnt=RIGHT.ssn_appended_cnt AND LEFT.dln_present_cnt=RIGHT.dln_present_cnt AND LEFT.dln_appended_cnt=RIGHT.dln_appended_cnt AND LEFT.policy_number_present_cnt=RIGHT.policy_number_present_cnt AND LEFT.carrier_name_present_cnt=RIGHT.carrier_name_present_cnt AND LEFT.rpl_search_cnt=RIGHT.rpl_search_cnt AND LEFT.rpl_hit_cnt=RIGHT.rpl_hit_cnt AND LEFT.rps_search_cnt=RIGHT.rps_search_cnt AND LEFT.rps_hit_cnt=RIGHT.rps_hit_cnt
              AND LEFT.subject_priority=RIGHT.subject_priority AND LEFT.vehicle_priority=RIGHT.vehicle_priority AND LEFT.name_addr_search_cnt=RIGHT.name_addr_search_cnt AND LEFT.name_addr_hit_cnt=RIGHT.name_addr_hit_cnt AND LEFT.vin_search_cnt=RIGHT.vin_search_cnt AND LEFT.vin_hit_cnt=RIGHT.vin_hit_cnt AND LEFT.curr_coverage_cnt=RIGHT.curr_coverage_cnt AND LEFT.rps_addr_fill_cnt=RIGHT.rps_addr_fill_cnt AND LEFT.rps_addr_new_cnt=RIGHT.rps_addr_new_cnt AND LEFT.rps_addr_addtl_cnt=RIGHT.rps_addr_addtl_cnt
              AND LEFT.rps_phone_fill_cnt=RIGHT.rps_phone_fill_cnt AND LEFT.rps_phone_new_cnt=RIGHT.rps_phone_new_cnt AND LEFT.rps_phone_addtl_cnt=RIGHT.rps_phone_addtl_cnt AND LEFT.rps_dob_fill_cnt=RIGHT.rps_dob_fill_cnt AND LEFT.rps_dob_new_cnt=RIGHT.rps_dob_new_cnt AND LEFT.rps_dob_addl_cnt=RIGHT.rps_dob_addl_cnt AND LEFT.rps_ssn_fill_cnt=RIGHT.rps_ssn_fill_cnt AND LEFT.rps_ssn_new_cnt=RIGHT.rps_ssn_new_cnt AND LEFT.rps_ssn_addtl_cnt=RIGHT.rps_ssn_addtl_cnt AND LEFT.ccfc_vin_search_cnt=RIGHT.ccfc_vin_search_cnt
              AND LEFT.ccfc_vin_match_during_dol_cnt=RIGHT.ccfc_vin_match_during_dol_cnt AND LEFT.ccfc_vin_match_during_grace_cnt=RIGHT.ccfc_vin_match_during_grace_cnt AND LEFT.ccfc_vin_match_beyond_dol_cnt=RIGHT.ccfc_vin_match_beyond_dol_cnt AND LEFT.ccfc_vin_no_match_cnt=RIGHT.ccfc_vin_no_match_cnt AND LEFT.experian_no_hit_cnt=RIGHT.experian_no_hit_cnt AND LEFT.rps_no_hit_cnt=RIGHT.rps_no_hit_cnt AND LEFT.rpl_no_hit_cnt=RIGHT.rpl_no_hit_cnt AND LEFT.nal_no_hit_cnt=RIGHT.nal_no_hit_cnt AND LEFT.risk_ind_cnt_5=RIGHT.risk_ind_cnt_5 AND LEFT.claim_billing_period=RIGHT.claim_billing_period
              AND LEFT.claim_number=RIGHT.claim_number AND LEFT.claim_state=RIGHT.claim_state AND LEFT.valid_inquiry_cnt=RIGHT.valid_inquiry_cnt AND LEFT.ccfc_na_search_cnt=RIGHT.ccfc_na_search_cnt AND LEFT.zip_code_present_cnt=RIGHT.zip_code_present_cnt AND LEFT.phone_hits_cnt=RIGHT.phone_hits_cnt AND LEFT.dob_hits_cnt=RIGHT.dob_hits_cnt AND LEFT.ssn_hits_cnt=RIGHT.ssn_hits_cnt AND LEFT.number_days_claim=RIGHT.number_days_claim AND LEFT.ccfc_na_match_during_dol_cnt=RIGHT.ccfc_na_match_during_dol_cnt
              AND LEFT.ccfc_na_match_during_grace_cnt=RIGHT.ccfc_na_match_during_grace_cnt AND LEFT.ccfc_na_match_beyond_dol_cnt=RIGHT.ccfc_na_match_beyond_dol_cnt AND LEFT.ccfc_na_no_match_cnt=RIGHT.ccfc_na_no_match_cnt AND LEFT.vin_present_cnt=RIGHT.vin_present_cnt AND LEFT.policy_or_carrier_present_cnt=RIGHT.policy_or_carrier_present_cnt AND LEFT.nal_search_cnt=RIGHT.nal_search_cnt AND LEFT.nal_hit_cnt=RIGHT.nal_hit_cnt AND LEFT.nal_addtl_cnt=RIGHT.nal_addtl_cnt AND LEFT.nal_new_cnt=RIGHT.nal_new_cnt AND LEFT.rps_addr_hit_cnt=RIGHT.rps_addr_hit_cnt
              AND LEFT.rps_dob_hit_cnt=RIGHT.rps_dob_hit_cnt AND LEFT.rps_ssn_hit_cnt=RIGHT.rps_ssn_hit_cnt AND LEFT.experian_search_cnt=RIGHT.experian_search_cnt AND LEFT.experian_hit_cnt=RIGHT.experian_hit_cnt AND LEFT.unique_claims_cnt=RIGHT.unique_claims_cnt AND LEFT.total_rejected_cnt=RIGHT.total_rejected_cnt AND LEFT.transaction_code=RIGHT.transaction_code AND LEFT.return_node_id=RIGHT.return_node_id AND LEFT.request_node_id=RIGHT.request_node_id AND LEFT.order_status_code=RIGHT.order_status_code
              AND LEFT.product_line=RIGHT.product_line AND LEFT.login_history_id=RIGHT.login_history_id AND LEFT.ip_address=RIGHT.ip_address AND LEFT.response_time=RIGHT.response_time AND LEFT.esp_method=RIGHT.esp_method AND LEFT.batch_job_id=RIGHT.batch_job_id AND LEFT.batch_seq_number=RIGHT.batch_seq_number AND LEFT.user_added=RIGHT.user_added AND LEFT.user_changed=RIGHT.user_changed AND LEFT.date_changed=RIGHT.date_changed
              AND LEFT.date_of_loss=RIGHT.date_of_loss AND LEFT.participant_role=RIGHT.participant_role AND LEFT.cdsc_na_search_cnt=RIGHT.cdsc_na_search_cnt AND LEFT.cdsc_na_hit_cnt=RIGHT.cdsc_na_hit_cnt AND LEFT.cdsc_na_no_hit_cnt=RIGHT.cdsc_na_no_hit_cnt AND LEFT.cdsc_vin_search_cnt=RIGHT.cdsc_vin_search_cnt AND LEFT.cdsc_vin_hit_cnt=RIGHT.cdsc_vin_hit_cnt AND LEFT.cdsc_vin_no_hit_cnt=RIGHT.cdsc_vin_no_hit_cnt AND LEFT.ambest_number=RIGHT.ambest_number AND LEFT.policy_id=RIGHT.policy_id AND LEFT.vault_date_last_seen=0 AND RIGHT.vault_date_last_seen=0,MergeData1(LEFT,RIGHT),FULL OUTER,HASH);
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
  SHARED AllRecs := ORe+NR1+NR(vault_rid<>0) : PERSIST('~temp::I_rmp_transaction_log::Ingest_Cache',EXPIRE(I_rmp_transaction_log.Config.PersistExpire));
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
