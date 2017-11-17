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
  Ingest0 := JOIN( Base0,FilesToIngest0,LEFT.vault_uid_hash=RIGHT.vault_uid_hash AND LEFT.transaction_id=RIGHT.transaction_id AND LEFT.product_id=RIGHT.product_id AND LEFT.report_code=RIGHT.report_code AND LEFT.account_base=RIGHT.account_base AND LEFT.account_suffix=RIGHT.account_suffix AND LEFT.account_id=RIGHT.account_id
              AND LEFT.customer_id=RIGHT.customer_id AND LEFT.am_best_number=RIGHT.am_best_number AND LEFT.full_quote_back=RIGHT.full_quote_back AND LEFT.name_prefix=RIGHT.name_prefix AND LEFT.last_name=RIGHT.last_name AND LEFT.first_name=RIGHT.first_name AND LEFT.middle_name=RIGHT.middle_name AND LEFT.name_suffix=RIGHT.name_suffix AND LEFT.ssn=RIGHT.ssn AND LEFT.dl_current=RIGHT.dl_current
              AND LEFT.dl_current_state=RIGHT.dl_current_state AND LEFT.dl_prior=RIGHT.dl_prior AND LEFT.dl_prior_state=RIGHT.dl_prior_state AND LEFT.state_subject=RIGHT.state_subject AND LEFT.record_version=RIGHT.record_version AND LEFT.dob=RIGHT.dob AND LEFT.link_id=RIGHT.link_id AND LEFT.special_billing_id=RIGHT.special_billing_id AND LEFT.date_ordered=RIGHT.date_ordered AND LEFT.reference_number=RIGHT.reference_number
              AND LEFT.processing_status=RIGHT.processing_status AND LEFT.billing_type_id=RIGHT.billing_type_id AND LEFT.price=RIGHT.price AND LEFT.pricing_error_code=RIGHT.pricing_error_code AND LEFT.free=RIGHT.free AND LEFT.result_format=RIGHT.result_format AND LEFT.report_options=RIGHT.report_options AND LEFT.transaction_code=RIGHT.transaction_code AND LEFT.return_node_id=RIGHT.return_node_id AND LEFT.request_node_id=RIGHT.request_node_id
              AND LEFT.order_status_code=RIGHT.order_status_code AND LEFT.error_code=RIGHT.error_code AND LEFT.report_service_type=RIGHT.report_service_type AND LEFT.order_type=RIGHT.order_type AND LEFT.product_line=RIGHT.product_line AND LEFT.product_id_source=RIGHT.product_id_source AND LEFT.i_addr_house_num=RIGHT.i_addr_house_num AND LEFT.i_addr_apt_num=RIGHT.i_addr_apt_num AND LEFT.i_addr_line=RIGHT.i_addr_line AND LEFT.i_addr_state=RIGHT.i_addr_state
              AND LEFT.i_addr_zip=RIGHT.i_addr_zip AND LEFT.i_addr_city=RIGHT.i_addr_city AND LEFT.i_addr_county=RIGHT.i_addr_county AND LEFT.i_addr_country=RIGHT.i_addr_country AND LEFT.i_addr_first_seen_date=RIGHT.i_addr_first_seen_date AND LEFT.i_addr_last_seen_date=RIGHT.i_addr_last_seen_date AND LEFT.o_addr_house_num_current=RIGHT.o_addr_house_num_current AND LEFT.o_addr_apt_num_current=RIGHT.o_addr_apt_num_current AND LEFT.o_addr_line_current=RIGHT.o_addr_line_current AND LEFT.o_addr_state_current=RIGHT.o_addr_state_current
              AND LEFT.o_addr_zip_current=RIGHT.o_addr_zip_current AND LEFT.o_addr_city_current=RIGHT.o_addr_city_current AND LEFT.o_addr_county_current=RIGHT.o_addr_county_current AND LEFT.o_addr_country_current=RIGHT.o_addr_country_current AND LEFT.o_addr_first_seen_date_current=RIGHT.o_addr_first_seen_date_current AND LEFT.o_addr_last_seen_date_current=RIGHT.o_addr_last_seen_date_current AND LEFT.o_addr_house_num_prior_1=RIGHT.o_addr_house_num_prior_1 AND LEFT.o_addr_apt_num_prior_1=RIGHT.o_addr_apt_num_prior_1 AND LEFT.o_addr_line_prior_1=RIGHT.o_addr_line_prior_1 AND LEFT.o_addr_state_prior_1=RIGHT.o_addr_state_prior_1
              AND LEFT.o_addr_zip_prior_1=RIGHT.o_addr_zip_prior_1 AND LEFT.o_addr_city_prior_1=RIGHT.o_addr_city_prior_1 AND LEFT.o_addr_county_prior_1=RIGHT.o_addr_county_prior_1 AND LEFT.o_addr_country_prior_1=RIGHT.o_addr_country_prior_1 AND LEFT.o_addr_first_seen_date_prior_1=RIGHT.o_addr_first_seen_date_prior_1 AND LEFT.o_addr_last_seen_date_prior_1=RIGHT.o_addr_last_seen_date_prior_1 AND LEFT.o_addr_house_num_prior_2=RIGHT.o_addr_house_num_prior_2 AND LEFT.o_addr_apt_num_prior_2=RIGHT.o_addr_apt_num_prior_2 AND LEFT.o_addr_line_prior_2=RIGHT.o_addr_line_prior_2 AND LEFT.o_addr_state_prior_2=RIGHT.o_addr_state_prior_2
              AND LEFT.o_addr_zip_prior_2=RIGHT.o_addr_zip_prior_2 AND LEFT.o_addr_city_prior_2=RIGHT.o_addr_city_prior_2 AND LEFT.o_addr_county_prior_2=RIGHT.o_addr_county_prior_2 AND LEFT.o_addr_country_prior_2=RIGHT.o_addr_country_prior_2 AND LEFT.o_addr_first_seen_date_prior_2=RIGHT.o_addr_first_seen_date_prior_2 AND LEFT.o_addr_last_seen_date_prior_2=RIGHT.o_addr_last_seen_date_prior_2 AND LEFT.o_addr_house_num_prior_3=RIGHT.o_addr_house_num_prior_3 AND LEFT.o_addr_apt_num_prior_3=RIGHT.o_addr_apt_num_prior_3 AND LEFT.o_addr_line_prior_3=RIGHT.o_addr_line_prior_3 AND LEFT.o_addr_state_prior_3=RIGHT.o_addr_state_prior_3
              AND LEFT.o_addr_zip_prior_3=RIGHT.o_addr_zip_prior_3 AND LEFT.o_addr_city_prior_3=RIGHT.o_addr_city_prior_3 AND LEFT.o_addr_county_prior_3=RIGHT.o_addr_county_prior_3 AND LEFT.o_addr_country_prior_3=RIGHT.o_addr_country_prior_3 AND LEFT.o_addr_first_seen_date_prior_3=RIGHT.o_addr_first_seen_date_prior_3 AND LEFT.o_addr_last_seen_date_prior_3=RIGHT.o_addr_last_seen_date_prior_3 AND LEFT.login_history_id=RIGHT.login_history_id AND LEFT.ip_address=RIGHT.ip_address AND LEFT.response_time=RIGHT.response_time AND LEFT.esp_method=RIGHT.esp_method
              AND LEFT.batch_job_id=RIGHT.batch_job_id AND LEFT.batch_seq_number=RIGHT.batch_seq_number AND LEFT.user_added=RIGHT.user_added AND LEFT.date_added=RIGHT.date_added AND LEFT.user_changed=RIGHT.user_changed AND LEFT.date_changed=RIGHT.date_changed AND LEFT.is_active=RIGHT.is_active AND LEFT.vault_date_first_seen=RIGHT.vault_date_first_seen AND LEFT.vault_date_last_seen=RIGHT.vault_date_last_seen,MergeData(LEFT,RIGHT),FULL OUTER,HASH);
  WithRT MergeData1(WithRT le, WithRT ri) := TRANSFORM // old, updated, new
    SELF.vault_date_first_seen := MAP (le.__Tpe = 0 => ri.vault_date_first_seen,ri.__Tpe = 0 => le.vault_date_first_seen,le.vault_date_first_seen<ri.vault_date_first_seen => le.vault_date_first_seen,ri.vault_date_first_seen);
    SELF.__Tpe := MAP (le.__Tpe = 0 => ri.__Tpe,ri.__Tpe = 0 => le.__Tpe,RecordType.Updated);
    SELF := IF( le.__Tpe=0,ri,le);
  END;
 
  // Ingest1: Merge Open Old with Open New to get old, updated, new
  Ingest1 := JOIN( Ingest0(__Tpe=RecordType.Old),Ingest0(__Tpe=RecordType.New),LEFT.vault_uid_hash=RIGHT.vault_uid_hash AND LEFT.transaction_id=RIGHT.transaction_id AND LEFT.product_id=RIGHT.product_id AND LEFT.report_code=RIGHT.report_code AND LEFT.account_base=RIGHT.account_base AND LEFT.account_suffix=RIGHT.account_suffix AND LEFT.account_id=RIGHT.account_id
              AND LEFT.customer_id=RIGHT.customer_id AND LEFT.am_best_number=RIGHT.am_best_number AND LEFT.full_quote_back=RIGHT.full_quote_back AND LEFT.name_prefix=RIGHT.name_prefix AND LEFT.last_name=RIGHT.last_name AND LEFT.first_name=RIGHT.first_name AND LEFT.middle_name=RIGHT.middle_name AND LEFT.name_suffix=RIGHT.name_suffix AND LEFT.ssn=RIGHT.ssn AND LEFT.dl_current=RIGHT.dl_current
              AND LEFT.dl_current_state=RIGHT.dl_current_state AND LEFT.dl_prior=RIGHT.dl_prior AND LEFT.dl_prior_state=RIGHT.dl_prior_state AND LEFT.state_subject=RIGHT.state_subject AND LEFT.record_version=RIGHT.record_version AND LEFT.dob=RIGHT.dob AND LEFT.link_id=RIGHT.link_id AND LEFT.special_billing_id=RIGHT.special_billing_id AND LEFT.date_ordered=RIGHT.date_ordered AND LEFT.reference_number=RIGHT.reference_number
              AND LEFT.processing_status=RIGHT.processing_status AND LEFT.billing_type_id=RIGHT.billing_type_id AND LEFT.price=RIGHT.price AND LEFT.pricing_error_code=RIGHT.pricing_error_code AND LEFT.free=RIGHT.free AND LEFT.result_format=RIGHT.result_format AND LEFT.report_options=RIGHT.report_options AND LEFT.transaction_code=RIGHT.transaction_code AND LEFT.return_node_id=RIGHT.return_node_id AND LEFT.request_node_id=RIGHT.request_node_id
              AND LEFT.order_status_code=RIGHT.order_status_code AND LEFT.error_code=RIGHT.error_code AND LEFT.report_service_type=RIGHT.report_service_type AND LEFT.order_type=RIGHT.order_type AND LEFT.product_line=RIGHT.product_line AND LEFT.product_id_source=RIGHT.product_id_source AND LEFT.i_addr_house_num=RIGHT.i_addr_house_num AND LEFT.i_addr_apt_num=RIGHT.i_addr_apt_num AND LEFT.i_addr_line=RIGHT.i_addr_line AND LEFT.i_addr_state=RIGHT.i_addr_state
              AND LEFT.i_addr_zip=RIGHT.i_addr_zip AND LEFT.i_addr_city=RIGHT.i_addr_city AND LEFT.i_addr_county=RIGHT.i_addr_county AND LEFT.i_addr_country=RIGHT.i_addr_country AND LEFT.i_addr_first_seen_date=RIGHT.i_addr_first_seen_date AND LEFT.i_addr_last_seen_date=RIGHT.i_addr_last_seen_date AND LEFT.o_addr_house_num_current=RIGHT.o_addr_house_num_current AND LEFT.o_addr_apt_num_current=RIGHT.o_addr_apt_num_current AND LEFT.o_addr_line_current=RIGHT.o_addr_line_current AND LEFT.o_addr_state_current=RIGHT.o_addr_state_current
              AND LEFT.o_addr_zip_current=RIGHT.o_addr_zip_current AND LEFT.o_addr_city_current=RIGHT.o_addr_city_current AND LEFT.o_addr_county_current=RIGHT.o_addr_county_current AND LEFT.o_addr_country_current=RIGHT.o_addr_country_current AND LEFT.o_addr_first_seen_date_current=RIGHT.o_addr_first_seen_date_current AND LEFT.o_addr_last_seen_date_current=RIGHT.o_addr_last_seen_date_current AND LEFT.o_addr_house_num_prior_1=RIGHT.o_addr_house_num_prior_1 AND LEFT.o_addr_apt_num_prior_1=RIGHT.o_addr_apt_num_prior_1 AND LEFT.o_addr_line_prior_1=RIGHT.o_addr_line_prior_1 AND LEFT.o_addr_state_prior_1=RIGHT.o_addr_state_prior_1
              AND LEFT.o_addr_zip_prior_1=RIGHT.o_addr_zip_prior_1 AND LEFT.o_addr_city_prior_1=RIGHT.o_addr_city_prior_1 AND LEFT.o_addr_county_prior_1=RIGHT.o_addr_county_prior_1 AND LEFT.o_addr_country_prior_1=RIGHT.o_addr_country_prior_1 AND LEFT.o_addr_first_seen_date_prior_1=RIGHT.o_addr_first_seen_date_prior_1 AND LEFT.o_addr_last_seen_date_prior_1=RIGHT.o_addr_last_seen_date_prior_1 AND LEFT.o_addr_house_num_prior_2=RIGHT.o_addr_house_num_prior_2 AND LEFT.o_addr_apt_num_prior_2=RIGHT.o_addr_apt_num_prior_2 AND LEFT.o_addr_line_prior_2=RIGHT.o_addr_line_prior_2 AND LEFT.o_addr_state_prior_2=RIGHT.o_addr_state_prior_2
              AND LEFT.o_addr_zip_prior_2=RIGHT.o_addr_zip_prior_2 AND LEFT.o_addr_city_prior_2=RIGHT.o_addr_city_prior_2 AND LEFT.o_addr_county_prior_2=RIGHT.o_addr_county_prior_2 AND LEFT.o_addr_country_prior_2=RIGHT.o_addr_country_prior_2 AND LEFT.o_addr_first_seen_date_prior_2=RIGHT.o_addr_first_seen_date_prior_2 AND LEFT.o_addr_last_seen_date_prior_2=RIGHT.o_addr_last_seen_date_prior_2 AND LEFT.o_addr_house_num_prior_3=RIGHT.o_addr_house_num_prior_3 AND LEFT.o_addr_apt_num_prior_3=RIGHT.o_addr_apt_num_prior_3 AND LEFT.o_addr_line_prior_3=RIGHT.o_addr_line_prior_3 AND LEFT.o_addr_state_prior_3=RIGHT.o_addr_state_prior_3
              AND LEFT.o_addr_zip_prior_3=RIGHT.o_addr_zip_prior_3 AND LEFT.o_addr_city_prior_3=RIGHT.o_addr_city_prior_3 AND LEFT.o_addr_county_prior_3=RIGHT.o_addr_county_prior_3 AND LEFT.o_addr_country_prior_3=RIGHT.o_addr_country_prior_3 AND LEFT.o_addr_first_seen_date_prior_3=RIGHT.o_addr_first_seen_date_prior_3 AND LEFT.o_addr_last_seen_date_prior_3=RIGHT.o_addr_last_seen_date_prior_3 AND LEFT.login_history_id=RIGHT.login_history_id AND LEFT.ip_address=RIGHT.ip_address AND LEFT.response_time=RIGHT.response_time AND LEFT.esp_method=RIGHT.esp_method
              AND LEFT.batch_job_id=RIGHT.batch_job_id AND LEFT.batch_seq_number=RIGHT.batch_seq_number AND LEFT.user_added=RIGHT.user_added AND LEFT.date_added=RIGHT.date_added AND LEFT.user_changed=RIGHT.user_changed AND LEFT.date_changed=RIGHT.date_changed AND LEFT.is_active=RIGHT.is_active AND LEFT.vault_date_last_seen=0 AND RIGHT.vault_date_last_seen=0,MergeData1(LEFT,RIGHT),FULL OUTER,HASH);
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
  SHARED AllRecs := ORe+NR1+NR(vault_rid<>0) : PERSIST('~temp::I_dataenh_transaction_log::Ingest_Cache',EXPIRE(I_dataenh_transaction_log.Config.PersistExpire));
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
