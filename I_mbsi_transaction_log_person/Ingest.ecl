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
  Ingest0 := JOIN( Base0,FilesToIngest0,LEFT.vault_uid_hash=RIGHT.vault_uid_hash AND LEFT.transaction_id=RIGHT.transaction_id AND LEFT.sequence=RIGHT.sequence AND LEFT.first_name=RIGHT.first_name AND LEFT.middle_name=RIGHT.middle_name AND LEFT.last_name=RIGHT.last_name AND LEFT.suffix_name=RIGHT.suffix_name
              AND LEFT.ssn=RIGHT.ssn AND LEFT.current_dl_state=RIGHT.current_dl_state AND LEFT.current_dl_number=RIGHT.current_dl_number AND LEFT.prior_dl_state=RIGHT.prior_dl_state AND LEFT.prior_dl_number=RIGHT.prior_dl_number AND LEFT.prior_policy_number=RIGHT.prior_policy_number AND LEFT.date_added=RIGHT.date_added AND LEFT.product_id=RIGHT.product_id AND LEFT.telephone_area_code=RIGHT.telephone_area_code AND LEFT.telephone_exchange=RIGHT.telephone_exchange
              AND LEFT.telephone_number=RIGHT.telephone_number AND LEFT.reference_no=RIGHT.reference_no AND LEFT.unit_no=RIGHT.unit_no AND LEFT.customer_no=RIGHT.customer_no AND LEFT.quoteback=RIGHT.quoteback AND LEFT.order_date=RIGHT.order_date AND LEFT.current_house_no=RIGHT.current_house_no AND LEFT.current_street_name=RIGHT.current_street_name AND LEFT.current_apt_no=RIGHT.current_apt_no AND LEFT.current_city=RIGHT.current_city
              AND LEFT.current_state=RIGHT.current_state AND LEFT.current_zip=RIGHT.current_zip AND LEFT.current_zip_ext=RIGHT.current_zip_ext AND LEFT.former_house_no=RIGHT.former_house_no AND LEFT.former_street_name=RIGHT.former_street_name AND LEFT.former_apt_no=RIGHT.former_apt_no AND LEFT.former_city=RIGHT.former_city AND LEFT.former_state=RIGHT.former_state AND LEFT.former_zip=RIGHT.former_zip AND LEFT.former_zip_ext=RIGHT.former_zip_ext
              AND LEFT.dob=RIGHT.dob AND LEFT.sex=RIGHT.sex AND LEFT.service_type=RIGHT.service_type AND LEFT.spl_bill_id=RIGHT.spl_bill_id AND LEFT.subject_process_stat_code=RIGHT.subject_process_stat_code AND LEFT.mortgage_no=RIGHT.mortgage_no AND LEFT.lex_id=RIGHT.lex_id AND LEFT.participant_number=RIGHT.participant_number AND LEFT.participant_type=RIGHT.participant_type AND LEFT.participant_role=RIGHT.participant_role
              AND LEFT.participant_policy_number=RIGHT.participant_policy_number AND LEFT.participant_carrier_name=RIGHT.participant_carrier_name AND LEFT.address_line=RIGHT.address_line AND LEFT.address_street_type=RIGHT.address_street_type AND LEFT.person_type=RIGHT.person_type AND LEFT.vault_date_first_seen=RIGHT.vault_date_first_seen AND LEFT.vault_date_last_seen=RIGHT.vault_date_last_seen,MergeData(LEFT,RIGHT),FULL OUTER,HASH);
  WithRT MergeData1(WithRT le, WithRT ri) := TRANSFORM // old, updated, new
    SELF.vault_date_first_seen := MAP (le.__Tpe = 0 => ri.vault_date_first_seen,ri.__Tpe = 0 => le.vault_date_first_seen,le.vault_date_first_seen<ri.vault_date_first_seen => le.vault_date_first_seen,ri.vault_date_first_seen);
    SELF.__Tpe := MAP (le.__Tpe = 0 => ri.__Tpe,ri.__Tpe = 0 => le.__Tpe,RecordType.Updated);
    SELF := IF( le.__Tpe=0,ri,le);
  END;
 
  // Ingest1: Merge Open Old with Open New to get old, updated, new
  Ingest1 := JOIN( Ingest0(__Tpe=RecordType.Old),Ingest0(__Tpe=RecordType.New),LEFT.vault_uid_hash=RIGHT.vault_uid_hash AND LEFT.transaction_id=RIGHT.transaction_id AND LEFT.sequence=RIGHT.sequence AND LEFT.first_name=RIGHT.first_name AND LEFT.middle_name=RIGHT.middle_name AND LEFT.last_name=RIGHT.last_name AND LEFT.suffix_name=RIGHT.suffix_name
              AND LEFT.ssn=RIGHT.ssn AND LEFT.current_dl_state=RIGHT.current_dl_state AND LEFT.current_dl_number=RIGHT.current_dl_number AND LEFT.prior_dl_state=RIGHT.prior_dl_state AND LEFT.prior_dl_number=RIGHT.prior_dl_number AND LEFT.prior_policy_number=RIGHT.prior_policy_number AND LEFT.date_added=RIGHT.date_added AND LEFT.product_id=RIGHT.product_id AND LEFT.telephone_area_code=RIGHT.telephone_area_code AND LEFT.telephone_exchange=RIGHT.telephone_exchange
              AND LEFT.telephone_number=RIGHT.telephone_number AND LEFT.reference_no=RIGHT.reference_no AND LEFT.unit_no=RIGHT.unit_no AND LEFT.customer_no=RIGHT.customer_no AND LEFT.quoteback=RIGHT.quoteback AND LEFT.order_date=RIGHT.order_date AND LEFT.current_house_no=RIGHT.current_house_no AND LEFT.current_street_name=RIGHT.current_street_name AND LEFT.current_apt_no=RIGHT.current_apt_no AND LEFT.current_city=RIGHT.current_city
              AND LEFT.current_state=RIGHT.current_state AND LEFT.current_zip=RIGHT.current_zip AND LEFT.current_zip_ext=RIGHT.current_zip_ext AND LEFT.former_house_no=RIGHT.former_house_no AND LEFT.former_street_name=RIGHT.former_street_name AND LEFT.former_apt_no=RIGHT.former_apt_no AND LEFT.former_city=RIGHT.former_city AND LEFT.former_state=RIGHT.former_state AND LEFT.former_zip=RIGHT.former_zip AND LEFT.former_zip_ext=RIGHT.former_zip_ext
              AND LEFT.dob=RIGHT.dob AND LEFT.sex=RIGHT.sex AND LEFT.service_type=RIGHT.service_type AND LEFT.spl_bill_id=RIGHT.spl_bill_id AND LEFT.subject_process_stat_code=RIGHT.subject_process_stat_code AND LEFT.mortgage_no=RIGHT.mortgage_no AND LEFT.lex_id=RIGHT.lex_id AND LEFT.participant_number=RIGHT.participant_number AND LEFT.participant_type=RIGHT.participant_type AND LEFT.participant_role=RIGHT.participant_role
              AND LEFT.participant_policy_number=RIGHT.participant_policy_number AND LEFT.participant_carrier_name=RIGHT.participant_carrier_name AND LEFT.address_line=RIGHT.address_line AND LEFT.address_street_type=RIGHT.address_street_type AND LEFT.person_type=RIGHT.person_type AND LEFT.vault_date_last_seen=0 AND RIGHT.vault_date_last_seen=0,MergeData1(LEFT,RIGHT),FULL OUTER,HASH);
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
  SHARED AllRecs := ORe+NR1+NR(vault_rid<>0) : PERSIST('~temp::I_mbsi_transaction_log_person::Ingest_Cache',EXPIRE(I_mbsi_transaction_log_person.Config.PersistExpire));
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
