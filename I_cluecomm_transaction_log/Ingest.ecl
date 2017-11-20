﻿IMPORT STD,SALT38;
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
  Ingest0 := JOIN( Base0,FilesToIngest0,LEFT.vault_uid_hash=RIGHT.vault_uid_hash AND LEFT.transaction_id=RIGHT.transaction_id AND LEFT.product_id=RIGHT.product_id AND LEFT.date_added=RIGHT.date_added AND LEFT.reference_number=RIGHT.reference_number AND LEFT.date_ordered=RIGHT.date_ordered AND LEFT.date_received=RIGHT.date_received
              AND LEFT.date_completed=RIGHT.date_completed AND LEFT.search_type=RIGHT.search_type AND LEFT.secondary_report=RIGHT.secondary_report AND LEFT.secondary_lob=RIGHT.secondary_lob AND LEFT.special_billing_id=RIGHT.special_billing_id AND LEFT.account_base=RIGHT.account_base AND LEFT.account_suffix=RIGHT.account_suffix AND LEFT.account_id=RIGHT.account_id AND LEFT.customer_number=RIGHT.customer_number AND LEFT.bill_as=RIGHT.bill_as
              AND LEFT.report_as=RIGHT.report_as AND LEFT.reporting_months=RIGHT.reporting_months AND LEFT.addl_reporting_months=RIGHT.addl_reporting_months AND LEFT.bi_allowed_with_sb=RIGHT.bi_allowed_with_sb AND LEFT.bi_claims_found=RIGHT.bi_claims_found AND LEFT.processing_status=RIGHT.processing_status AND LEFT.processing_comments=RIGHT.processing_comments AND LEFT.count_business=RIGHT.count_business AND LEFT.count_individual=RIGHT.count_individual AND LEFT.count_address=RIGHT.count_address
              AND LEFT.count_lob=RIGHT.count_lob AND LEFT.count_prior_policy_number=RIGHT.count_prior_policy_number AND LEFT.count_prior_ins_carrier=RIGHT.count_prior_ins_carrier AND LEFT.count_claims_found=RIGHT.count_claims_found AND LEFT.count_claims_loss_summ=RIGHT.count_claims_loss_summ AND LEFT.count_claims_addl_open=RIGHT.count_claims_addl_open AND LEFT.report_code=RIGHT.report_code AND LEFT.billing_type=RIGHT.billing_type AND LEFT.billing_type_id=RIGHT.billing_type_id AND LEFT.billed_date=RIGHT.billed_date
              AND LEFT.pricing_error_code=RIGHT.pricing_error_code AND LEFT.result_format=RIGHT.result_format AND LEFT.return_node_id=RIGHT.return_node_id AND LEFT.request_node_id=RIGHT.request_node_id AND LEFT.order_status_code=RIGHT.order_status_code AND LEFT.ip_address=RIGHT.ip_address AND LEFT.roxie_response_time=RIGHT.roxie_response_time AND LEFT.response_time=RIGHT.response_time AND LEFT.soap_call_error_msg=RIGHT.soap_call_error_msg AND LEFT.esp_method=RIGHT.esp_method
              AND LEFT.batch_job_id=RIGHT.batch_job_id AND LEFT.batch_seq_number=RIGHT.batch_seq_number AND LEFT.subj_billed=RIGHT.subj_billed AND LEFT.subj_reported=RIGHT.subj_reported AND LEFT.secondary_billed=RIGHT.secondary_billed AND LEFT.date_changed=RIGHT.date_changed AND LEFT.user_added=RIGHT.user_added AND LEFT.user_changed=RIGHT.user_changed AND LEFT.potentialcorruption=RIGHT.potentialcorruption AND LEFT.vault_date_first_seen=RIGHT.vault_date_first_seen AND LEFT.vault_date_last_seen=RIGHT.vault_date_last_seen,MergeData(LEFT,RIGHT),FULL OUTER,HASH);
  WithRT MergeData1(WithRT le, WithRT ri) := TRANSFORM // old, updated, new
    SELF.vault_date_first_seen := MAP (le.__Tpe = 0 => ri.vault_date_first_seen,ri.__Tpe = 0 => le.vault_date_first_seen,le.vault_date_first_seen<ri.vault_date_first_seen => le.vault_date_first_seen,ri.vault_date_first_seen);
    SELF.__Tpe := MAP (le.__Tpe = 0 => ri.__Tpe,ri.__Tpe = 0 => le.__Tpe,RecordType.Updated);
    SELF := IF( le.__Tpe=0,ri,le);
  END;
 
  // Ingest1: Merge Open Old with Open New to get old, updated, new
  Ingest1 := JOIN( Ingest0(__Tpe=RecordType.Old),Ingest0(__Tpe=RecordType.New),LEFT.vault_uid_hash=RIGHT.vault_uid_hash AND LEFT.transaction_id=RIGHT.transaction_id AND LEFT.product_id=RIGHT.product_id AND LEFT.date_added=RIGHT.date_added AND LEFT.reference_number=RIGHT.reference_number AND LEFT.date_ordered=RIGHT.date_ordered AND LEFT.date_received=RIGHT.date_received
              AND LEFT.date_completed=RIGHT.date_completed AND LEFT.search_type=RIGHT.search_type AND LEFT.secondary_report=RIGHT.secondary_report AND LEFT.secondary_lob=RIGHT.secondary_lob AND LEFT.special_billing_id=RIGHT.special_billing_id AND LEFT.account_base=RIGHT.account_base AND LEFT.account_suffix=RIGHT.account_suffix AND LEFT.account_id=RIGHT.account_id AND LEFT.customer_number=RIGHT.customer_number AND LEFT.bill_as=RIGHT.bill_as
              AND LEFT.report_as=RIGHT.report_as AND LEFT.reporting_months=RIGHT.reporting_months AND LEFT.addl_reporting_months=RIGHT.addl_reporting_months AND LEFT.bi_allowed_with_sb=RIGHT.bi_allowed_with_sb AND LEFT.bi_claims_found=RIGHT.bi_claims_found AND LEFT.processing_status=RIGHT.processing_status AND LEFT.processing_comments=RIGHT.processing_comments AND LEFT.count_business=RIGHT.count_business AND LEFT.count_individual=RIGHT.count_individual AND LEFT.count_address=RIGHT.count_address
              AND LEFT.count_lob=RIGHT.count_lob AND LEFT.count_prior_policy_number=RIGHT.count_prior_policy_number AND LEFT.count_prior_ins_carrier=RIGHT.count_prior_ins_carrier AND LEFT.count_claims_found=RIGHT.count_claims_found AND LEFT.count_claims_loss_summ=RIGHT.count_claims_loss_summ AND LEFT.count_claims_addl_open=RIGHT.count_claims_addl_open AND LEFT.report_code=RIGHT.report_code AND LEFT.billing_type=RIGHT.billing_type AND LEFT.billing_type_id=RIGHT.billing_type_id AND LEFT.billed_date=RIGHT.billed_date
              AND LEFT.pricing_error_code=RIGHT.pricing_error_code AND LEFT.result_format=RIGHT.result_format AND LEFT.return_node_id=RIGHT.return_node_id AND LEFT.request_node_id=RIGHT.request_node_id AND LEFT.order_status_code=RIGHT.order_status_code AND LEFT.ip_address=RIGHT.ip_address AND LEFT.roxie_response_time=RIGHT.roxie_response_time AND LEFT.response_time=RIGHT.response_time AND LEFT.soap_call_error_msg=RIGHT.soap_call_error_msg AND LEFT.esp_method=RIGHT.esp_method
              AND LEFT.batch_job_id=RIGHT.batch_job_id AND LEFT.batch_seq_number=RIGHT.batch_seq_number AND LEFT.subj_billed=RIGHT.subj_billed AND LEFT.subj_reported=RIGHT.subj_reported AND LEFT.secondary_billed=RIGHT.secondary_billed AND LEFT.date_changed=RIGHT.date_changed AND LEFT.user_added=RIGHT.user_added AND LEFT.user_changed=RIGHT.user_changed AND LEFT.potentialcorruption=RIGHT.potentialcorruption AND LEFT.vault_date_last_seen=0 AND RIGHT.vault_date_last_seen=0,MergeData1(LEFT,RIGHT),FULL OUTER,HASH);
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
  SHARED AllRecs := ORe+NR1+NR(vault_rid<>0) : PERSIST('~temp::I_cluecomm_transaction_log::Ingest_Cache',EXPIRE(I_cluecomm_transaction_log.Config.PersistExpire));
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

