﻿IMPORT STD,SALT311;
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
  Ingest0 := JOIN( Base0,FilesToIngest0,LEFT.vault_uid_hash=RIGHT.vault_uid_hash AND LEFT.p7=RIGHT.p7 AND LEFT.p3=RIGHT.p3 AND LEFT.st=RIGHT.st AND LEFT.current_flag=RIGHT.current_flag AND LEFT.business_flag=RIGHT.business_flag AND LEFT.src=RIGHT.src
              AND LEFT.listing_type_bus=RIGHT.listing_type_bus AND LEFT.listing_type_res=RIGHT.listing_type_res AND LEFT.listing_type_gov=RIGHT.listing_type_gov AND LEFT.publish_code=RIGHT.publish_code AND LEFT.prior_area_code=RIGHT.prior_area_code AND LEFT.phone10=RIGHT.phone10 AND LEFT.prim_range=RIGHT.prim_range AND LEFT.predir=RIGHT.predir AND LEFT.prim_name=RIGHT.prim_name AND LEFT.suffix=RIGHT.suffix
              AND LEFT.postdir=RIGHT.postdir AND LEFT.unit_desig=RIGHT.unit_desig AND LEFT.sec_range=RIGHT.sec_range AND LEFT.p_city_name=RIGHT.p_city_name AND LEFT.v_predir=RIGHT.v_predir AND LEFT.v_prim_name=RIGHT.v_prim_name AND LEFT.v_suffix=RIGHT.v_suffix AND LEFT.v_postdir=RIGHT.v_postdir AND LEFT.v_city_name=RIGHT.v_city_name AND LEFT.z5=RIGHT.z5
              AND LEFT.z4=RIGHT.z4 AND LEFT.county_code=RIGHT.county_code AND LEFT.geo_lat=RIGHT.geo_lat AND LEFT.geo_long=RIGHT.geo_long AND LEFT.msa=RIGHT.msa AND LEFT.designation=RIGHT.designation AND LEFT.name_prefix=RIGHT.name_prefix AND LEFT.name_first=RIGHT.name_first AND LEFT.name_middle=RIGHT.name_middle AND LEFT.name_last=RIGHT.name_last
              AND LEFT.name_suffix=RIGHT.name_suffix AND LEFT.listed_name=RIGHT.listed_name AND LEFT.caption_text=RIGHT.caption_text AND LEFT.omit_address=RIGHT.omit_address AND LEFT.omit_phone=RIGHT.omit_phone AND LEFT.omit_locality=RIGHT.omit_locality AND LEFT.see_also_text=RIGHT.see_also_text AND LEFT.did=RIGHT.did AND LEFT.hhid=RIGHT.hhid AND LEFT.bdid=RIGHT.bdid
              AND LEFT.dt_first_seen=RIGHT.dt_first_seen AND LEFT.dt_last_seen=RIGHT.dt_last_seen AND LEFT.current_record_flag=RIGHT.current_record_flag AND LEFT.deletion_date=RIGHT.deletion_date AND LEFT.disc_cnt6=RIGHT.disc_cnt6 AND LEFT.disc_cnt12=RIGHT.disc_cnt12 AND LEFT.disc_cnt18=RIGHT.disc_cnt18 AND LEFT.persistent_record_id=RIGHT.persistent_record_id AND LEFT.phone7=RIGHT.phone7 AND LEFT.area_code=RIGHT.area_code
              AND LEFT.__internal_fpos__=RIGHT.__internal_fpos__ AND LEFT.vault_date_first_seen=RIGHT.vault_date_first_seen AND LEFT.vault_date_last_seen=RIGHT.vault_date_last_seen,MergeData(LEFT,RIGHT),FULL OUTER,HASH);
  WithRT MergeData1(WithRT le, WithRT ri) := TRANSFORM // old, updated, new
    SELF.vault_date_first_seen := MAP (le.__Tpe = 0 => ri.vault_date_first_seen,ri.__Tpe = 0 => le.vault_date_first_seen,le.vault_date_first_seen<ri.vault_date_first_seen => le.vault_date_first_seen,ri.vault_date_first_seen);
    SELF.__Tpe := MAP (le.__Tpe = 0 => ri.__Tpe,ri.__Tpe = 0 => le.__Tpe,RecordType.Updated);
    SELF := IF( le.__Tpe=0,ri,le);
  END;
 
  // Ingest1: Merge Open Old with Open New to get old, updated, new
  Ingest1 := JOIN( Ingest0(__Tpe=RecordType.Old),Ingest0(__Tpe=RecordType.New),LEFT.vault_uid_hash=RIGHT.vault_uid_hash AND LEFT.p7=RIGHT.p7 AND LEFT.p3=RIGHT.p3 AND LEFT.st=RIGHT.st AND LEFT.current_flag=RIGHT.current_flag AND LEFT.business_flag=RIGHT.business_flag AND LEFT.src=RIGHT.src
              AND LEFT.listing_type_bus=RIGHT.listing_type_bus AND LEFT.listing_type_res=RIGHT.listing_type_res AND LEFT.listing_type_gov=RIGHT.listing_type_gov AND LEFT.publish_code=RIGHT.publish_code AND LEFT.prior_area_code=RIGHT.prior_area_code AND LEFT.phone10=RIGHT.phone10 AND LEFT.prim_range=RIGHT.prim_range AND LEFT.predir=RIGHT.predir AND LEFT.prim_name=RIGHT.prim_name AND LEFT.suffix=RIGHT.suffix
              AND LEFT.postdir=RIGHT.postdir AND LEFT.unit_desig=RIGHT.unit_desig AND LEFT.sec_range=RIGHT.sec_range AND LEFT.p_city_name=RIGHT.p_city_name AND LEFT.v_predir=RIGHT.v_predir AND LEFT.v_prim_name=RIGHT.v_prim_name AND LEFT.v_suffix=RIGHT.v_suffix AND LEFT.v_postdir=RIGHT.v_postdir AND LEFT.v_city_name=RIGHT.v_city_name AND LEFT.z5=RIGHT.z5
              AND LEFT.z4=RIGHT.z4 AND LEFT.county_code=RIGHT.county_code AND LEFT.geo_lat=RIGHT.geo_lat AND LEFT.geo_long=RIGHT.geo_long AND LEFT.msa=RIGHT.msa AND LEFT.designation=RIGHT.designation AND LEFT.name_prefix=RIGHT.name_prefix AND LEFT.name_first=RIGHT.name_first AND LEFT.name_middle=RIGHT.name_middle AND LEFT.name_last=RIGHT.name_last
              AND LEFT.name_suffix=RIGHT.name_suffix AND LEFT.listed_name=RIGHT.listed_name AND LEFT.caption_text=RIGHT.caption_text AND LEFT.omit_address=RIGHT.omit_address AND LEFT.omit_phone=RIGHT.omit_phone AND LEFT.omit_locality=RIGHT.omit_locality AND LEFT.see_also_text=RIGHT.see_also_text AND LEFT.did=RIGHT.did AND LEFT.hhid=RIGHT.hhid AND LEFT.bdid=RIGHT.bdid
              AND LEFT.dt_first_seen=RIGHT.dt_first_seen AND LEFT.dt_last_seen=RIGHT.dt_last_seen AND LEFT.current_record_flag=RIGHT.current_record_flag AND LEFT.deletion_date=RIGHT.deletion_date AND LEFT.disc_cnt6=RIGHT.disc_cnt6 AND LEFT.disc_cnt12=RIGHT.disc_cnt12 AND LEFT.disc_cnt18=RIGHT.disc_cnt18 AND LEFT.persistent_record_id=RIGHT.persistent_record_id AND LEFT.phone7=RIGHT.phone7 AND LEFT.area_code=RIGHT.area_code
              AND LEFT.__internal_fpos__=RIGHT.__internal_fpos__ AND LEFT.vault_date_last_seen=0 AND RIGHT.vault_date_last_seen=0,MergeData1(LEFT,RIGHT),FULL OUTER,HASH);
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
  SHARED AllRecs := ORe+NR1+NR(vault_rid<>0) : PERSIST('~temp::I_gong_history_fcra_phone::Ingest_Cache',EXPIRE(I_gong_history_fcra_phone.Config.PersistExpire));
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
