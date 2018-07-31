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
  Ingest0 := JOIN( Base0,FilesToIngest0,LEFT.vault_uid_hash=RIGHT.vault_uid_hash AND LEFT.did=RIGHT.did AND LEFT.phone=RIGHT.phone AND LEFT.ssn=RIGHT.ssn AND LEFT.dob=RIGHT.dob AND LEFT.title=RIGHT.title AND LEFT.fname=RIGHT.fname
              AND LEFT.mname=RIGHT.mname AND LEFT.lname=RIGHT.lname AND LEFT.name_suffix=RIGHT.name_suffix AND LEFT.prim_range=RIGHT.prim_range AND LEFT.predir=RIGHT.predir AND LEFT.prim_name=RIGHT.prim_name AND LEFT.suffix=RIGHT.suffix AND LEFT.postdir=RIGHT.postdir AND LEFT.unit_desig=RIGHT.unit_desig AND LEFT.sec_range=RIGHT.sec_range
              AND LEFT.city_name=RIGHT.city_name AND LEFT.st=RIGHT.st AND LEFT.zip=RIGHT.zip AND LEFT.zip4=RIGHT.zip4 AND LEFT.addr_dt_last_seen=RIGHT.addr_dt_last_seen AND LEFT.dod=RIGHT.dod AND LEFT.prpty_deed_id=RIGHT.prpty_deed_id AND LEFT.vehicle_vehnum=RIGHT.vehicle_vehnum AND LEFT.bkrupt_crtcode_caseno=RIGHT.bkrupt_crtcode_caseno AND LEFT.main_count=RIGHT.main_count
              AND LEFT.search_count=RIGHT.search_count AND LEFT.dl_number=RIGHT.dl_number AND LEFT.bdid=RIGHT.bdid AND LEFT.run_date=RIGHT.run_date AND LEFT.total_records=RIGHT.total_records AND LEFT.rawaid=RIGHT.rawaid AND LEFT.addr_dt_first_seen=RIGHT.addr_dt_first_seen AND LEFT.adl_ind=RIGHT.adl_ind AND LEFT.valid_ssn=RIGHT.valid_ssn AND LEFT.__internal_fpos__=RIGHT.__internal_fpos__ AND LEFT.vault_date_first_seen=RIGHT.vault_date_first_seen AND LEFT.vault_date_last_seen=RIGHT.vault_date_last_seen,MergeData(LEFT,RIGHT),FULL OUTER,HASH);
  WithRT MergeData1(WithRT le, WithRT ri) := TRANSFORM // old, updated, new
    SELF.vault_date_first_seen := MAP (le.__Tpe = 0 => ri.vault_date_first_seen,ri.__Tpe = 0 => le.vault_date_first_seen,le.vault_date_first_seen<ri.vault_date_first_seen => le.vault_date_first_seen,ri.vault_date_first_seen);
    SELF.__Tpe := MAP (le.__Tpe = 0 => ri.__Tpe,ri.__Tpe = 0 => le.__Tpe,RecordType.Updated);
    SELF := IF( le.__Tpe=0,ri,le);
  END;
 
  // Ingest1: Merge Open Old with Open New to get old, updated, new
  Ingest1 := JOIN( Ingest0(__Tpe=RecordType.Old),Ingest0(__Tpe=RecordType.New),LEFT.vault_uid_hash=RIGHT.vault_uid_hash AND LEFT.did=RIGHT.did AND LEFT.phone=RIGHT.phone AND LEFT.ssn=RIGHT.ssn AND LEFT.dob=RIGHT.dob AND LEFT.title=RIGHT.title AND LEFT.fname=RIGHT.fname
              AND LEFT.mname=RIGHT.mname AND LEFT.lname=RIGHT.lname AND LEFT.name_suffix=RIGHT.name_suffix AND LEFT.prim_range=RIGHT.prim_range AND LEFT.predir=RIGHT.predir AND LEFT.prim_name=RIGHT.prim_name AND LEFT.suffix=RIGHT.suffix AND LEFT.postdir=RIGHT.postdir AND LEFT.unit_desig=RIGHT.unit_desig AND LEFT.sec_range=RIGHT.sec_range
              AND LEFT.city_name=RIGHT.city_name AND LEFT.st=RIGHT.st AND LEFT.zip=RIGHT.zip AND LEFT.zip4=RIGHT.zip4 AND LEFT.addr_dt_last_seen=RIGHT.addr_dt_last_seen AND LEFT.dod=RIGHT.dod AND LEFT.prpty_deed_id=RIGHT.prpty_deed_id AND LEFT.vehicle_vehnum=RIGHT.vehicle_vehnum AND LEFT.bkrupt_crtcode_caseno=RIGHT.bkrupt_crtcode_caseno AND LEFT.main_count=RIGHT.main_count
              AND LEFT.search_count=RIGHT.search_count AND LEFT.dl_number=RIGHT.dl_number AND LEFT.bdid=RIGHT.bdid AND LEFT.run_date=RIGHT.run_date AND LEFT.total_records=RIGHT.total_records AND LEFT.rawaid=RIGHT.rawaid AND LEFT.addr_dt_first_seen=RIGHT.addr_dt_first_seen AND LEFT.adl_ind=RIGHT.adl_ind AND LEFT.valid_ssn=RIGHT.valid_ssn AND LEFT.__internal_fpos__=RIGHT.__internal_fpos__ AND LEFT.vault_date_last_seen=0 AND RIGHT.vault_date_last_seen=0,MergeData1(LEFT,RIGHT),FULL OUTER,HASH);
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
  SHARED AllRecs := ORe+NR1+NR(vault_rid<>0) : PERSIST('~temp::I_watchdog_best_fcra_noneq_did::Ingest_Cache',EXPIRE(I_watchdog_best_fcra_noneq_did.Config.PersistExpire));
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
