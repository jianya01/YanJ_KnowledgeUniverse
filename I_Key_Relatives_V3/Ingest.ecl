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
  Ingest0 := JOIN( Base0,FilesToIngest0,LEFT.vault_uid_hash=RIGHT.vault_uid_hash AND LEFT.did1=RIGHT.did1 AND LEFT.type=RIGHT.type AND LEFT.confidence=RIGHT.confidence AND LEFT.did2=RIGHT.did2 AND LEFT.cohabit_score=RIGHT.cohabit_score AND LEFT.cohabit_cnt=RIGHT.cohabit_cnt
              AND LEFT.coapt_score=RIGHT.coapt_score AND LEFT.coapt_cnt=RIGHT.coapt_cnt AND LEFT.copobox_score=RIGHT.copobox_score AND LEFT.copobox_cnt=RIGHT.copobox_cnt AND LEFT.cossn_score=RIGHT.cossn_score AND LEFT.cossn_cnt=RIGHT.cossn_cnt AND LEFT.copolicy_score=RIGHT.copolicy_score AND LEFT.copolicy_cnt=RIGHT.copolicy_cnt AND LEFT.coclaim_score=RIGHT.coclaim_score AND LEFT.coclaim_cnt=RIGHT.coclaim_cnt
              AND LEFT.coproperty_score=RIGHT.coproperty_score AND LEFT.coproperty_cnt=RIGHT.coproperty_cnt AND LEFT.bcoproperty_score=RIGHT.bcoproperty_score AND LEFT.bcoproperty_cnt=RIGHT.bcoproperty_cnt AND LEFT.coforeclosure_score=RIGHT.coforeclosure_score AND LEFT.coforeclosure_cnt=RIGHT.coforeclosure_cnt AND LEFT.bcoforeclosure_score=RIGHT.bcoforeclosure_score AND LEFT.bcoforeclosure_cnt=RIGHT.bcoforeclosure_cnt AND LEFT.colien_score=RIGHT.colien_score AND LEFT.colien_cnt=RIGHT.colien_cnt
              AND LEFT.bcolien_score=RIGHT.bcolien_score AND LEFT.bcolien_cnt=RIGHT.bcolien_cnt AND LEFT.cobankruptcy_score=RIGHT.cobankruptcy_score AND LEFT.cobankruptcy_cnt=RIGHT.cobankruptcy_cnt AND LEFT.bcobankruptcy_score=RIGHT.bcobankruptcy_score AND LEFT.bcobankruptcy_cnt=RIGHT.bcobankruptcy_cnt AND LEFT.covehicle_score=RIGHT.covehicle_score AND LEFT.covehicle_cnt=RIGHT.covehicle_cnt AND LEFT.coexperian_score=RIGHT.coexperian_score AND LEFT.coexperian_cnt=RIGHT.coexperian_cnt
              AND LEFT.cotransunion_score=RIGHT.cotransunion_score AND LEFT.cotransunion_cnt=RIGHT.cotransunion_cnt AND LEFT.coenclarity_score=RIGHT.coenclarity_score AND LEFT.coenclarity_cnt=RIGHT.coenclarity_cnt AND LEFT.coecrash_score=RIGHT.coecrash_score AND LEFT.coecrash_cnt=RIGHT.coecrash_cnt AND LEFT.bcoecrash_score=RIGHT.bcoecrash_score AND LEFT.bcoecrash_cnt=RIGHT.bcoecrash_cnt AND LEFT.cowatercraft_score=RIGHT.cowatercraft_score AND LEFT.cowatercraft_cnt=RIGHT.cowatercraft_cnt
              AND LEFT.coaircraft_score=RIGHT.coaircraft_score AND LEFT.coaircraft_cnt=RIGHT.coaircraft_cnt AND LEFT.comarriagedivorce_score=RIGHT.comarriagedivorce_score AND LEFT.comarriagedivorce_cnt=RIGHT.comarriagedivorce_cnt AND LEFT.coucc_score=RIGHT.coucc_score AND LEFT.coucc_cnt=RIGHT.coucc_cnt AND LEFT.lname_score=RIGHT.lname_score AND LEFT.phone_score=RIGHT.phone_score AND LEFT.dl_nbr_score=RIGHT.dl_nbr_score AND LEFT.total_cnt=RIGHT.total_cnt
              AND LEFT.total_score=RIGHT.total_score AND LEFT.cluster=RIGHT.cluster AND LEFT.generation=RIGHT.generation AND LEFT.gender=RIGHT.gender AND LEFT.lname_cnt=RIGHT.lname_cnt AND LEFT.rel_dt_first_seen=RIGHT.rel_dt_first_seen AND LEFT.rel_dt_last_seen=RIGHT.rel_dt_last_seen AND LEFT.overlap_months=RIGHT.overlap_months AND LEFT.hdr_dt_first_seen=RIGHT.hdr_dt_first_seen AND LEFT.hdr_dt_last_seen=RIGHT.hdr_dt_last_seen
              AND LEFT.age_first_seen=RIGHT.age_first_seen AND LEFT.isanylnamematch=RIGHT.isanylnamematch AND LEFT.isanyphonematch=RIGHT.isanyphonematch AND LEFT.isearlylnamematch=RIGHT.isearlylnamematch AND LEFT.iscurrlnamematch=RIGHT.iscurrlnamematch AND LEFT.ismixedlnamematch=RIGHT.ismixedlnamematch AND LEFT.ssn1=RIGHT.ssn1 AND LEFT.ssn2=RIGHT.ssn2 AND LEFT.dob1=RIGHT.dob1 AND LEFT.dob2=RIGHT.dob2
              AND LEFT.current_lname1=RIGHT.current_lname1 AND LEFT.current_lname2=RIGHT.current_lname2 AND LEFT.early_lname1=RIGHT.early_lname1 AND LEFT.early_lname2=RIGHT.early_lname2 AND LEFT.addr_ind1=RIGHT.addr_ind1 AND LEFT.addr_ind2=RIGHT.addr_ind2 AND LEFT.r2rdid=RIGHT.r2rdid AND LEFT.r2cnt=RIGHT.r2cnt AND LEFT.personal=RIGHT.personal AND LEFT.business=RIGHT.business
              AND LEFT.other=RIGHT.other AND LEFT.title=RIGHT.title AND LEFT.vault_date_first_seen=RIGHT.vault_date_first_seen AND LEFT.vault_date_last_seen=RIGHT.vault_date_last_seen,MergeData(LEFT,RIGHT),FULL OUTER,HASH);
  WithRT MergeData1(WithRT le, WithRT ri) := TRANSFORM // old, updated, new
    SELF.vault_date_first_seen := MAP (le.__Tpe = 0 => ri.vault_date_first_seen,ri.__Tpe = 0 => le.vault_date_first_seen,le.vault_date_first_seen<ri.vault_date_first_seen => le.vault_date_first_seen,ri.vault_date_first_seen);
    SELF.__Tpe := MAP (le.__Tpe = 0 => ri.__Tpe,ri.__Tpe = 0 => le.__Tpe,RecordType.Updated);
    SELF := IF( le.__Tpe=0,ri,le);
  END;
 
  // Ingest1: Merge Open Old with Open New to get old, updated, new
  Ingest1 := JOIN( Ingest0(__Tpe=RecordType.Old),Ingest0(__Tpe=RecordType.New),LEFT.vault_uid_hash=RIGHT.vault_uid_hash AND LEFT.did1=RIGHT.did1 AND LEFT.type=RIGHT.type AND LEFT.confidence=RIGHT.confidence AND LEFT.did2=RIGHT.did2 AND LEFT.cohabit_score=RIGHT.cohabit_score AND LEFT.cohabit_cnt=RIGHT.cohabit_cnt
              AND LEFT.coapt_score=RIGHT.coapt_score AND LEFT.coapt_cnt=RIGHT.coapt_cnt AND LEFT.copobox_score=RIGHT.copobox_score AND LEFT.copobox_cnt=RIGHT.copobox_cnt AND LEFT.cossn_score=RIGHT.cossn_score AND LEFT.cossn_cnt=RIGHT.cossn_cnt AND LEFT.copolicy_score=RIGHT.copolicy_score AND LEFT.copolicy_cnt=RIGHT.copolicy_cnt AND LEFT.coclaim_score=RIGHT.coclaim_score AND LEFT.coclaim_cnt=RIGHT.coclaim_cnt
              AND LEFT.coproperty_score=RIGHT.coproperty_score AND LEFT.coproperty_cnt=RIGHT.coproperty_cnt AND LEFT.bcoproperty_score=RIGHT.bcoproperty_score AND LEFT.bcoproperty_cnt=RIGHT.bcoproperty_cnt AND LEFT.coforeclosure_score=RIGHT.coforeclosure_score AND LEFT.coforeclosure_cnt=RIGHT.coforeclosure_cnt AND LEFT.bcoforeclosure_score=RIGHT.bcoforeclosure_score AND LEFT.bcoforeclosure_cnt=RIGHT.bcoforeclosure_cnt AND LEFT.colien_score=RIGHT.colien_score AND LEFT.colien_cnt=RIGHT.colien_cnt
              AND LEFT.bcolien_score=RIGHT.bcolien_score AND LEFT.bcolien_cnt=RIGHT.bcolien_cnt AND LEFT.cobankruptcy_score=RIGHT.cobankruptcy_score AND LEFT.cobankruptcy_cnt=RIGHT.cobankruptcy_cnt AND LEFT.bcobankruptcy_score=RIGHT.bcobankruptcy_score AND LEFT.bcobankruptcy_cnt=RIGHT.bcobankruptcy_cnt AND LEFT.covehicle_score=RIGHT.covehicle_score AND LEFT.covehicle_cnt=RIGHT.covehicle_cnt AND LEFT.coexperian_score=RIGHT.coexperian_score AND LEFT.coexperian_cnt=RIGHT.coexperian_cnt
              AND LEFT.cotransunion_score=RIGHT.cotransunion_score AND LEFT.cotransunion_cnt=RIGHT.cotransunion_cnt AND LEFT.coenclarity_score=RIGHT.coenclarity_score AND LEFT.coenclarity_cnt=RIGHT.coenclarity_cnt AND LEFT.coecrash_score=RIGHT.coecrash_score AND LEFT.coecrash_cnt=RIGHT.coecrash_cnt AND LEFT.bcoecrash_score=RIGHT.bcoecrash_score AND LEFT.bcoecrash_cnt=RIGHT.bcoecrash_cnt AND LEFT.cowatercraft_score=RIGHT.cowatercraft_score AND LEFT.cowatercraft_cnt=RIGHT.cowatercraft_cnt
              AND LEFT.coaircraft_score=RIGHT.coaircraft_score AND LEFT.coaircraft_cnt=RIGHT.coaircraft_cnt AND LEFT.comarriagedivorce_score=RIGHT.comarriagedivorce_score AND LEFT.comarriagedivorce_cnt=RIGHT.comarriagedivorce_cnt AND LEFT.coucc_score=RIGHT.coucc_score AND LEFT.coucc_cnt=RIGHT.coucc_cnt AND LEFT.lname_score=RIGHT.lname_score AND LEFT.phone_score=RIGHT.phone_score AND LEFT.dl_nbr_score=RIGHT.dl_nbr_score AND LEFT.total_cnt=RIGHT.total_cnt
              AND LEFT.total_score=RIGHT.total_score AND LEFT.cluster=RIGHT.cluster AND LEFT.generation=RIGHT.generation AND LEFT.gender=RIGHT.gender AND LEFT.lname_cnt=RIGHT.lname_cnt AND LEFT.rel_dt_first_seen=RIGHT.rel_dt_first_seen AND LEFT.rel_dt_last_seen=RIGHT.rel_dt_last_seen AND LEFT.overlap_months=RIGHT.overlap_months AND LEFT.hdr_dt_first_seen=RIGHT.hdr_dt_first_seen AND LEFT.hdr_dt_last_seen=RIGHT.hdr_dt_last_seen
              AND LEFT.age_first_seen=RIGHT.age_first_seen AND LEFT.isanylnamematch=RIGHT.isanylnamematch AND LEFT.isanyphonematch=RIGHT.isanyphonematch AND LEFT.isearlylnamematch=RIGHT.isearlylnamematch AND LEFT.iscurrlnamematch=RIGHT.iscurrlnamematch AND LEFT.ismixedlnamematch=RIGHT.ismixedlnamematch AND LEFT.ssn1=RIGHT.ssn1 AND LEFT.ssn2=RIGHT.ssn2 AND LEFT.dob1=RIGHT.dob1 AND LEFT.dob2=RIGHT.dob2
              AND LEFT.current_lname1=RIGHT.current_lname1 AND LEFT.current_lname2=RIGHT.current_lname2 AND LEFT.early_lname1=RIGHT.early_lname1 AND LEFT.early_lname2=RIGHT.early_lname2 AND LEFT.addr_ind1=RIGHT.addr_ind1 AND LEFT.addr_ind2=RIGHT.addr_ind2 AND LEFT.r2rdid=RIGHT.r2rdid AND LEFT.r2cnt=RIGHT.r2cnt AND LEFT.personal=RIGHT.personal AND LEFT.business=RIGHT.business
              AND LEFT.other=RIGHT.other AND LEFT.title=RIGHT.title AND LEFT.vault_date_last_seen=0 AND RIGHT.vault_date_last_seen=0,MergeData1(LEFT,RIGHT),FULL OUTER,HASH);
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
  SHARED AllRecs := ORe+NR1+NR(vault_rid<>0) : PERSIST('~temp::I_Key_Relatives_V3::Ingest_Cache',EXPIRE(I_Key_Relatives_V3.Config.PersistExpire));
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
