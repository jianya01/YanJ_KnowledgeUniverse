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
  Ingest0 := JOIN( Base0,FilesToIngest0,LEFT.vault_uid_hash=RIGHT.vault_uid_hash AND LEFT.process_date=RIGHT.process_date AND LEFT.file_date=RIGHT.file_date AND LEFT.offender_key=RIGHT.offender_key AND LEFT.vendor=RIGHT.vendor AND LEFT.source_file=RIGHT.source_file AND LEFT.record_type=RIGHT.record_type
              AND LEFT.orig_state=RIGHT.orig_state AND LEFT.id_num=RIGHT.id_num AND LEFT.pty_nm=RIGHT.pty_nm AND LEFT.pty_nm_fmt=RIGHT.pty_nm_fmt AND LEFT.orig_lname=RIGHT.orig_lname AND LEFT.orig_fname=RIGHT.orig_fname AND LEFT.orig_mname=RIGHT.orig_mname AND LEFT.orig_name_suffix=RIGHT.orig_name_suffix AND LEFT.lname=RIGHT.lname AND LEFT.fname=RIGHT.fname
              AND LEFT.mname=RIGHT.mname AND LEFT.name_suffix=RIGHT.name_suffix AND LEFT.pty_typ=RIGHT.pty_typ AND LEFT.nid=RIGHT.nid AND LEFT.ntype=RIGHT.ntype AND LEFT.nindicator=RIGHT.nindicator AND LEFT.nitro_flag=RIGHT.nitro_flag AND LEFT.ssn=RIGHT.ssn AND LEFT.case_num=RIGHT.case_num AND LEFT.case_court=RIGHT.case_court
              AND LEFT.case_date=RIGHT.case_date AND LEFT.case_type=RIGHT.case_type AND LEFT.case_type_desc=RIGHT.case_type_desc AND LEFT.county_of_origin=RIGHT.county_of_origin AND LEFT.dle_num=RIGHT.dle_num AND LEFT.fbi_num=RIGHT.fbi_num AND LEFT.doc_num=RIGHT.doc_num AND LEFT.ins_num=RIGHT.ins_num AND LEFT.dl_num=RIGHT.dl_num AND LEFT.dl_state=RIGHT.dl_state
              AND LEFT.citizenship=RIGHT.citizenship AND LEFT.dob=RIGHT.dob AND LEFT.dob_alias=RIGHT.dob_alias AND LEFT.county_of_birth=RIGHT.county_of_birth AND LEFT.place_of_birth=RIGHT.place_of_birth AND LEFT.street_address_1=RIGHT.street_address_1 AND LEFT.street_address_2=RIGHT.street_address_2 AND LEFT.street_address_3=RIGHT.street_address_3 AND LEFT.street_address_4=RIGHT.street_address_4 AND LEFT.street_address_5=RIGHT.street_address_5
              AND LEFT.current_residence_county=RIGHT.current_residence_county AND LEFT.legal_residence_county=RIGHT.legal_residence_county AND LEFT.race=RIGHT.race AND LEFT.race_desc=RIGHT.race_desc AND LEFT.sex=RIGHT.sex AND LEFT.hair_color=RIGHT.hair_color AND LEFT.hair_color_desc=RIGHT.hair_color_desc AND LEFT.eye_color=RIGHT.eye_color AND LEFT.eye_color_desc=RIGHT.eye_color_desc AND LEFT.skin_color=RIGHT.skin_color
              AND LEFT.skin_color_desc=RIGHT.skin_color_desc AND LEFT.scars_marks_tattoos_1=RIGHT.scars_marks_tattoos_1 AND LEFT.scars_marks_tattoos_2=RIGHT.scars_marks_tattoos_2 AND LEFT.scars_marks_tattoos_3=RIGHT.scars_marks_tattoos_3 AND LEFT.scars_marks_tattoos_4=RIGHT.scars_marks_tattoos_4 AND LEFT.scars_marks_tattoos_5=RIGHT.scars_marks_tattoos_5 AND LEFT.height=RIGHT.height AND LEFT.weight=RIGHT.weight AND LEFT.party_status=RIGHT.party_status AND LEFT.party_status_desc=RIGHT.party_status_desc
              AND LEFT._3g_offender=RIGHT._3g_offender AND LEFT.violent_offender=RIGHT.violent_offender AND LEFT.sex_offender=RIGHT.sex_offender AND LEFT.vop_offender=RIGHT.vop_offender AND LEFT.data_type=RIGHT.data_type AND LEFT.record_setup_date=RIGHT.record_setup_date AND LEFT.datasource=RIGHT.datasource AND LEFT.prim_range=RIGHT.prim_range AND LEFT.predir=RIGHT.predir AND LEFT.prim_name=RIGHT.prim_name
              AND LEFT.addr_suffix=RIGHT.addr_suffix AND LEFT.postdir=RIGHT.postdir AND LEFT.unit_desig=RIGHT.unit_desig AND LEFT.sec_range=RIGHT.sec_range AND LEFT.p_city_name=RIGHT.p_city_name AND LEFT.v_city_name=RIGHT.v_city_name AND LEFT.st=RIGHT.st AND LEFT.zip5=RIGHT.zip5 AND LEFT.zip4=RIGHT.zip4 AND LEFT.cart=RIGHT.cart
              AND LEFT.cr_sort_sz=RIGHT.cr_sort_sz AND LEFT.lot=RIGHT.lot AND LEFT.lot_order=RIGHT.lot_order AND LEFT.dpbc=RIGHT.dpbc AND LEFT.chk_digit=RIGHT.chk_digit AND LEFT.rec_type=RIGHT.rec_type AND LEFT.ace_fips_st=RIGHT.ace_fips_st AND LEFT.ace_fips_county=RIGHT.ace_fips_county AND LEFT.geo_lat=RIGHT.geo_lat AND LEFT.geo_long=RIGHT.geo_long
              AND LEFT.msa=RIGHT.msa AND LEFT.geo_blk=RIGHT.geo_blk AND LEFT.geo_match=RIGHT.geo_match AND LEFT.err_stat=RIGHT.err_stat AND LEFT.clean_errors=RIGHT.clean_errors AND LEFT.county_name=RIGHT.county_name AND LEFT.did=RIGHT.did AND LEFT.score=RIGHT.score AND LEFT.ssn_appended=RIGHT.ssn_appended AND LEFT.curr_incar_flag=RIGHT.curr_incar_flag
              AND LEFT.curr_parole_flag=RIGHT.curr_parole_flag AND LEFT.curr_probation_flag=RIGHT.curr_probation_flag AND LEFT.src_upload_date=RIGHT.src_upload_date AND LEFT.age=RIGHT.age AND LEFT.image_link=RIGHT.image_link AND LEFT.fcra_conviction_flag=RIGHT.fcra_conviction_flag AND LEFT.fcra_traffic_flag=RIGHT.fcra_traffic_flag AND LEFT.fcra_date=RIGHT.fcra_date AND LEFT.fcra_date_type=RIGHT.fcra_date_type AND LEFT.conviction_override_date=RIGHT.conviction_override_date
              AND LEFT.conviction_override_date_type=RIGHT.conviction_override_date_type AND LEFT.offense_score=RIGHT.offense_score AND LEFT.offender_persistent_id=RIGHT.offender_persistent_id AND LEFT.vault_date_first_seen=RIGHT.vault_date_first_seen AND LEFT.vault_date_last_seen=RIGHT.vault_date_last_seen,MergeData(LEFT,RIGHT),FULL OUTER,HASH);
  WithRT MergeData1(WithRT le, WithRT ri) := TRANSFORM // old, updated, new
    SELF.vault_date_first_seen := MAP (le.__Tpe = 0 => ri.vault_date_first_seen,ri.__Tpe = 0 => le.vault_date_first_seen,le.vault_date_first_seen<ri.vault_date_first_seen => le.vault_date_first_seen,ri.vault_date_first_seen);
    SELF.__Tpe := MAP (le.__Tpe = 0 => ri.__Tpe,ri.__Tpe = 0 => le.__Tpe,RecordType.Updated);
    SELF := IF( le.__Tpe=0,ri,le);
  END;
 
  // Ingest1: Merge Open Old with Open New to get old, updated, new
  Ingest1 := JOIN( Ingest0(__Tpe=RecordType.Old),Ingest0(__Tpe=RecordType.New),LEFT.vault_uid_hash=RIGHT.vault_uid_hash AND LEFT.process_date=RIGHT.process_date AND LEFT.file_date=RIGHT.file_date AND LEFT.offender_key=RIGHT.offender_key AND LEFT.vendor=RIGHT.vendor AND LEFT.source_file=RIGHT.source_file AND LEFT.record_type=RIGHT.record_type
              AND LEFT.orig_state=RIGHT.orig_state AND LEFT.id_num=RIGHT.id_num AND LEFT.pty_nm=RIGHT.pty_nm AND LEFT.pty_nm_fmt=RIGHT.pty_nm_fmt AND LEFT.orig_lname=RIGHT.orig_lname AND LEFT.orig_fname=RIGHT.orig_fname AND LEFT.orig_mname=RIGHT.orig_mname AND LEFT.orig_name_suffix=RIGHT.orig_name_suffix AND LEFT.lname=RIGHT.lname AND LEFT.fname=RIGHT.fname
              AND LEFT.mname=RIGHT.mname AND LEFT.name_suffix=RIGHT.name_suffix AND LEFT.pty_typ=RIGHT.pty_typ AND LEFT.nid=RIGHT.nid AND LEFT.ntype=RIGHT.ntype AND LEFT.nindicator=RIGHT.nindicator AND LEFT.nitro_flag=RIGHT.nitro_flag AND LEFT.ssn=RIGHT.ssn AND LEFT.case_num=RIGHT.case_num AND LEFT.case_court=RIGHT.case_court
              AND LEFT.case_date=RIGHT.case_date AND LEFT.case_type=RIGHT.case_type AND LEFT.case_type_desc=RIGHT.case_type_desc AND LEFT.county_of_origin=RIGHT.county_of_origin AND LEFT.dle_num=RIGHT.dle_num AND LEFT.fbi_num=RIGHT.fbi_num AND LEFT.doc_num=RIGHT.doc_num AND LEFT.ins_num=RIGHT.ins_num AND LEFT.dl_num=RIGHT.dl_num AND LEFT.dl_state=RIGHT.dl_state
              AND LEFT.citizenship=RIGHT.citizenship AND LEFT.dob=RIGHT.dob AND LEFT.dob_alias=RIGHT.dob_alias AND LEFT.county_of_birth=RIGHT.county_of_birth AND LEFT.place_of_birth=RIGHT.place_of_birth AND LEFT.street_address_1=RIGHT.street_address_1 AND LEFT.street_address_2=RIGHT.street_address_2 AND LEFT.street_address_3=RIGHT.street_address_3 AND LEFT.street_address_4=RIGHT.street_address_4 AND LEFT.street_address_5=RIGHT.street_address_5
              AND LEFT.current_residence_county=RIGHT.current_residence_county AND LEFT.legal_residence_county=RIGHT.legal_residence_county AND LEFT.race=RIGHT.race AND LEFT.race_desc=RIGHT.race_desc AND LEFT.sex=RIGHT.sex AND LEFT.hair_color=RIGHT.hair_color AND LEFT.hair_color_desc=RIGHT.hair_color_desc AND LEFT.eye_color=RIGHT.eye_color AND LEFT.eye_color_desc=RIGHT.eye_color_desc AND LEFT.skin_color=RIGHT.skin_color
              AND LEFT.skin_color_desc=RIGHT.skin_color_desc AND LEFT.scars_marks_tattoos_1=RIGHT.scars_marks_tattoos_1 AND LEFT.scars_marks_tattoos_2=RIGHT.scars_marks_tattoos_2 AND LEFT.scars_marks_tattoos_3=RIGHT.scars_marks_tattoos_3 AND LEFT.scars_marks_tattoos_4=RIGHT.scars_marks_tattoos_4 AND LEFT.scars_marks_tattoos_5=RIGHT.scars_marks_tattoos_5 AND LEFT.height=RIGHT.height AND LEFT.weight=RIGHT.weight AND LEFT.party_status=RIGHT.party_status AND LEFT.party_status_desc=RIGHT.party_status_desc
              AND LEFT._3g_offender=RIGHT._3g_offender AND LEFT.violent_offender=RIGHT.violent_offender AND LEFT.sex_offender=RIGHT.sex_offender AND LEFT.vop_offender=RIGHT.vop_offender AND LEFT.data_type=RIGHT.data_type AND LEFT.record_setup_date=RIGHT.record_setup_date AND LEFT.datasource=RIGHT.datasource AND LEFT.prim_range=RIGHT.prim_range AND LEFT.predir=RIGHT.predir AND LEFT.prim_name=RIGHT.prim_name
              AND LEFT.addr_suffix=RIGHT.addr_suffix AND LEFT.postdir=RIGHT.postdir AND LEFT.unit_desig=RIGHT.unit_desig AND LEFT.sec_range=RIGHT.sec_range AND LEFT.p_city_name=RIGHT.p_city_name AND LEFT.v_city_name=RIGHT.v_city_name AND LEFT.st=RIGHT.st AND LEFT.zip5=RIGHT.zip5 AND LEFT.zip4=RIGHT.zip4 AND LEFT.cart=RIGHT.cart
              AND LEFT.cr_sort_sz=RIGHT.cr_sort_sz AND LEFT.lot=RIGHT.lot AND LEFT.lot_order=RIGHT.lot_order AND LEFT.dpbc=RIGHT.dpbc AND LEFT.chk_digit=RIGHT.chk_digit AND LEFT.rec_type=RIGHT.rec_type AND LEFT.ace_fips_st=RIGHT.ace_fips_st AND LEFT.ace_fips_county=RIGHT.ace_fips_county AND LEFT.geo_lat=RIGHT.geo_lat AND LEFT.geo_long=RIGHT.geo_long
              AND LEFT.msa=RIGHT.msa AND LEFT.geo_blk=RIGHT.geo_blk AND LEFT.geo_match=RIGHT.geo_match AND LEFT.err_stat=RIGHT.err_stat AND LEFT.clean_errors=RIGHT.clean_errors AND LEFT.county_name=RIGHT.county_name AND LEFT.did=RIGHT.did AND LEFT.score=RIGHT.score AND LEFT.ssn_appended=RIGHT.ssn_appended AND LEFT.curr_incar_flag=RIGHT.curr_incar_flag
              AND LEFT.curr_parole_flag=RIGHT.curr_parole_flag AND LEFT.curr_probation_flag=RIGHT.curr_probation_flag AND LEFT.src_upload_date=RIGHT.src_upload_date AND LEFT.age=RIGHT.age AND LEFT.image_link=RIGHT.image_link AND LEFT.fcra_conviction_flag=RIGHT.fcra_conviction_flag AND LEFT.fcra_traffic_flag=RIGHT.fcra_traffic_flag AND LEFT.fcra_date=RIGHT.fcra_date AND LEFT.fcra_date_type=RIGHT.fcra_date_type AND LEFT.conviction_override_date=RIGHT.conviction_override_date
              AND LEFT.conviction_override_date_type=RIGHT.conviction_override_date_type AND LEFT.offense_score=RIGHT.offense_score AND LEFT.offender_persistent_id=RIGHT.offender_persistent_id AND LEFT.vault_date_last_seen=0 AND RIGHT.vault_date_last_seen=0,MergeData1(LEFT,RIGHT),FULL OUTER,HASH);
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
  SHARED AllRecs := ORe+NR1+NR(vault_rid<>0) : PERSIST('~temp::I_Criminal_Offender::Ingest_Cache',EXPIRE(I_Criminal_Offender.Config.PersistExpire));
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
