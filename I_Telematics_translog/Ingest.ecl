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
  Ingest0 := JOIN( Base0,FilesToIngest0,LEFT.vault_uid_hash=RIGHT.vault_uid_hash AND LEFT.transaction_id=RIGHT.transaction_id AND LEFT.date_added=RIGHT.date_added AND LEFT.submitter=RIGHT.submitter AND LEFT.customer_number=RIGHT.customer_number AND LEFT.customer_am_best=RIGHT.customer_am_best AND LEFT.account_base=RIGHT.account_base
              AND LEFT.account_suffix=RIGHT.account_suffix AND LEFT.reference_number=RIGHT.reference_number AND LEFT.account_id=RIGHT.account_id AND LEFT.policy_number=RIGHT.policy_number AND LEFT.insurance_type=RIGHT.insurance_type AND LEFT.policy_type=RIGHT.policy_type AND LEFT.event_type=RIGHT.event_type AND LEFT.event_status_code=RIGHT.event_status_code AND LEFT.sent_to_billing=RIGHT.sent_to_billing AND LEFT.billing_report_code=RIGHT.billing_report_code
              AND LEFT.quantity=RIGHT.quantity AND LEFT.year_one_end_date=RIGHT.year_one_end_date AND LEFT.vin=RIGHT.vin AND LEFT.make=RIGHT.make AND LEFT.model=RIGHT.model AND LEFT.year=RIGHT.year AND LEFT.ship_to_address=RIGHT.ship_to_address AND LEFT.ship_to_city=RIGHT.ship_to_city AND LEFT.ship_to_state=RIGHT.ship_to_state AND LEFT.ship_to_zip=RIGHT.ship_to_zip
              AND LEFT.mail_addr_hse=RIGHT.mail_addr_hse AND LEFT.mail_addr_st_name=RIGHT.mail_addr_st_name AND LEFT.mail_addr_apt_num=RIGHT.mail_addr_apt_num AND LEFT.mail_addr_city=RIGHT.mail_addr_city AND LEFT.mail_addr_state=RIGHT.mail_addr_state AND LEFT.mail_addr_zip5=RIGHT.mail_addr_zip5 AND LEFT.carrier_label_branding=RIGHT.carrier_label_branding AND LEFT.vehicle_primary_driver_mobile_num=RIGHT.vehicle_primary_driver_mobile_num AND LEFT.policy_relationship=RIGHT.policy_relationship AND LEFT.last_name=RIGHT.last_name
              AND LEFT.first_name=RIGHT.first_name AND LEFT.middle_name=RIGHT.middle_name AND LEFT.suffix=RIGHT.suffix AND LEFT.dob=RIGHT.dob AND LEFT.driver_license_num=RIGHT.driver_license_num AND LEFT.email=RIGHT.email AND LEFT.mobile_num=RIGHT.mobile_num AND LEFT.change_effective_date=RIGHT.change_effective_date AND LEFT.user_added=RIGHT.user_added AND LEFT.user_changed=RIGHT.user_changed
              AND LEFT.date_changed=RIGHT.date_changed AND LEFT.product_id=RIGHT.product_id AND LEFT.vault_date_first_seen=RIGHT.vault_date_first_seen AND LEFT.vault_date_last_seen=RIGHT.vault_date_last_seen,MergeData(LEFT,RIGHT),FULL OUTER,HASH);
  WithRT MergeData1(WithRT le, WithRT ri) := TRANSFORM // old, updated, new
    SELF.vault_date_first_seen := MAP (le.__Tpe = 0 => ri.vault_date_first_seen,ri.__Tpe = 0 => le.vault_date_first_seen,le.vault_date_first_seen<ri.vault_date_first_seen => le.vault_date_first_seen,ri.vault_date_first_seen);
    SELF.__Tpe := MAP (le.__Tpe = 0 => ri.__Tpe,ri.__Tpe = 0 => le.__Tpe,RecordType.Updated);
    SELF := IF( le.__Tpe=0,ri,le);
  END;
 
  // Ingest1: Merge Open Old with Open New to get old, updated, new
  Ingest1 := JOIN( Ingest0(__Tpe=RecordType.Old),Ingest0(__Tpe=RecordType.New),LEFT.vault_uid_hash=RIGHT.vault_uid_hash AND LEFT.transaction_id=RIGHT.transaction_id AND LEFT.date_added=RIGHT.date_added AND LEFT.submitter=RIGHT.submitter AND LEFT.customer_number=RIGHT.customer_number AND LEFT.customer_am_best=RIGHT.customer_am_best AND LEFT.account_base=RIGHT.account_base
              AND LEFT.account_suffix=RIGHT.account_suffix AND LEFT.reference_number=RIGHT.reference_number AND LEFT.account_id=RIGHT.account_id AND LEFT.policy_number=RIGHT.policy_number AND LEFT.insurance_type=RIGHT.insurance_type AND LEFT.policy_type=RIGHT.policy_type AND LEFT.event_type=RIGHT.event_type AND LEFT.event_status_code=RIGHT.event_status_code AND LEFT.sent_to_billing=RIGHT.sent_to_billing AND LEFT.billing_report_code=RIGHT.billing_report_code
              AND LEFT.quantity=RIGHT.quantity AND LEFT.year_one_end_date=RIGHT.year_one_end_date AND LEFT.vin=RIGHT.vin AND LEFT.make=RIGHT.make AND LEFT.model=RIGHT.model AND LEFT.year=RIGHT.year AND LEFT.ship_to_address=RIGHT.ship_to_address AND LEFT.ship_to_city=RIGHT.ship_to_city AND LEFT.ship_to_state=RIGHT.ship_to_state AND LEFT.ship_to_zip=RIGHT.ship_to_zip
              AND LEFT.mail_addr_hse=RIGHT.mail_addr_hse AND LEFT.mail_addr_st_name=RIGHT.mail_addr_st_name AND LEFT.mail_addr_apt_num=RIGHT.mail_addr_apt_num AND LEFT.mail_addr_city=RIGHT.mail_addr_city AND LEFT.mail_addr_state=RIGHT.mail_addr_state AND LEFT.mail_addr_zip5=RIGHT.mail_addr_zip5 AND LEFT.carrier_label_branding=RIGHT.carrier_label_branding AND LEFT.vehicle_primary_driver_mobile_num=RIGHT.vehicle_primary_driver_mobile_num AND LEFT.policy_relationship=RIGHT.policy_relationship AND LEFT.last_name=RIGHT.last_name
              AND LEFT.first_name=RIGHT.first_name AND LEFT.middle_name=RIGHT.middle_name AND LEFT.suffix=RIGHT.suffix AND LEFT.dob=RIGHT.dob AND LEFT.driver_license_num=RIGHT.driver_license_num AND LEFT.email=RIGHT.email AND LEFT.mobile_num=RIGHT.mobile_num AND LEFT.change_effective_date=RIGHT.change_effective_date AND LEFT.user_added=RIGHT.user_added AND LEFT.user_changed=RIGHT.user_changed
              AND LEFT.date_changed=RIGHT.date_changed AND LEFT.product_id=RIGHT.product_id AND LEFT.vault_date_last_seen=0 AND RIGHT.vault_date_last_seen=0,MergeData1(LEFT,RIGHT),FULL OUTER,HASH);
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
  SHARED AllRecs := ORe+NR1+NR(vault_rid<>0) : PERSIST('~temp::I_Telematics_translog::Ingest_Cache',EXPIRE(I_Telematics_translog.Config.PersistExpire));
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
