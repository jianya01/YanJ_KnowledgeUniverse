IMPORT STD,SALT311;
EXPORT Ingest(BOOLEAN CloseOlds = FALSE, STRING EndDate='',DATASET(Layout_Vault) dsBase = In_Vault // Change IN_Vault to change input to ingest process
, DATASET(RECORDOF(SRC))  infile = SRC
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
  Ingest0 := JOIN( Base0,FilesToIngest0,LEFT.vault_uid_hash=RIGHT.vault_uid_hash AND LEFT.did=RIGHT.did AND LEFT.school_act_code=RIGHT.school_act_code AND LEFT.tuition_code=RIGHT.tuition_code AND LEFT.public_private_code=RIGHT.public_private_code AND LEFT.school_size_code=RIGHT.school_size_code AND LEFT.student_last_name=RIGHT.student_last_name
              AND LEFT.student_first_name=RIGHT.student_first_name AND LEFT.gender_code=RIGHT.gender_code AND LEFT.competitive_code=RIGHT.competitive_code AND LEFT.intl_exchange_student_code=RIGHT.intl_exchange_student_code AND LEFT.address_sequence_code=RIGHT.address_sequence_code AND LEFT.school_name=RIGHT.school_name AND LEFT.school_address_2_secondary=RIGHT.school_address_2_secondary AND LEFT.filler_1=RIGHT.filler_1 AND LEFT.school_address_1_primary=RIGHT.school_address_1_primary AND LEFT.filler_2=RIGHT.filler_2
              AND LEFT.school_city=RIGHT.school_city AND LEFT.school_state=RIGHT.school_state AND LEFT.school_zip5=RIGHT.school_zip5 AND LEFT.school_zip4=RIGHT.school_zip4 AND LEFT.school_phone_number=RIGHT.school_phone_number AND LEFT.school_housing_code=RIGHT.school_housing_code AND LEFT.filler_3=RIGHT.filler_3 AND LEFT.home_address_1_secondary=RIGHT.home_address_1_secondary AND LEFT.filler_4=RIGHT.filler_4 AND LEFT.home_address_2_primary=RIGHT.home_address_2_primary
              AND LEFT.filler_5=RIGHT.filler_5 AND LEFT.home_city=RIGHT.home_city AND LEFT.home_state=RIGHT.home_state AND LEFT.home_zip5=RIGHT.home_zip5 AND LEFT.home_zip4=RIGHT.home_zip4 AND LEFT.home_phone_number=RIGHT.home_phone_number AND LEFT.home_housing_code=RIGHT.home_housing_code AND LEFT.class_rank=RIGHT.class_rank AND LEFT.major_code=RIGHT.major_code AND LEFT.school_info_time_zone=RIGHT.school_info_time_zone
              AND LEFT.filler_6=RIGHT.filler_6 AND LEFT.filler_7=RIGHT.filler_7 AND LEFT.home_info_time_zone=RIGHT.home_info_time_zone AND LEFT.filler_8=RIGHT.filler_8 AND LEFT.filler_9=RIGHT.filler_9 AND LEFT.address_type=RIGHT.address_type AND LEFT.address_info_code=RIGHT.address_info_code AND LEFT.sequence_number=RIGHT.sequence_number AND LEFT.filler_10=RIGHT.filler_10 AND LEFT.filler_11=RIGHT.filler_11
              AND LEFT.key_code=RIGHT.key_code AND LEFT.carriage_return=RIGHT.carriage_return AND LEFT.line_feed=RIGHT.line_feed AND LEFT.file_type=RIGHT.file_type AND LEFT.ln_college_name=RIGHT.ln_college_name AND LEFT.tier=RIGHT.tier AND LEFT.did_score=RIGHT.did_score AND LEFT.clean_title=RIGHT.clean_title AND LEFT.clean_fname=RIGHT.clean_fname AND LEFT.clean_mname=RIGHT.clean_mname
              AND LEFT.clean_lname=RIGHT.clean_lname AND LEFT.clean_name_suffix=RIGHT.clean_name_suffix AND LEFT.clean_name_score=RIGHT.clean_name_score AND LEFT.clean_addr_code=RIGHT.clean_addr_code AND LEFT.rawaid=RIGHT.rawaid AND LEFT.append_prep_address=RIGHT.append_prep_address AND LEFT.append_prep_address_last=RIGHT.append_prep_address_last AND LEFT.clean_phone_number=RIGHT.clean_phone_number AND LEFT.clean_prim_range=RIGHT.clean_prim_range AND LEFT.clean_predir=RIGHT.clean_predir
              AND LEFT.clean_prim_name=RIGHT.clean_prim_name AND LEFT.clean_addr_suffix=RIGHT.clean_addr_suffix AND LEFT.clean_postdir=RIGHT.clean_postdir AND LEFT.clean_unit_desig=RIGHT.clean_unit_desig AND LEFT.clean_sec_range=RIGHT.clean_sec_range AND LEFT.clean_p_city_name=RIGHT.clean_p_city_name AND LEFT.clean_v_city_name=RIGHT.clean_v_city_name AND LEFT.clean_st=RIGHT.clean_st AND LEFT.clean_zip5=RIGHT.clean_zip5 AND LEFT.clean_zip4=RIGHT.clean_zip4
              AND LEFT.clean_cart=RIGHT.clean_cart AND LEFT.clean_cr_sort_sz=RIGHT.clean_cr_sort_sz AND LEFT.clean_lot=RIGHT.clean_lot AND LEFT.clean_lot_order=RIGHT.clean_lot_order AND LEFT.clean_dbpc=RIGHT.clean_dbpc AND LEFT.clean_chk_digit=RIGHT.clean_chk_digit AND LEFT.clean_rec_type=RIGHT.clean_rec_type AND LEFT.clean_county=RIGHT.clean_county AND LEFT.clean_ace_fips_st=RIGHT.clean_ace_fips_st AND LEFT.clean_fips_county=RIGHT.clean_fips_county
              AND LEFT.clean_geo_lat=RIGHT.clean_geo_lat AND LEFT.clean_geo_long=RIGHT.clean_geo_long AND LEFT.clean_msa=RIGHT.clean_msa AND LEFT.clean_geo_blk=RIGHT.clean_geo_blk AND LEFT.clean_geo_match=RIGHT.clean_geo_match AND LEFT.clean_err_stat=RIGHT.clean_err_stat AND LEFT.process_date=RIGHT.process_date AND LEFT.date_first_seen=RIGHT.date_first_seen AND LEFT.date_last_seen=RIGHT.date_last_seen AND LEFT.date_vendor_first_reported=RIGHT.date_vendor_first_reported
              AND LEFT.date_vendor_last_reported=RIGHT.date_vendor_last_reported AND LEFT.tier2=RIGHT.tier2 AND LEFT.source=RIGHT.source AND LEFT.__internal_fpos__=RIGHT.__internal_fpos__ AND LEFT.vault_date_first_seen=RIGHT.vault_date_first_seen AND LEFT.vault_date_last_seen=RIGHT.vault_date_last_seen,MergeData(LEFT,RIGHT),FULL OUTER,HASH);
  WithRT MergeData1(WithRT le, WithRT ri) := TRANSFORM // old, updated, new
    SELF.vault_date_first_seen := MAP (le.__Tpe = 0 => ri.vault_date_first_seen,ri.__Tpe = 0 => le.vault_date_first_seen,le.vault_date_first_seen<ri.vault_date_first_seen => le.vault_date_first_seen,ri.vault_date_first_seen);
    SELF.__Tpe := MAP (le.__Tpe = 0 => ri.__Tpe,ri.__Tpe = 0 => le.__Tpe,RecordType.Updated);
    SELF := IF( le.__Tpe=0,ri,le);
  END;
 
  // Ingest1: Merge Open Old with Open New to get old, updated, new
  Ingest1 := JOIN( Ingest0(__Tpe=RecordType.Old),Ingest0(__Tpe=RecordType.New),LEFT.vault_uid_hash=RIGHT.vault_uid_hash AND LEFT.did=RIGHT.did AND LEFT.school_act_code=RIGHT.school_act_code AND LEFT.tuition_code=RIGHT.tuition_code AND LEFT.public_private_code=RIGHT.public_private_code AND LEFT.school_size_code=RIGHT.school_size_code AND LEFT.student_last_name=RIGHT.student_last_name
              AND LEFT.student_first_name=RIGHT.student_first_name AND LEFT.gender_code=RIGHT.gender_code AND LEFT.competitive_code=RIGHT.competitive_code AND LEFT.intl_exchange_student_code=RIGHT.intl_exchange_student_code AND LEFT.address_sequence_code=RIGHT.address_sequence_code AND LEFT.school_name=RIGHT.school_name AND LEFT.school_address_2_secondary=RIGHT.school_address_2_secondary AND LEFT.filler_1=RIGHT.filler_1 AND LEFT.school_address_1_primary=RIGHT.school_address_1_primary AND LEFT.filler_2=RIGHT.filler_2
              AND LEFT.school_city=RIGHT.school_city AND LEFT.school_state=RIGHT.school_state AND LEFT.school_zip5=RIGHT.school_zip5 AND LEFT.school_zip4=RIGHT.school_zip4 AND LEFT.school_phone_number=RIGHT.school_phone_number AND LEFT.school_housing_code=RIGHT.school_housing_code AND LEFT.filler_3=RIGHT.filler_3 AND LEFT.home_address_1_secondary=RIGHT.home_address_1_secondary AND LEFT.filler_4=RIGHT.filler_4 AND LEFT.home_address_2_primary=RIGHT.home_address_2_primary
              AND LEFT.filler_5=RIGHT.filler_5 AND LEFT.home_city=RIGHT.home_city AND LEFT.home_state=RIGHT.home_state AND LEFT.home_zip5=RIGHT.home_zip5 AND LEFT.home_zip4=RIGHT.home_zip4 AND LEFT.home_phone_number=RIGHT.home_phone_number AND LEFT.home_housing_code=RIGHT.home_housing_code AND LEFT.class_rank=RIGHT.class_rank AND LEFT.major_code=RIGHT.major_code AND LEFT.school_info_time_zone=RIGHT.school_info_time_zone
              AND LEFT.filler_6=RIGHT.filler_6 AND LEFT.filler_7=RIGHT.filler_7 AND LEFT.home_info_time_zone=RIGHT.home_info_time_zone AND LEFT.filler_8=RIGHT.filler_8 AND LEFT.filler_9=RIGHT.filler_9 AND LEFT.address_type=RIGHT.address_type AND LEFT.address_info_code=RIGHT.address_info_code AND LEFT.sequence_number=RIGHT.sequence_number AND LEFT.filler_10=RIGHT.filler_10 AND LEFT.filler_11=RIGHT.filler_11
              AND LEFT.key_code=RIGHT.key_code AND LEFT.carriage_return=RIGHT.carriage_return AND LEFT.line_feed=RIGHT.line_feed AND LEFT.file_type=RIGHT.file_type AND LEFT.ln_college_name=RIGHT.ln_college_name AND LEFT.tier=RIGHT.tier AND LEFT.did_score=RIGHT.did_score AND LEFT.clean_title=RIGHT.clean_title AND LEFT.clean_fname=RIGHT.clean_fname AND LEFT.clean_mname=RIGHT.clean_mname
              AND LEFT.clean_lname=RIGHT.clean_lname AND LEFT.clean_name_suffix=RIGHT.clean_name_suffix AND LEFT.clean_name_score=RIGHT.clean_name_score AND LEFT.clean_addr_code=RIGHT.clean_addr_code AND LEFT.rawaid=RIGHT.rawaid AND LEFT.append_prep_address=RIGHT.append_prep_address AND LEFT.append_prep_address_last=RIGHT.append_prep_address_last AND LEFT.clean_phone_number=RIGHT.clean_phone_number AND LEFT.clean_prim_range=RIGHT.clean_prim_range AND LEFT.clean_predir=RIGHT.clean_predir
              AND LEFT.clean_prim_name=RIGHT.clean_prim_name AND LEFT.clean_addr_suffix=RIGHT.clean_addr_suffix AND LEFT.clean_postdir=RIGHT.clean_postdir AND LEFT.clean_unit_desig=RIGHT.clean_unit_desig AND LEFT.clean_sec_range=RIGHT.clean_sec_range AND LEFT.clean_p_city_name=RIGHT.clean_p_city_name AND LEFT.clean_v_city_name=RIGHT.clean_v_city_name AND LEFT.clean_st=RIGHT.clean_st AND LEFT.clean_zip5=RIGHT.clean_zip5 AND LEFT.clean_zip4=RIGHT.clean_zip4
              AND LEFT.clean_cart=RIGHT.clean_cart AND LEFT.clean_cr_sort_sz=RIGHT.clean_cr_sort_sz AND LEFT.clean_lot=RIGHT.clean_lot AND LEFT.clean_lot_order=RIGHT.clean_lot_order AND LEFT.clean_dbpc=RIGHT.clean_dbpc AND LEFT.clean_chk_digit=RIGHT.clean_chk_digit AND LEFT.clean_rec_type=RIGHT.clean_rec_type AND LEFT.clean_county=RIGHT.clean_county AND LEFT.clean_ace_fips_st=RIGHT.clean_ace_fips_st AND LEFT.clean_fips_county=RIGHT.clean_fips_county
              AND LEFT.clean_geo_lat=RIGHT.clean_geo_lat AND LEFT.clean_geo_long=RIGHT.clean_geo_long AND LEFT.clean_msa=RIGHT.clean_msa AND LEFT.clean_geo_blk=RIGHT.clean_geo_blk AND LEFT.clean_geo_match=RIGHT.clean_geo_match AND LEFT.clean_err_stat=RIGHT.clean_err_stat AND LEFT.process_date=RIGHT.process_date AND LEFT.date_first_seen=RIGHT.date_first_seen AND LEFT.date_last_seen=RIGHT.date_last_seen AND LEFT.date_vendor_first_reported=RIGHT.date_vendor_first_reported
              AND LEFT.date_vendor_last_reported=RIGHT.date_vendor_last_reported AND LEFT.tier2=RIGHT.tier2 AND LEFT.source=RIGHT.source AND LEFT.__internal_fpos__=RIGHT.__internal_fpos__ AND LEFT.vault_date_last_seen=0 AND RIGHT.vault_date_last_seen=0,MergeData1(LEFT,RIGHT),FULL OUTER,HASH);
  WithRT CloseRecords(WithRT le, WithRT ri) := TRANSFORM
    SELF.vault_date_last_seen := IF(ri.__Tpe=0,le.vault_date_last_seen,(TYPEOF(ri.vault_date_first_seen))SALT311.Fn_DecrementDate(ri.vault_date_first_seen,'YYYYMMDD'));
    SELF.__Tpe := IF(ri.__Tpe=0,le.__Tpe,RecordType.Updated);
    SELF := le;
  END;
  // Ingest2: Close Open Old to get old, updated
  Ingest2 := JOIN( Ingest1(__Tpe=RecordType.Old),Ingest1(__Tpe=RecordType.New), LEFT.vault_uid_hash=RIGHT.vault_uid_hash AND LEFT.vault_date_last_seen=0,CloseRecords(LEFT,RIGHT),LEFT OUTER,HASH);
  TimeStamp0 := SALT311.Fn_DecrementDate((UNSIGNED6)SALT311.Fn_Now('YYYYMMDD'),'YYYYMMDD') : INDEPENDENT;
  TimeStamp := IF(EndDate<>'',EndDate,TimeStamp0);
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
  //Base upon SALT311.utMac_Sequence_Records
  // Do not use PROJECT,COUNTER because it is very slow if any of the fields are not fixed length
  NR := AllRecs0(__Tpe=RecordType.New);
  ORe := AllRecs0(__Tpe<>RecordType.New);
  PrevBase := MAX(ORe,vault_rid);
  WithRT AddNewRid(WithRT le, WithRT ri) := TRANSFORM
    SELF.vault_rid := IF ( le.vault_rid=0, PrevBase+1+thorlib.node(), le.vault_rid+thorlib.nodes() );
    SELF := ri;
  END;
  NR1 := ITERATE(NR(vault_rid=0),AddNewRid(LEFT,RIGHT),LOCAL);
  SHARED AllRecs := ORe+NR1+NR(vault_rid<>0) : PERSIST('~temp::I_fcra_alloymedia_student_list_did::Ingest_Cache',EXPIRE(I_fcra_alloymedia_student_list_did.Config.PersistExpire));
  EXPORT UpdateStats := SORT(TABLE(AllRecs, {__Tpe,SALT311.StrType INGESTSTATUS:=RTToText(AllRecs.__Tpe),UNSIGNED Cnt:=COUNT(GROUP)}, __Tpe, FEW),__Tpe, FEW);
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
 
f := TABLE(dsBase,{vault_rid}) : GLOBAL;
rcid_clusters := SALT311.MOD_ClusterStats.Counts(f,vault_rid);
DuplicateRids0 := COUNT(dsBase) - SUM(rcid_clusters,NumberOfClusters); // Should be zero
d := DATASET([{DuplicateRids0}],{UNSIGNED2 DuplicateRids0});
EXPORT ValidityStats := OUTPUT(d,NAMED('ValidityStatistics'));
  EXPORT DoStats := S0;
 
  EXPORT StandardStats(BOOLEAN doInfileOverallCnt = TRUE, BOOLEAN doStatusOverallCnt = TRUE) := FUNCTION
    myTimeStamp := (UNSIGNED6)SALT311.Fn_Now('YYYYMMDDHHMMSS') : INDEPENDENT;
    infileCntOverall := IF(doInfileOverallCnt, SALT311.mod_StandardStatsTransforms.MAC_ingestInfileOverallCount(COUNT(FilesToIngest), 'Infile', myTimeStamp));
    basefileCntOverall := IF(doInfileOverallCnt, SALT311.mod_StandardStatsTransforms.MAC_ingestInfileOverallCount(COUNT(dsBase), 'Basefile', myTimeStamp));
    ingestStatusOverall := IF(doStatusOverallCnt, SALT311.mod_StandardStatsTransforms.MAC_ingestStatus(UpdateStats,, myTimeStamp));
    standardStats := infileCntOverall & basefileCntOverall & ingestStatusOverall;
    RETURN standardStats;
  END;
END;
