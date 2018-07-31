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
  Ingest0 := JOIN( Base0,FilesToIngest0,LEFT.vault_uid_hash=RIGHT.vault_uid_hash AND LEFT.ofk=RIGHT.ofk AND LEFT.process_date=RIGHT.process_date AND LEFT.offender_key=RIGHT.offender_key AND LEFT.vendor=RIGHT.vendor AND LEFT.state_origin=RIGHT.state_origin AND LEFT.source_file=RIGHT.source_file
              AND LEFT.data_type=RIGHT.data_type AND LEFT.off_comp=RIGHT.off_comp AND LEFT.off_delete_flag=RIGHT.off_delete_flag AND LEFT.off_date=RIGHT.off_date AND LEFT.arr_date=RIGHT.arr_date AND LEFT.num_of_counts=RIGHT.num_of_counts AND LEFT.le_agency_cd=RIGHT.le_agency_cd AND LEFT.le_agency_desc=RIGHT.le_agency_desc AND LEFT.le_agency_case_number=RIGHT.le_agency_case_number AND LEFT.traffic_ticket_number=RIGHT.traffic_ticket_number
              AND LEFT.traffic_dl_no=RIGHT.traffic_dl_no AND LEFT.traffic_dl_st=RIGHT.traffic_dl_st AND LEFT.arr_off_code=RIGHT.arr_off_code AND LEFT.arr_off_desc_1=RIGHT.arr_off_desc_1 AND LEFT.arr_off_desc_2=RIGHT.arr_off_desc_2 AND LEFT.arr_off_type_cd=RIGHT.arr_off_type_cd AND LEFT.arr_off_type_desc=RIGHT.arr_off_type_desc AND LEFT.arr_off_lev=RIGHT.arr_off_lev AND LEFT.arr_statute=RIGHT.arr_statute AND LEFT.arr_statute_desc=RIGHT.arr_statute_desc
              AND LEFT.arr_disp_date=RIGHT.arr_disp_date AND LEFT.arr_disp_code=RIGHT.arr_disp_code AND LEFT.arr_disp_desc_1=RIGHT.arr_disp_desc_1 AND LEFT.arr_disp_desc_2=RIGHT.arr_disp_desc_2 AND LEFT.pros_refer_cd=RIGHT.pros_refer_cd AND LEFT.pros_refer=RIGHT.pros_refer AND LEFT.pros_assgn_cd=RIGHT.pros_assgn_cd AND LEFT.pros_assgn=RIGHT.pros_assgn AND LEFT.pros_chg_rej=RIGHT.pros_chg_rej AND LEFT.pros_off_code=RIGHT.pros_off_code
              AND LEFT.pros_off_desc_1=RIGHT.pros_off_desc_1 AND LEFT.pros_off_desc_2=RIGHT.pros_off_desc_2 AND LEFT.pros_off_type_cd=RIGHT.pros_off_type_cd AND LEFT.pros_off_type_desc=RIGHT.pros_off_type_desc AND LEFT.pros_off_lev=RIGHT.pros_off_lev AND LEFT.pros_act_filed=RIGHT.pros_act_filed AND LEFT.court_case_number=RIGHT.court_case_number AND LEFT.court_cd=RIGHT.court_cd AND LEFT.court_desc=RIGHT.court_desc AND LEFT.court_appeal_flag=RIGHT.court_appeal_flag
              AND LEFT.court_final_plea=RIGHT.court_final_plea AND LEFT.court_off_code=RIGHT.court_off_code AND LEFT.court_off_desc_1=RIGHT.court_off_desc_1 AND LEFT.court_off_desc_2=RIGHT.court_off_desc_2 AND LEFT.court_off_type_cd=RIGHT.court_off_type_cd AND LEFT.court_off_type_desc=RIGHT.court_off_type_desc AND LEFT.court_off_lev=RIGHT.court_off_lev AND LEFT.court_statute=RIGHT.court_statute AND LEFT.court_additional_statutes=RIGHT.court_additional_statutes AND LEFT.court_statute_desc=RIGHT.court_statute_desc
              AND LEFT.court_disp_date=RIGHT.court_disp_date AND LEFT.court_disp_code=RIGHT.court_disp_code AND LEFT.court_disp_desc_1=RIGHT.court_disp_desc_1 AND LEFT.court_disp_desc_2=RIGHT.court_disp_desc_2 AND LEFT.sent_date=RIGHT.sent_date AND LEFT.sent_jail=RIGHT.sent_jail AND LEFT.sent_susp_time=RIGHT.sent_susp_time AND LEFT.sent_court_cost=RIGHT.sent_court_cost AND LEFT.sent_court_fine=RIGHT.sent_court_fine AND LEFT.sent_susp_court_fine=RIGHT.sent_susp_court_fine
              AND LEFT.sent_probation=RIGHT.sent_probation AND LEFT.sent_addl_prov_code=RIGHT.sent_addl_prov_code AND LEFT.sent_addl_prov_desc_1=RIGHT.sent_addl_prov_desc_1 AND LEFT.sent_addl_prov_desc_2=RIGHT.sent_addl_prov_desc_2 AND LEFT.sent_consec=RIGHT.sent_consec AND LEFT.sent_agency_rec_cust_ori=RIGHT.sent_agency_rec_cust_ori AND LEFT.sent_agency_rec_cust=RIGHT.sent_agency_rec_cust AND LEFT.appeal_date=RIGHT.appeal_date AND LEFT.appeal_off_disp=RIGHT.appeal_off_disp AND LEFT.appeal_final_decision=RIGHT.appeal_final_decision
              AND LEFT.convict_dt=RIGHT.convict_dt AND LEFT.offense_town=RIGHT.offense_town AND LEFT.cty_conv=RIGHT.cty_conv AND LEFT.restitution=RIGHT.restitution AND LEFT.community_service=RIGHT.community_service AND LEFT.parole=RIGHT.parole AND LEFT.addl_sent_dates=RIGHT.addl_sent_dates AND LEFT.probation_desc2=RIGHT.probation_desc2 AND LEFT.court_dt=RIGHT.court_dt AND LEFT.court_county=RIGHT.court_county
              AND LEFT.arr_off_lev_mapped=RIGHT.arr_off_lev_mapped AND LEFT.court_off_lev_mapped=RIGHT.court_off_lev_mapped AND LEFT.fcra_offense_key=RIGHT.fcra_offense_key AND LEFT.fcra_conviction_flag=RIGHT.fcra_conviction_flag AND LEFT.fcra_traffic_flag=RIGHT.fcra_traffic_flag AND LEFT.fcra_date=RIGHT.fcra_date AND LEFT.fcra_date_type=RIGHT.fcra_date_type AND LEFT.conviction_override_date=RIGHT.conviction_override_date AND LEFT.conviction_override_date_type=RIGHT.conviction_override_date_type AND LEFT.offense_score=RIGHT.offense_score
              AND LEFT.offense_persistent_id=RIGHT.offense_persistent_id AND LEFT.offense_category=RIGHT.offense_category AND LEFT.vault_date_first_seen=RIGHT.vault_date_first_seen AND LEFT.vault_date_last_seen=RIGHT.vault_date_last_seen,MergeData(LEFT,RIGHT),FULL OUTER,HASH);
  WithRT MergeData1(WithRT le, WithRT ri) := TRANSFORM // old, updated, new
    SELF.vault_date_first_seen := MAP (le.__Tpe = 0 => ri.vault_date_first_seen,ri.__Tpe = 0 => le.vault_date_first_seen,le.vault_date_first_seen<ri.vault_date_first_seen => le.vault_date_first_seen,ri.vault_date_first_seen);
    SELF.__Tpe := MAP (le.__Tpe = 0 => ri.__Tpe,ri.__Tpe = 0 => le.__Tpe,RecordType.Updated);
    SELF := IF( le.__Tpe=0,ri,le);
  END;
 
  // Ingest1: Merge Open Old with Open New to get old, updated, new
  Ingest1 := JOIN( Ingest0(__Tpe=RecordType.Old),Ingest0(__Tpe=RecordType.New),LEFT.vault_uid_hash=RIGHT.vault_uid_hash AND LEFT.ofk=RIGHT.ofk AND LEFT.process_date=RIGHT.process_date AND LEFT.offender_key=RIGHT.offender_key AND LEFT.vendor=RIGHT.vendor AND LEFT.state_origin=RIGHT.state_origin AND LEFT.source_file=RIGHT.source_file
              AND LEFT.data_type=RIGHT.data_type AND LEFT.off_comp=RIGHT.off_comp AND LEFT.off_delete_flag=RIGHT.off_delete_flag AND LEFT.off_date=RIGHT.off_date AND LEFT.arr_date=RIGHT.arr_date AND LEFT.num_of_counts=RIGHT.num_of_counts AND LEFT.le_agency_cd=RIGHT.le_agency_cd AND LEFT.le_agency_desc=RIGHT.le_agency_desc AND LEFT.le_agency_case_number=RIGHT.le_agency_case_number AND LEFT.traffic_ticket_number=RIGHT.traffic_ticket_number
              AND LEFT.traffic_dl_no=RIGHT.traffic_dl_no AND LEFT.traffic_dl_st=RIGHT.traffic_dl_st AND LEFT.arr_off_code=RIGHT.arr_off_code AND LEFT.arr_off_desc_1=RIGHT.arr_off_desc_1 AND LEFT.arr_off_desc_2=RIGHT.arr_off_desc_2 AND LEFT.arr_off_type_cd=RIGHT.arr_off_type_cd AND LEFT.arr_off_type_desc=RIGHT.arr_off_type_desc AND LEFT.arr_off_lev=RIGHT.arr_off_lev AND LEFT.arr_statute=RIGHT.arr_statute AND LEFT.arr_statute_desc=RIGHT.arr_statute_desc
              AND LEFT.arr_disp_date=RIGHT.arr_disp_date AND LEFT.arr_disp_code=RIGHT.arr_disp_code AND LEFT.arr_disp_desc_1=RIGHT.arr_disp_desc_1 AND LEFT.arr_disp_desc_2=RIGHT.arr_disp_desc_2 AND LEFT.pros_refer_cd=RIGHT.pros_refer_cd AND LEFT.pros_refer=RIGHT.pros_refer AND LEFT.pros_assgn_cd=RIGHT.pros_assgn_cd AND LEFT.pros_assgn=RIGHT.pros_assgn AND LEFT.pros_chg_rej=RIGHT.pros_chg_rej AND LEFT.pros_off_code=RIGHT.pros_off_code
              AND LEFT.pros_off_desc_1=RIGHT.pros_off_desc_1 AND LEFT.pros_off_desc_2=RIGHT.pros_off_desc_2 AND LEFT.pros_off_type_cd=RIGHT.pros_off_type_cd AND LEFT.pros_off_type_desc=RIGHT.pros_off_type_desc AND LEFT.pros_off_lev=RIGHT.pros_off_lev AND LEFT.pros_act_filed=RIGHT.pros_act_filed AND LEFT.court_case_number=RIGHT.court_case_number AND LEFT.court_cd=RIGHT.court_cd AND LEFT.court_desc=RIGHT.court_desc AND LEFT.court_appeal_flag=RIGHT.court_appeal_flag
              AND LEFT.court_final_plea=RIGHT.court_final_plea AND LEFT.court_off_code=RIGHT.court_off_code AND LEFT.court_off_desc_1=RIGHT.court_off_desc_1 AND LEFT.court_off_desc_2=RIGHT.court_off_desc_2 AND LEFT.court_off_type_cd=RIGHT.court_off_type_cd AND LEFT.court_off_type_desc=RIGHT.court_off_type_desc AND LEFT.court_off_lev=RIGHT.court_off_lev AND LEFT.court_statute=RIGHT.court_statute AND LEFT.court_additional_statutes=RIGHT.court_additional_statutes AND LEFT.court_statute_desc=RIGHT.court_statute_desc
              AND LEFT.court_disp_date=RIGHT.court_disp_date AND LEFT.court_disp_code=RIGHT.court_disp_code AND LEFT.court_disp_desc_1=RIGHT.court_disp_desc_1 AND LEFT.court_disp_desc_2=RIGHT.court_disp_desc_2 AND LEFT.sent_date=RIGHT.sent_date AND LEFT.sent_jail=RIGHT.sent_jail AND LEFT.sent_susp_time=RIGHT.sent_susp_time AND LEFT.sent_court_cost=RIGHT.sent_court_cost AND LEFT.sent_court_fine=RIGHT.sent_court_fine AND LEFT.sent_susp_court_fine=RIGHT.sent_susp_court_fine
              AND LEFT.sent_probation=RIGHT.sent_probation AND LEFT.sent_addl_prov_code=RIGHT.sent_addl_prov_code AND LEFT.sent_addl_prov_desc_1=RIGHT.sent_addl_prov_desc_1 AND LEFT.sent_addl_prov_desc_2=RIGHT.sent_addl_prov_desc_2 AND LEFT.sent_consec=RIGHT.sent_consec AND LEFT.sent_agency_rec_cust_ori=RIGHT.sent_agency_rec_cust_ori AND LEFT.sent_agency_rec_cust=RIGHT.sent_agency_rec_cust AND LEFT.appeal_date=RIGHT.appeal_date AND LEFT.appeal_off_disp=RIGHT.appeal_off_disp AND LEFT.appeal_final_decision=RIGHT.appeal_final_decision
              AND LEFT.convict_dt=RIGHT.convict_dt AND LEFT.offense_town=RIGHT.offense_town AND LEFT.cty_conv=RIGHT.cty_conv AND LEFT.restitution=RIGHT.restitution AND LEFT.community_service=RIGHT.community_service AND LEFT.parole=RIGHT.parole AND LEFT.addl_sent_dates=RIGHT.addl_sent_dates AND LEFT.probation_desc2=RIGHT.probation_desc2 AND LEFT.court_dt=RIGHT.court_dt AND LEFT.court_county=RIGHT.court_county
              AND LEFT.arr_off_lev_mapped=RIGHT.arr_off_lev_mapped AND LEFT.court_off_lev_mapped=RIGHT.court_off_lev_mapped AND LEFT.fcra_offense_key=RIGHT.fcra_offense_key AND LEFT.fcra_conviction_flag=RIGHT.fcra_conviction_flag AND LEFT.fcra_traffic_flag=RIGHT.fcra_traffic_flag AND LEFT.fcra_date=RIGHT.fcra_date AND LEFT.fcra_date_type=RIGHT.fcra_date_type AND LEFT.conviction_override_date=RIGHT.conviction_override_date AND LEFT.conviction_override_date_type=RIGHT.conviction_override_date_type AND LEFT.offense_score=RIGHT.offense_score
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
  SHARED AllRecs := ORe+NR1+NR(vault_rid<>0) : PERSIST('~temp::I_corrections_fcra_court_offenses_public::Ingest_Cache',EXPIRE(I_corrections_fcra_court_offenses_public.Config.PersistExpire));
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
