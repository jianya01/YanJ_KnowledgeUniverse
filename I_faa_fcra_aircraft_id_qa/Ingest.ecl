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
  Ingest0 := JOIN( Base0,FilesToIngest0,LEFT.vault_uid_hash=RIGHT.vault_uid_hash AND LEFT.aircraft_id=RIGHT.aircraft_id AND LEFT.d_score=RIGHT.d_score AND LEFT.best_ssn=RIGHT.best_ssn AND LEFT.did_out=RIGHT.did_out AND LEFT.bdid_out=RIGHT.bdid_out AND LEFT.date_first_seen=RIGHT.date_first_seen
              AND LEFT.date_last_seen=RIGHT.date_last_seen AND LEFT.current_flag=RIGHT.current_flag AND LEFT.n_number=RIGHT.n_number AND LEFT.serial_number=RIGHT.serial_number AND LEFT.mfr_mdl_code=RIGHT.mfr_mdl_code AND LEFT.eng_mfr_mdl=RIGHT.eng_mfr_mdl AND LEFT.year_mfr=RIGHT.year_mfr AND LEFT.type_registrant=RIGHT.type_registrant AND LEFT.name=RIGHT.name AND LEFT.street=RIGHT.street
              AND LEFT.street2=RIGHT.street2 AND LEFT.city=RIGHT.city AND LEFT.state=RIGHT.state AND LEFT.zip_code=RIGHT.zip_code AND LEFT.region=RIGHT.region AND LEFT.orig_county=RIGHT.orig_county AND LEFT.country=RIGHT.country AND LEFT.last_action_date=RIGHT.last_action_date AND LEFT.cert_issue_date=RIGHT.cert_issue_date AND LEFT.certification=RIGHT.certification
              AND LEFT.type_aircraft=RIGHT.type_aircraft AND LEFT.type_engine=RIGHT.type_engine AND LEFT.status_code=RIGHT.status_code AND LEFT.mode_s_code=RIGHT.mode_s_code AND LEFT.fract_owner=RIGHT.fract_owner AND LEFT.aircraft_mfr_name=RIGHT.aircraft_mfr_name AND LEFT.model_name=RIGHT.model_name AND LEFT.prim_range=RIGHT.prim_range AND LEFT.predir=RIGHT.predir AND LEFT.prim_name=RIGHT.prim_name
              AND LEFT.addr_suffix=RIGHT.addr_suffix AND LEFT.postdir=RIGHT.postdir AND LEFT.unit_desig=RIGHT.unit_desig AND LEFT.sec_range=RIGHT.sec_range AND LEFT.p_city_name=RIGHT.p_city_name AND LEFT.v_city_name=RIGHT.v_city_name AND LEFT.st=RIGHT.st AND LEFT.zip=RIGHT.zip AND LEFT.z4=RIGHT.z4 AND LEFT.cart=RIGHT.cart
              AND LEFT.cr_sort_sz=RIGHT.cr_sort_sz AND LEFT.lot=RIGHT.lot AND LEFT.lot_order=RIGHT.lot_order AND LEFT.dpbc=RIGHT.dpbc AND LEFT.chk_digit=RIGHT.chk_digit AND LEFT.rec_type=RIGHT.rec_type AND LEFT.ace_fips_st=RIGHT.ace_fips_st AND LEFT.county=RIGHT.county AND LEFT.geo_lat=RIGHT.geo_lat AND LEFT.geo_long=RIGHT.geo_long
              AND LEFT.msa=RIGHT.msa AND LEFT.geo_blk=RIGHT.geo_blk AND LEFT.geo_match=RIGHT.geo_match AND LEFT.err_stat=RIGHT.err_stat AND LEFT.title=RIGHT.title AND LEFT.fname=RIGHT.fname AND LEFT.mname=RIGHT.mname AND LEFT.lname=RIGHT.lname AND LEFT.name_suffix=RIGHT.name_suffix AND LEFT.compname=RIGHT.compname
              AND LEFT.persistent_record_id=RIGHT.persistent_record_id AND LEFT.dotid=RIGHT.dotid AND LEFT.dotscore=RIGHT.dotscore AND LEFT.dotweight=RIGHT.dotweight AND LEFT.empid=RIGHT.empid AND LEFT.empscore=RIGHT.empscore AND LEFT.empweight=RIGHT.empweight AND LEFT.powid=RIGHT.powid AND LEFT.powscore=RIGHT.powscore AND LEFT.powweight=RIGHT.powweight
              AND LEFT.proxid=RIGHT.proxid AND LEFT.proxscore=RIGHT.proxscore AND LEFT.proxweight=RIGHT.proxweight AND LEFT.seleid=RIGHT.seleid AND LEFT.selescore=RIGHT.selescore AND LEFT.seleweight=RIGHT.seleweight AND LEFT.orgid=RIGHT.orgid AND LEFT.orgscore=RIGHT.orgscore AND LEFT.orgweight=RIGHT.orgweight AND LEFT.ultid=RIGHT.ultid
              AND LEFT.ultscore=RIGHT.ultscore AND LEFT.ultweight=RIGHT.ultweight AND LEFT.vault_date_first_seen=RIGHT.vault_date_first_seen AND LEFT.vault_date_last_seen=RIGHT.vault_date_last_seen,MergeData(LEFT,RIGHT),FULL OUTER,HASH);
  WithRT MergeData1(WithRT le, WithRT ri) := TRANSFORM // old, updated, new
    SELF.vault_date_first_seen := MAP (le.__Tpe = 0 => ri.vault_date_first_seen,ri.__Tpe = 0 => le.vault_date_first_seen,le.vault_date_first_seen<ri.vault_date_first_seen => le.vault_date_first_seen,ri.vault_date_first_seen);
    SELF.__Tpe := MAP (le.__Tpe = 0 => ri.__Tpe,ri.__Tpe = 0 => le.__Tpe,RecordType.Updated);
    SELF := IF( le.__Tpe=0,ri,le);
  END;
 
  // Ingest1: Merge Open Old with Open New to get old, updated, new
  Ingest1 := JOIN( Ingest0(__Tpe=RecordType.Old),Ingest0(__Tpe=RecordType.New),LEFT.vault_uid_hash=RIGHT.vault_uid_hash AND LEFT.aircraft_id=RIGHT.aircraft_id AND LEFT.d_score=RIGHT.d_score AND LEFT.best_ssn=RIGHT.best_ssn AND LEFT.did_out=RIGHT.did_out AND LEFT.bdid_out=RIGHT.bdid_out AND LEFT.date_first_seen=RIGHT.date_first_seen
              AND LEFT.date_last_seen=RIGHT.date_last_seen AND LEFT.current_flag=RIGHT.current_flag AND LEFT.n_number=RIGHT.n_number AND LEFT.serial_number=RIGHT.serial_number AND LEFT.mfr_mdl_code=RIGHT.mfr_mdl_code AND LEFT.eng_mfr_mdl=RIGHT.eng_mfr_mdl AND LEFT.year_mfr=RIGHT.year_mfr AND LEFT.type_registrant=RIGHT.type_registrant AND LEFT.name=RIGHT.name AND LEFT.street=RIGHT.street
              AND LEFT.street2=RIGHT.street2 AND LEFT.city=RIGHT.city AND LEFT.state=RIGHT.state AND LEFT.zip_code=RIGHT.zip_code AND LEFT.region=RIGHT.region AND LEFT.orig_county=RIGHT.orig_county AND LEFT.country=RIGHT.country AND LEFT.last_action_date=RIGHT.last_action_date AND LEFT.cert_issue_date=RIGHT.cert_issue_date AND LEFT.certification=RIGHT.certification
              AND LEFT.type_aircraft=RIGHT.type_aircraft AND LEFT.type_engine=RIGHT.type_engine AND LEFT.status_code=RIGHT.status_code AND LEFT.mode_s_code=RIGHT.mode_s_code AND LEFT.fract_owner=RIGHT.fract_owner AND LEFT.aircraft_mfr_name=RIGHT.aircraft_mfr_name AND LEFT.model_name=RIGHT.model_name AND LEFT.prim_range=RIGHT.prim_range AND LEFT.predir=RIGHT.predir AND LEFT.prim_name=RIGHT.prim_name
              AND LEFT.addr_suffix=RIGHT.addr_suffix AND LEFT.postdir=RIGHT.postdir AND LEFT.unit_desig=RIGHT.unit_desig AND LEFT.sec_range=RIGHT.sec_range AND LEFT.p_city_name=RIGHT.p_city_name AND LEFT.v_city_name=RIGHT.v_city_name AND LEFT.st=RIGHT.st AND LEFT.zip=RIGHT.zip AND LEFT.z4=RIGHT.z4 AND LEFT.cart=RIGHT.cart
              AND LEFT.cr_sort_sz=RIGHT.cr_sort_sz AND LEFT.lot=RIGHT.lot AND LEFT.lot_order=RIGHT.lot_order AND LEFT.dpbc=RIGHT.dpbc AND LEFT.chk_digit=RIGHT.chk_digit AND LEFT.rec_type=RIGHT.rec_type AND LEFT.ace_fips_st=RIGHT.ace_fips_st AND LEFT.county=RIGHT.county AND LEFT.geo_lat=RIGHT.geo_lat AND LEFT.geo_long=RIGHT.geo_long
              AND LEFT.msa=RIGHT.msa AND LEFT.geo_blk=RIGHT.geo_blk AND LEFT.geo_match=RIGHT.geo_match AND LEFT.err_stat=RIGHT.err_stat AND LEFT.title=RIGHT.title AND LEFT.fname=RIGHT.fname AND LEFT.mname=RIGHT.mname AND LEFT.lname=RIGHT.lname AND LEFT.name_suffix=RIGHT.name_suffix AND LEFT.compname=RIGHT.compname
              AND LEFT.persistent_record_id=RIGHT.persistent_record_id AND LEFT.dotid=RIGHT.dotid AND LEFT.dotscore=RIGHT.dotscore AND LEFT.dotweight=RIGHT.dotweight AND LEFT.empid=RIGHT.empid AND LEFT.empscore=RIGHT.empscore AND LEFT.empweight=RIGHT.empweight AND LEFT.powid=RIGHT.powid AND LEFT.powscore=RIGHT.powscore AND LEFT.powweight=RIGHT.powweight
              AND LEFT.proxid=RIGHT.proxid AND LEFT.proxscore=RIGHT.proxscore AND LEFT.proxweight=RIGHT.proxweight AND LEFT.seleid=RIGHT.seleid AND LEFT.selescore=RIGHT.selescore AND LEFT.seleweight=RIGHT.seleweight AND LEFT.orgid=RIGHT.orgid AND LEFT.orgscore=RIGHT.orgscore AND LEFT.orgweight=RIGHT.orgweight AND LEFT.ultid=RIGHT.ultid
              AND LEFT.ultscore=RIGHT.ultscore AND LEFT.ultweight=RIGHT.ultweight AND LEFT.vault_date_last_seen=0 AND RIGHT.vault_date_last_seen=0,MergeData1(LEFT,RIGHT),FULL OUTER,HASH);
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
  SHARED AllRecs := ORe+NR1+NR(vault_rid<>0) : PERSIST('~temp::I_faa_fcra_aircraft_id_qa::Ingest_Cache',EXPIRE(I_faa_fcra_aircraft_id_qa.Config.PersistExpire));
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

