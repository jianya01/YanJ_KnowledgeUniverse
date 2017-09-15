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
  Ingest0 := JOIN( Base0,FilesToIngest0,LEFT.vault_uid_hash=RIGHT.vault_uid_hash AND LEFT.transaction_id=RIGHT.transaction_id AND LEFT.product_id=RIGHT.product_id AND LEFT.date_added=RIGHT.date_added AND LEFT.agent_code=RIGHT.agent_code AND LEFT.service_type=RIGHT.service_type AND LEFT.safescan_ordered=RIGHT.safescan_ordered
              AND LEFT.curr_carr_ordered=RIGHT.curr_carr_ordered AND LEFT.add_ordered=RIGHT.add_ordered AND LEFT.hov_rp_ordered=RIGHT.hov_rp_ordered AND LEFT.inq_process_stat_code=RIGHT.inq_process_stat_code AND LEFT.hov_process_stat_code=RIGHT.hov_process_stat_code AND LEFT.online_code=RIGHT.online_code AND LEFT.secondary_report=RIGHT.secondary_report AND LEFT.bill_code_1=RIGHT.bill_code_1 AND LEFT.bill_code_2=RIGHT.bill_code_2 AND LEFT.special_billing_id=RIGHT.special_billing_id
              AND LEFT.report_code=RIGHT.report_code AND LEFT.account_base=RIGHT.account_base AND LEFT.account_suffix=RIGHT.account_suffix AND LEFT.account_id=RIGHT.account_id AND LEFT.customer_number=RIGHT.customer_number AND LEFT.bill_as=RIGHT.bill_as AND LEFT.type_bill=RIGHT.type_bill AND LEFT.account_type=RIGHT.account_type AND LEFT.vin_decode=RIGHT.vin_decode AND LEFT.full_quote_back=RIGHT.full_quote_back
              AND LEFT.i_date_ordered=RIGHT.i_date_ordered AND LEFT.count_person_in=RIGHT.count_person_in AND LEFT.count_person_used=RIGHT.count_person_used AND LEFT.i_addr1_house_num=RIGHT.i_addr1_house_num AND LEFT.i_addr1_apt_num=RIGHT.i_addr1_apt_num AND LEFT.i_addr1_line=RIGHT.i_addr1_line AND LEFT.i_addr1_state=RIGHT.i_addr1_state AND LEFT.i_addr1_zip=RIGHT.i_addr1_zip AND LEFT.i_addr1_city=RIGHT.i_addr1_city AND LEFT.i_addr1_county=RIGHT.i_addr1_county
              AND LEFT.i_addr1_country=RIGHT.i_addr1_country AND LEFT.i_addr1_type=RIGHT.i_addr1_type AND LEFT.i_addr2_house_num=RIGHT.i_addr2_house_num AND LEFT.i_addr2_apt_num=RIGHT.i_addr2_apt_num AND LEFT.i_addr2_line=RIGHT.i_addr2_line AND LEFT.i_addr2_state=RIGHT.i_addr2_state AND LEFT.i_addr2_zip=RIGHT.i_addr2_zip AND LEFT.i_addr2_city=RIGHT.i_addr2_city AND LEFT.i_addr2_county=RIGHT.i_addr2_county AND LEFT.i_addr2_country=RIGHT.i_addr2_country
              AND LEFT.i_addr2_type=RIGHT.i_addr2_type AND LEFT.i_addr3_line=RIGHT.i_addr3_line AND LEFT.i_addr3_house_num=RIGHT.i_addr3_house_num AND LEFT.i_addr3_apt_num=RIGHT.i_addr3_apt_num AND LEFT.i_addr3_state=RIGHT.i_addr3_state AND LEFT.i_addr3_zip=RIGHT.i_addr3_zip AND LEFT.i_addr3_city=RIGHT.i_addr3_city AND LEFT.i_addr3_county=RIGHT.i_addr3_county AND LEFT.i_addr3_country=RIGHT.i_addr3_country AND LEFT.i_addr3_type=RIGHT.i_addr3_type
              AND LEFT.count_addr_in=RIGHT.count_addr_in AND LEFT.count_addr_used=RIGHT.count_addr_used AND LEFT.count_vehicle_in=RIGHT.count_vehicle_in AND LEFT.count_vehicle_used=RIGHT.count_vehicle_used AND LEFT.vin_d_code=RIGHT.vin_d_code AND LEFT.jua_ltr_code=RIGHT.jua_ltr_code AND LEFT.prc_founds=RIGHT.prc_founds AND LEFT.addit_driver_reported=RIGHT.addit_driver_reported AND LEFT.prior_inquiry_found=RIGHT.prior_inquiry_found AND LEFT.dd_flag=RIGHT.dd_flag
              AND LEFT.policy_type=RIGHT.policy_type AND LEFT.policy_number=RIGHT.policy_number AND LEFT.inq_hist_claims=RIGHT.inq_hist_claims AND LEFT.count_claims_found=RIGHT.count_claims_found AND LEFT.count_claims_reported=RIGHT.count_claims_reported AND LEFT.risk_claims=RIGHT.risk_claims AND LEFT.insrd_claims=RIGHT.insrd_claims AND LEFT.subject_claims=RIGHT.subject_claims AND LEFT.vin_claims=RIGHT.vin_claims AND LEFT.did_count=RIGHT.did_count
              AND LEFT.requestor_type=RIGHT.requestor_type AND LEFT.test_prod_indicator=RIGHT.test_prod_indicator AND LEFT.iso_vm=RIGHT.iso_vm AND LEFT.line_id=RIGHT.line_id AND LEFT.inquiry_history_records_added=RIGHT.inquiry_history_records_added AND LEFT.processing_comments=RIGHT.processing_comments AND LEFT.record_version=RIGHT.record_version AND LEFT.reference_number=RIGHT.reference_number AND LEFT.processing_status=RIGHT.processing_status AND LEFT.billing_type_id=RIGHT.billing_type_id
              AND LEFT.price=RIGHT.price AND LEFT.currency=RIGHT.currency AND LEFT.pricing_error_code=RIGHT.pricing_error_code AND LEFT.free=RIGHT.free AND LEFT.record_count=RIGHT.record_count AND LEFT.result_format=RIGHT.result_format AND LEFT.report_options=RIGHT.report_options AND LEFT.transaction_code=RIGHT.transaction_code AND LEFT.return_node_id=RIGHT.return_node_id AND LEFT.request_node_id=RIGHT.request_node_id
              AND LEFT.order_status_code=RIGHT.order_status_code AND LEFT.product_line=RIGHT.product_line AND LEFT.login_history_id=RIGHT.login_history_id AND LEFT.ip_address=RIGHT.ip_address AND LEFT.response_time=RIGHT.response_time AND LEFT.data_enhancement_response_time=RIGHT.data_enhancement_response_time AND LEFT.hov_response_time=RIGHT.hov_response_time AND LEFT.add_response_time=RIGHT.add_response_time AND LEFT.real_prop_response_time=RIGHT.real_prop_response_time AND LEFT.safe_scan_response_time=RIGHT.safe_scan_response_time
              AND LEFT.deltabase_subj_response_time=RIGHT.deltabase_subj_response_time AND LEFT.deltabase_claim_response_time=RIGHT.deltabase_claim_response_time AND LEFT.roxie_response_time=RIGHT.roxie_response_time AND LEFT.soap_call_error_msg=RIGHT.soap_call_error_msg AND LEFT.esp_method=RIGHT.esp_method AND LEFT.batch_job_id=RIGHT.batch_job_id AND LEFT.batch_seq_number=RIGHT.batch_seq_number AND LEFT.add_billed=RIGHT.add_billed AND LEFT.add_reported=RIGHT.add_reported AND LEFT.hh_add_billed=RIGHT.hh_add_billed
              AND LEFT.hh_billed=RIGHT.hh_billed AND LEFT.hh_vin_billed=RIGHT.hh_vin_billed AND LEFT.overage_billed=RIGHT.overage_billed AND LEFT.subj_add_billed=RIGHT.subj_add_billed AND LEFT.subj_billed=RIGHT.subj_billed AND LEFT.subj_reported=RIGHT.subj_reported AND LEFT.vin_billed=RIGHT.vin_billed AND LEFT.vin_plus_billed=RIGHT.vin_plus_billed AND LEFT.vin_plus_reported=RIGHT.vin_plus_reported AND LEFT.vin_reported=RIGHT.vin_reported
              AND LEFT.real_prop_billed=RIGHT.real_prop_billed AND LEFT.secondary_billed=RIGHT.secondary_billed AND LEFT.verbal_pos_billed=RIGHT.verbal_pos_billed AND LEFT.agent_billed=RIGHT.agent_billed AND LEFT.uw_billed=RIGHT.uw_billed AND LEFT.clue_prop_billed=RIGHT.clue_prop_billed AND LEFT.clue_prop_recs_b=RIGHT.clue_prop_recs_b AND LEFT.clue_prop_recs_d=RIGHT.clue_prop_recs_d AND LEFT.is_active=RIGHT.is_active AND LEFT.user_added=RIGHT.user_added
              AND LEFT.user_changed=RIGHT.user_changed AND LEFT.date_changed=RIGHT.date_changed AND LEFT.surcharge_possible=RIGHT.surcharge_possible AND LEFT.potentialcorruption=RIGHT.potentialcorruption AND LEFT.vault_date_first_seen=RIGHT.vault_date_first_seen AND LEFT.vault_date_last_seen=RIGHT.vault_date_last_seen,MergeData(LEFT,RIGHT),FULL OUTER,HASH);
  WithRT MergeData1(WithRT le, WithRT ri) := TRANSFORM // old, updated, new
    SELF.vault_date_first_seen := MAP (le.__Tpe = 0 => ri.vault_date_first_seen,ri.__Tpe = 0 => le.vault_date_first_seen,le.vault_date_first_seen<ri.vault_date_first_seen => le.vault_date_first_seen,ri.vault_date_first_seen);
    SELF.__Tpe := MAP (le.__Tpe = 0 => ri.__Tpe,ri.__Tpe = 0 => le.__Tpe,RecordType.Updated);
    SELF := IF( le.__Tpe=0,ri,le);
  END;
 
  // Ingest1: Merge Open Old with Open New to get old, updated, new
  Ingest1 := JOIN( Ingest0(__Tpe=RecordType.Old),Ingest0(__Tpe=RecordType.New),LEFT.vault_uid_hash=RIGHT.vault_uid_hash AND LEFT.transaction_id=RIGHT.transaction_id AND LEFT.product_id=RIGHT.product_id AND LEFT.date_added=RIGHT.date_added AND LEFT.agent_code=RIGHT.agent_code AND LEFT.service_type=RIGHT.service_type AND LEFT.safescan_ordered=RIGHT.safescan_ordered
              AND LEFT.curr_carr_ordered=RIGHT.curr_carr_ordered AND LEFT.add_ordered=RIGHT.add_ordered AND LEFT.hov_rp_ordered=RIGHT.hov_rp_ordered AND LEFT.inq_process_stat_code=RIGHT.inq_process_stat_code AND LEFT.hov_process_stat_code=RIGHT.hov_process_stat_code AND LEFT.online_code=RIGHT.online_code AND LEFT.secondary_report=RIGHT.secondary_report AND LEFT.bill_code_1=RIGHT.bill_code_1 AND LEFT.bill_code_2=RIGHT.bill_code_2 AND LEFT.special_billing_id=RIGHT.special_billing_id
              AND LEFT.report_code=RIGHT.report_code AND LEFT.account_base=RIGHT.account_base AND LEFT.account_suffix=RIGHT.account_suffix AND LEFT.account_id=RIGHT.account_id AND LEFT.customer_number=RIGHT.customer_number AND LEFT.bill_as=RIGHT.bill_as AND LEFT.type_bill=RIGHT.type_bill AND LEFT.account_type=RIGHT.account_type AND LEFT.vin_decode=RIGHT.vin_decode AND LEFT.full_quote_back=RIGHT.full_quote_back
              AND LEFT.i_date_ordered=RIGHT.i_date_ordered AND LEFT.count_person_in=RIGHT.count_person_in AND LEFT.count_person_used=RIGHT.count_person_used AND LEFT.i_addr1_house_num=RIGHT.i_addr1_house_num AND LEFT.i_addr1_apt_num=RIGHT.i_addr1_apt_num AND LEFT.i_addr1_line=RIGHT.i_addr1_line AND LEFT.i_addr1_state=RIGHT.i_addr1_state AND LEFT.i_addr1_zip=RIGHT.i_addr1_zip AND LEFT.i_addr1_city=RIGHT.i_addr1_city AND LEFT.i_addr1_county=RIGHT.i_addr1_county
              AND LEFT.i_addr1_country=RIGHT.i_addr1_country AND LEFT.i_addr1_type=RIGHT.i_addr1_type AND LEFT.i_addr2_house_num=RIGHT.i_addr2_house_num AND LEFT.i_addr2_apt_num=RIGHT.i_addr2_apt_num AND LEFT.i_addr2_line=RIGHT.i_addr2_line AND LEFT.i_addr2_state=RIGHT.i_addr2_state AND LEFT.i_addr2_zip=RIGHT.i_addr2_zip AND LEFT.i_addr2_city=RIGHT.i_addr2_city AND LEFT.i_addr2_county=RIGHT.i_addr2_county AND LEFT.i_addr2_country=RIGHT.i_addr2_country
              AND LEFT.i_addr2_type=RIGHT.i_addr2_type AND LEFT.i_addr3_line=RIGHT.i_addr3_line AND LEFT.i_addr3_house_num=RIGHT.i_addr3_house_num AND LEFT.i_addr3_apt_num=RIGHT.i_addr3_apt_num AND LEFT.i_addr3_state=RIGHT.i_addr3_state AND LEFT.i_addr3_zip=RIGHT.i_addr3_zip AND LEFT.i_addr3_city=RIGHT.i_addr3_city AND LEFT.i_addr3_county=RIGHT.i_addr3_county AND LEFT.i_addr3_country=RIGHT.i_addr3_country AND LEFT.i_addr3_type=RIGHT.i_addr3_type
              AND LEFT.count_addr_in=RIGHT.count_addr_in AND LEFT.count_addr_used=RIGHT.count_addr_used AND LEFT.count_vehicle_in=RIGHT.count_vehicle_in AND LEFT.count_vehicle_used=RIGHT.count_vehicle_used AND LEFT.vin_d_code=RIGHT.vin_d_code AND LEFT.jua_ltr_code=RIGHT.jua_ltr_code AND LEFT.prc_founds=RIGHT.prc_founds AND LEFT.addit_driver_reported=RIGHT.addit_driver_reported AND LEFT.prior_inquiry_found=RIGHT.prior_inquiry_found AND LEFT.dd_flag=RIGHT.dd_flag
              AND LEFT.policy_type=RIGHT.policy_type AND LEFT.policy_number=RIGHT.policy_number AND LEFT.inq_hist_claims=RIGHT.inq_hist_claims AND LEFT.count_claims_found=RIGHT.count_claims_found AND LEFT.count_claims_reported=RIGHT.count_claims_reported AND LEFT.risk_claims=RIGHT.risk_claims AND LEFT.insrd_claims=RIGHT.insrd_claims AND LEFT.subject_claims=RIGHT.subject_claims AND LEFT.vin_claims=RIGHT.vin_claims AND LEFT.did_count=RIGHT.did_count
              AND LEFT.requestor_type=RIGHT.requestor_type AND LEFT.test_prod_indicator=RIGHT.test_prod_indicator AND LEFT.iso_vm=RIGHT.iso_vm AND LEFT.line_id=RIGHT.line_id AND LEFT.inquiry_history_records_added=RIGHT.inquiry_history_records_added AND LEFT.processing_comments=RIGHT.processing_comments AND LEFT.record_version=RIGHT.record_version AND LEFT.reference_number=RIGHT.reference_number AND LEFT.processing_status=RIGHT.processing_status AND LEFT.billing_type_id=RIGHT.billing_type_id
              AND LEFT.price=RIGHT.price AND LEFT.currency=RIGHT.currency AND LEFT.pricing_error_code=RIGHT.pricing_error_code AND LEFT.free=RIGHT.free AND LEFT.record_count=RIGHT.record_count AND LEFT.result_format=RIGHT.result_format AND LEFT.report_options=RIGHT.report_options AND LEFT.transaction_code=RIGHT.transaction_code AND LEFT.return_node_id=RIGHT.return_node_id AND LEFT.request_node_id=RIGHT.request_node_id
              AND LEFT.order_status_code=RIGHT.order_status_code AND LEFT.product_line=RIGHT.product_line AND LEFT.login_history_id=RIGHT.login_history_id AND LEFT.ip_address=RIGHT.ip_address AND LEFT.response_time=RIGHT.response_time AND LEFT.data_enhancement_response_time=RIGHT.data_enhancement_response_time AND LEFT.hov_response_time=RIGHT.hov_response_time AND LEFT.add_response_time=RIGHT.add_response_time AND LEFT.real_prop_response_time=RIGHT.real_prop_response_time AND LEFT.safe_scan_response_time=RIGHT.safe_scan_response_time
              AND LEFT.deltabase_subj_response_time=RIGHT.deltabase_subj_response_time AND LEFT.deltabase_claim_response_time=RIGHT.deltabase_claim_response_time AND LEFT.roxie_response_time=RIGHT.roxie_response_time AND LEFT.soap_call_error_msg=RIGHT.soap_call_error_msg AND LEFT.esp_method=RIGHT.esp_method AND LEFT.batch_job_id=RIGHT.batch_job_id AND LEFT.batch_seq_number=RIGHT.batch_seq_number AND LEFT.add_billed=RIGHT.add_billed AND LEFT.add_reported=RIGHT.add_reported AND LEFT.hh_add_billed=RIGHT.hh_add_billed
              AND LEFT.hh_billed=RIGHT.hh_billed AND LEFT.hh_vin_billed=RIGHT.hh_vin_billed AND LEFT.overage_billed=RIGHT.overage_billed AND LEFT.subj_add_billed=RIGHT.subj_add_billed AND LEFT.subj_billed=RIGHT.subj_billed AND LEFT.subj_reported=RIGHT.subj_reported AND LEFT.vin_billed=RIGHT.vin_billed AND LEFT.vin_plus_billed=RIGHT.vin_plus_billed AND LEFT.vin_plus_reported=RIGHT.vin_plus_reported AND LEFT.vin_reported=RIGHT.vin_reported
              AND LEFT.real_prop_billed=RIGHT.real_prop_billed AND LEFT.secondary_billed=RIGHT.secondary_billed AND LEFT.verbal_pos_billed=RIGHT.verbal_pos_billed AND LEFT.agent_billed=RIGHT.agent_billed AND LEFT.uw_billed=RIGHT.uw_billed AND LEFT.clue_prop_billed=RIGHT.clue_prop_billed AND LEFT.clue_prop_recs_b=RIGHT.clue_prop_recs_b AND LEFT.clue_prop_recs_d=RIGHT.clue_prop_recs_d AND LEFT.is_active=RIGHT.is_active AND LEFT.user_added=RIGHT.user_added
              AND LEFT.user_changed=RIGHT.user_changed AND LEFT.date_changed=RIGHT.date_changed AND LEFT.surcharge_possible=RIGHT.surcharge_possible AND LEFT.potentialcorruption=RIGHT.potentialcorruption AND LEFT.vault_date_last_seen=0 AND RIGHT.vault_date_last_seen=0,MergeData1(LEFT,RIGHT),FULL OUTER,HASH);
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
  SHARED AllRecs := ORe+NR1+NR(vault_rid<>0) : PERSIST('~temp::I_clue_transaction_log::Ingest_Cache',EXPIRE(I_clue_transaction_log.Config.PersistExpire));
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
