IMPORT STD,SALT311;
EXPORT Ingest(BOOLEAN CloseOlds = FALSE, STRING EndDate='',DATASET(Layout_Vault) dsBase = In_Vault // Change IN_Vault to change input to ingest process
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
  Ingest0 := JOIN( Base0,FilesToIngest0,LEFT.vault_uid_hash=RIGHT.vault_uid_hash AND LEFT.ok=RIGHT.ok AND LEFT.process_date=RIGHT.process_date AND LEFT.offender_key=RIGHT.offender_key AND LEFT.vendor=RIGHT.vendor AND LEFT.county_of_origin=RIGHT.county_of_origin AND LEFT.source_file=RIGHT.source_file
              AND LEFT.data_type=RIGHT.data_type AND LEFT.record_type=RIGHT.record_type AND LEFT.orig_state=RIGHT.orig_state AND LEFT.offense_key=RIGHT.offense_key AND LEFT.off_date=RIGHT.off_date AND LEFT.arr_date=RIGHT.arr_date AND LEFT.case_num=RIGHT.case_num AND LEFT.total_num_of_offenses=RIGHT.total_num_of_offenses AND LEFT.num_of_counts=RIGHT.num_of_counts AND LEFT.off_code=RIGHT.off_code
              AND LEFT.chg=RIGHT.chg AND LEFT.chg_typ_flg=RIGHT.chg_typ_flg AND LEFT.off_of_record=RIGHT.off_of_record AND LEFT.off_desc_1=RIGHT.off_desc_1 AND LEFT.off_desc_2=RIGHT.off_desc_2 AND LEFT.add_off_cd=RIGHT.add_off_cd AND LEFT.add_off_desc=RIGHT.add_off_desc AND LEFT.off_typ=RIGHT.off_typ AND LEFT.off_lev=RIGHT.off_lev AND LEFT.arr_disp_date=RIGHT.arr_disp_date
              AND LEFT.arr_disp_cd=RIGHT.arr_disp_cd AND LEFT.arr_disp_desc_1=RIGHT.arr_disp_desc_1 AND LEFT.arr_disp_desc_2=RIGHT.arr_disp_desc_2 AND LEFT.arr_disp_desc_3=RIGHT.arr_disp_desc_3 AND LEFT.court_cd=RIGHT.court_cd AND LEFT.court_desc=RIGHT.court_desc AND LEFT.ct_dist=RIGHT.ct_dist AND LEFT.ct_fnl_plea_cd=RIGHT.ct_fnl_plea_cd AND LEFT.ct_fnl_plea=RIGHT.ct_fnl_plea AND LEFT.ct_off_code=RIGHT.ct_off_code
              AND LEFT.ct_chg=RIGHT.ct_chg AND LEFT.ct_chg_typ_flg=RIGHT.ct_chg_typ_flg AND LEFT.ct_off_desc_1=RIGHT.ct_off_desc_1 AND LEFT.ct_off_desc_2=RIGHT.ct_off_desc_2 AND LEFT.ct_addl_desc_cd=RIGHT.ct_addl_desc_cd AND LEFT.ct_off_lev=RIGHT.ct_off_lev AND LEFT.ct_disp_dt=RIGHT.ct_disp_dt AND LEFT.ct_disp_cd=RIGHT.ct_disp_cd AND LEFT.ct_disp_desc_1=RIGHT.ct_disp_desc_1 AND LEFT.ct_disp_desc_2=RIGHT.ct_disp_desc_2
              AND LEFT.cty_conv_cd=RIGHT.cty_conv_cd AND LEFT.cty_conv=RIGHT.cty_conv AND LEFT.adj_wthd=RIGHT.adj_wthd AND LEFT.stc_dt=RIGHT.stc_dt AND LEFT.stc_cd=RIGHT.stc_cd AND LEFT.stc_comp=RIGHT.stc_comp AND LEFT.stc_desc_1=RIGHT.stc_desc_1 AND LEFT.stc_desc_2=RIGHT.stc_desc_2 AND LEFT.stc_desc_3=RIGHT.stc_desc_3 AND LEFT.stc_desc_4=RIGHT.stc_desc_4
              AND LEFT.stc_lgth=RIGHT.stc_lgth AND LEFT.stc_lgth_desc=RIGHT.stc_lgth_desc AND LEFT.inc_adm_dt=RIGHT.inc_adm_dt AND LEFT.min_term=RIGHT.min_term AND LEFT.min_term_desc=RIGHT.min_term_desc AND LEFT.max_term=RIGHT.max_term AND LEFT.max_term_desc=RIGHT.max_term_desc AND LEFT.parole=RIGHT.parole AND LEFT.probation=RIGHT.probation AND LEFT.offensetown=RIGHT.offensetown
              AND LEFT.convict_dt=RIGHT.convict_dt AND LEFT.court_county=RIGHT.court_county AND LEFT.fcra_offense_key=RIGHT.fcra_offense_key AND LEFT.fcra_conviction_flag=RIGHT.fcra_conviction_flag AND LEFT.fcra_traffic_flag=RIGHT.fcra_traffic_flag AND LEFT.fcra_date=RIGHT.fcra_date AND LEFT.fcra_date_type=RIGHT.fcra_date_type AND LEFT.conviction_override_date=RIGHT.conviction_override_date AND LEFT.conviction_override_date_type=RIGHT.conviction_override_date_type AND LEFT.offense_score=RIGHT.offense_score
              AND LEFT.offense_persistent_id=RIGHT.offense_persistent_id AND LEFT.offense_category=RIGHT.offense_category AND LEFT.vault_date_first_seen=RIGHT.vault_date_first_seen AND LEFT.vault_date_last_seen=RIGHT.vault_date_last_seen,MergeData(LEFT,RIGHT),FULL OUTER,HASH);
  WithRT MergeData1(WithRT le, WithRT ri) := TRANSFORM // old, updated, new
    SELF.vault_date_first_seen := MAP (le.__Tpe = 0 => ri.vault_date_first_seen,ri.__Tpe = 0 => le.vault_date_first_seen,le.vault_date_first_seen<ri.vault_date_first_seen => le.vault_date_first_seen,ri.vault_date_first_seen);
    SELF.__Tpe := MAP (le.__Tpe = 0 => ri.__Tpe,ri.__Tpe = 0 => le.__Tpe,RecordType.Updated);
    SELF := IF( le.__Tpe=0,ri,le);
  END;
 
  // Ingest1: Merge Open Old with Open New to get old, updated, new
  Ingest1 := JOIN( Ingest0(__Tpe=RecordType.Old),Ingest0(__Tpe=RecordType.New),LEFT.vault_uid_hash=RIGHT.vault_uid_hash AND LEFT.ok=RIGHT.ok AND LEFT.process_date=RIGHT.process_date AND LEFT.offender_key=RIGHT.offender_key AND LEFT.vendor=RIGHT.vendor AND LEFT.county_of_origin=RIGHT.county_of_origin AND LEFT.source_file=RIGHT.source_file
              AND LEFT.data_type=RIGHT.data_type AND LEFT.record_type=RIGHT.record_type AND LEFT.orig_state=RIGHT.orig_state AND LEFT.offense_key=RIGHT.offense_key AND LEFT.off_date=RIGHT.off_date AND LEFT.arr_date=RIGHT.arr_date AND LEFT.case_num=RIGHT.case_num AND LEFT.total_num_of_offenses=RIGHT.total_num_of_offenses AND LEFT.num_of_counts=RIGHT.num_of_counts AND LEFT.off_code=RIGHT.off_code
              AND LEFT.chg=RIGHT.chg AND LEFT.chg_typ_flg=RIGHT.chg_typ_flg AND LEFT.off_of_record=RIGHT.off_of_record AND LEFT.off_desc_1=RIGHT.off_desc_1 AND LEFT.off_desc_2=RIGHT.off_desc_2 AND LEFT.add_off_cd=RIGHT.add_off_cd AND LEFT.add_off_desc=RIGHT.add_off_desc AND LEFT.off_typ=RIGHT.off_typ AND LEFT.off_lev=RIGHT.off_lev AND LEFT.arr_disp_date=RIGHT.arr_disp_date
              AND LEFT.arr_disp_cd=RIGHT.arr_disp_cd AND LEFT.arr_disp_desc_1=RIGHT.arr_disp_desc_1 AND LEFT.arr_disp_desc_2=RIGHT.arr_disp_desc_2 AND LEFT.arr_disp_desc_3=RIGHT.arr_disp_desc_3 AND LEFT.court_cd=RIGHT.court_cd AND LEFT.court_desc=RIGHT.court_desc AND LEFT.ct_dist=RIGHT.ct_dist AND LEFT.ct_fnl_plea_cd=RIGHT.ct_fnl_plea_cd AND LEFT.ct_fnl_plea=RIGHT.ct_fnl_plea AND LEFT.ct_off_code=RIGHT.ct_off_code
              AND LEFT.ct_chg=RIGHT.ct_chg AND LEFT.ct_chg_typ_flg=RIGHT.ct_chg_typ_flg AND LEFT.ct_off_desc_1=RIGHT.ct_off_desc_1 AND LEFT.ct_off_desc_2=RIGHT.ct_off_desc_2 AND LEFT.ct_addl_desc_cd=RIGHT.ct_addl_desc_cd AND LEFT.ct_off_lev=RIGHT.ct_off_lev AND LEFT.ct_disp_dt=RIGHT.ct_disp_dt AND LEFT.ct_disp_cd=RIGHT.ct_disp_cd AND LEFT.ct_disp_desc_1=RIGHT.ct_disp_desc_1 AND LEFT.ct_disp_desc_2=RIGHT.ct_disp_desc_2
              AND LEFT.cty_conv_cd=RIGHT.cty_conv_cd AND LEFT.cty_conv=RIGHT.cty_conv AND LEFT.adj_wthd=RIGHT.adj_wthd AND LEFT.stc_dt=RIGHT.stc_dt AND LEFT.stc_cd=RIGHT.stc_cd AND LEFT.stc_comp=RIGHT.stc_comp AND LEFT.stc_desc_1=RIGHT.stc_desc_1 AND LEFT.stc_desc_2=RIGHT.stc_desc_2 AND LEFT.stc_desc_3=RIGHT.stc_desc_3 AND LEFT.stc_desc_4=RIGHT.stc_desc_4
              AND LEFT.stc_lgth=RIGHT.stc_lgth AND LEFT.stc_lgth_desc=RIGHT.stc_lgth_desc AND LEFT.inc_adm_dt=RIGHT.inc_adm_dt AND LEFT.min_term=RIGHT.min_term AND LEFT.min_term_desc=RIGHT.min_term_desc AND LEFT.max_term=RIGHT.max_term AND LEFT.max_term_desc=RIGHT.max_term_desc AND LEFT.parole=RIGHT.parole AND LEFT.probation=RIGHT.probation AND LEFT.offensetown=RIGHT.offensetown
              AND LEFT.convict_dt=RIGHT.convict_dt AND LEFT.court_county=RIGHT.court_county AND LEFT.fcra_offense_key=RIGHT.fcra_offense_key AND LEFT.fcra_conviction_flag=RIGHT.fcra_conviction_flag AND LEFT.fcra_traffic_flag=RIGHT.fcra_traffic_flag AND LEFT.fcra_date=RIGHT.fcra_date AND LEFT.fcra_date_type=RIGHT.fcra_date_type AND LEFT.conviction_override_date=RIGHT.conviction_override_date AND LEFT.conviction_override_date_type=RIGHT.conviction_override_date_type AND LEFT.offense_score=RIGHT.offense_score
              AND LEFT.offense_persistent_id=RIGHT.offense_persistent_id AND LEFT.offense_category=RIGHT.offense_category AND LEFT.vault_date_last_seen=0 AND RIGHT.vault_date_last_seen=0,MergeData1(LEFT,RIGHT),FULL OUTER,HASH);
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
  SHARED AllRecs := ORe+NR1+NR(vault_rid<>0) : PERSIST('~temp::I_criminal_offenses_fcra_offender_key::Ingest_Cache',EXPIRE(I_criminal_offenses_fcra_offender_key.Config.PersistExpire));
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
