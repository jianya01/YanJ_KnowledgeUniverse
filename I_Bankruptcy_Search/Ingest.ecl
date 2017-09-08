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
  Ingest0 := JOIN( Base0,FilesToIngest0,LEFT.vault_uid_hash=RIGHT.vault_uid_hash AND LEFT.process_date=RIGHT.process_date AND LEFT.caseid=RIGHT.caseid AND LEFT.defendantid=RIGHT.defendantid AND LEFT.recid=RIGHT.recid AND LEFT.tmsid=RIGHT.tmsid AND LEFT.seq_number=RIGHT.seq_number
              AND LEFT.court_code=RIGHT.court_code AND LEFT.case_number=RIGHT.case_number AND LEFT.orig_case_number=RIGHT.orig_case_number AND LEFT.chapter=RIGHT.chapter AND LEFT.filing_type=RIGHT.filing_type AND LEFT.business_flag=RIGHT.business_flag AND LEFT.corp_flag=RIGHT.corp_flag AND LEFT.discharged=RIGHT.discharged AND LEFT.disposition=RIGHT.disposition AND LEFT.pro_se_ind=RIGHT.pro_se_ind
              AND LEFT.converted_date=RIGHT.converted_date AND LEFT.orig_county=RIGHT.orig_county AND LEFT.debtor_type=RIGHT.debtor_type AND LEFT.debtor_seq=RIGHT.debtor_seq AND LEFT.ssn=RIGHT.ssn AND LEFT.ssnsrc=RIGHT.ssnsrc AND LEFT.ssnmatch=RIGHT.ssnmatch AND LEFT.ssnmsrc=RIGHT.ssnmsrc AND LEFT.screen=RIGHT.screen AND LEFT.dcode=RIGHT.dcode
              AND LEFT.disptype=RIGHT.disptype AND LEFT.dispreason=RIGHT.dispreason AND LEFT.statusdate=RIGHT.statusdate AND LEFT.holdcase=RIGHT.holdcase AND LEFT.datevacated=RIGHT.datevacated AND LEFT.datetransferred=RIGHT.datetransferred AND LEFT.activityreceipt=RIGHT.activityreceipt AND LEFT.tax_id=RIGHT.tax_id AND LEFT.name_type=RIGHT.name_type AND LEFT.orig_name=RIGHT.orig_name
              AND LEFT.orig_fname=RIGHT.orig_fname AND LEFT.orig_mname=RIGHT.orig_mname AND LEFT.orig_lname=RIGHT.orig_lname AND LEFT.orig_name_suffix=RIGHT.orig_name_suffix AND LEFT.title=RIGHT.title AND LEFT.fname=RIGHT.fname AND LEFT.mname=RIGHT.mname AND LEFT.lname=RIGHT.lname AND LEFT.name_suffix=RIGHT.name_suffix AND LEFT.name_score=RIGHT.name_score
              AND LEFT.cname=RIGHT.cname AND LEFT.orig_company=RIGHT.orig_company AND LEFT.orig_addr1=RIGHT.orig_addr1 AND LEFT.orig_addr2=RIGHT.orig_addr2 AND LEFT.orig_city=RIGHT.orig_city AND LEFT.orig_st=RIGHT.orig_st AND LEFT.orig_zip5=RIGHT.orig_zip5 AND LEFT.orig_zip4=RIGHT.orig_zip4 AND LEFT.orig_email=RIGHT.orig_email AND LEFT.orig_fax=RIGHT.orig_fax
              AND LEFT.prim_range=RIGHT.prim_range AND LEFT.predir=RIGHT.predir AND LEFT.prim_name=RIGHT.prim_name AND LEFT.addr_suffix=RIGHT.addr_suffix AND LEFT.postdir=RIGHT.postdir AND LEFT.unit_desig=RIGHT.unit_desig AND LEFT.sec_range=RIGHT.sec_range AND LEFT.p_city_name=RIGHT.p_city_name AND LEFT.v_city_name=RIGHT.v_city_name AND LEFT.st=RIGHT.st
              AND LEFT.zip=RIGHT.zip AND LEFT.zip4=RIGHT.zip4 AND LEFT.cart=RIGHT.cart AND LEFT.cr_sort_sz=RIGHT.cr_sort_sz AND LEFT.lot=RIGHT.lot AND LEFT.lot_order=RIGHT.lot_order AND LEFT.dbpc=RIGHT.dbpc AND LEFT.chk_digit=RIGHT.chk_digit AND LEFT.rec_type=RIGHT.rec_type AND LEFT.county=RIGHT.county
              AND LEFT.geo_lat=RIGHT.geo_lat AND LEFT.geo_long=RIGHT.geo_long AND LEFT.msa=RIGHT.msa AND LEFT.geo_blk=RIGHT.geo_blk AND LEFT.geo_match=RIGHT.geo_match AND LEFT.err_stat=RIGHT.err_stat AND LEFT.phone=RIGHT.phone AND LEFT.did=RIGHT.did AND LEFT.bdid=RIGHT.bdid AND LEFT.app_ssn=RIGHT.app_ssn
              AND LEFT.app_tax_id=RIGHT.app_tax_id AND LEFT.date_first_seen=RIGHT.date_first_seen AND LEFT.date_last_seen=RIGHT.date_last_seen AND LEFT.date_vendor_first_reported=RIGHT.date_vendor_first_reported AND LEFT.date_vendor_last_reported=RIGHT.date_vendor_last_reported AND LEFT.disptypedesc=RIGHT.disptypedesc AND LEFT.srcdesc=RIGHT.srcdesc AND LEFT.srcmtchdesc=RIGHT.srcmtchdesc AND LEFT.screendesc=RIGHT.screendesc AND LEFT.dcodedesc=RIGHT.dcodedesc
              AND LEFT.date_filed=RIGHT.date_filed AND LEFT.record_type=RIGHT.record_type AND LEFT.delete_flag=RIGHT.delete_flag AND LEFT.dotid=RIGHT.dotid AND LEFT.dotscore=RIGHT.dotscore AND LEFT.dotweight=RIGHT.dotweight AND LEFT.empid=RIGHT.empid AND LEFT.empscore=RIGHT.empscore AND LEFT.empweight=RIGHT.empweight AND LEFT.powid=RIGHT.powid
              AND LEFT.powscore=RIGHT.powscore AND LEFT.powweight=RIGHT.powweight AND LEFT.proxid=RIGHT.proxid AND LEFT.proxscore=RIGHT.proxscore AND LEFT.proxweight=RIGHT.proxweight AND LEFT.seleid=RIGHT.seleid AND LEFT.selescore=RIGHT.selescore AND LEFT.seleweight=RIGHT.seleweight AND LEFT.orgid=RIGHT.orgid AND LEFT.orgscore=RIGHT.orgscore
              AND LEFT.orgweight=RIGHT.orgweight AND LEFT.ultid=RIGHT.ultid AND LEFT.ultscore=RIGHT.ultscore AND LEFT.ultweight=RIGHT.ultweight AND LEFT.source_rec_id=RIGHT.source_rec_id AND LEFT.scrubsbits1=RIGHT.scrubsbits1 AND LEFT.vault_date_first_seen=RIGHT.vault_date_first_seen AND LEFT.vault_date_last_seen=RIGHT.vault_date_last_seen,MergeData(LEFT,RIGHT),FULL OUTER,HASH);
  WithRT MergeData1(WithRT le, WithRT ri) := TRANSFORM // old, updated, new
    SELF.vault_date_first_seen := MAP (le.__Tpe = 0 => ri.vault_date_first_seen,ri.__Tpe = 0 => le.vault_date_first_seen,le.vault_date_first_seen<ri.vault_date_first_seen => le.vault_date_first_seen,ri.vault_date_first_seen);
    SELF.__Tpe := MAP (le.__Tpe = 0 => ri.__Tpe,ri.__Tpe = 0 => le.__Tpe,RecordType.Updated);
    SELF := IF( le.__Tpe=0,ri,le);
  END;
 
  // Ingest1: Merge Open Old with Open New to get old, updated, new
  Ingest1 := JOIN( Ingest0(__Tpe=RecordType.Old),Ingest0(__Tpe=RecordType.New),LEFT.vault_uid_hash=RIGHT.vault_uid_hash AND LEFT.process_date=RIGHT.process_date AND LEFT.caseid=RIGHT.caseid AND LEFT.defendantid=RIGHT.defendantid AND LEFT.recid=RIGHT.recid AND LEFT.tmsid=RIGHT.tmsid AND LEFT.seq_number=RIGHT.seq_number
              AND LEFT.court_code=RIGHT.court_code AND LEFT.case_number=RIGHT.case_number AND LEFT.orig_case_number=RIGHT.orig_case_number AND LEFT.chapter=RIGHT.chapter AND LEFT.filing_type=RIGHT.filing_type AND LEFT.business_flag=RIGHT.business_flag AND LEFT.corp_flag=RIGHT.corp_flag AND LEFT.discharged=RIGHT.discharged AND LEFT.disposition=RIGHT.disposition AND LEFT.pro_se_ind=RIGHT.pro_se_ind
              AND LEFT.converted_date=RIGHT.converted_date AND LEFT.orig_county=RIGHT.orig_county AND LEFT.debtor_type=RIGHT.debtor_type AND LEFT.debtor_seq=RIGHT.debtor_seq AND LEFT.ssn=RIGHT.ssn AND LEFT.ssnsrc=RIGHT.ssnsrc AND LEFT.ssnmatch=RIGHT.ssnmatch AND LEFT.ssnmsrc=RIGHT.ssnmsrc AND LEFT.screen=RIGHT.screen AND LEFT.dcode=RIGHT.dcode
              AND LEFT.disptype=RIGHT.disptype AND LEFT.dispreason=RIGHT.dispreason AND LEFT.statusdate=RIGHT.statusdate AND LEFT.holdcase=RIGHT.holdcase AND LEFT.datevacated=RIGHT.datevacated AND LEFT.datetransferred=RIGHT.datetransferred AND LEFT.activityreceipt=RIGHT.activityreceipt AND LEFT.tax_id=RIGHT.tax_id AND LEFT.name_type=RIGHT.name_type AND LEFT.orig_name=RIGHT.orig_name
              AND LEFT.orig_fname=RIGHT.orig_fname AND LEFT.orig_mname=RIGHT.orig_mname AND LEFT.orig_lname=RIGHT.orig_lname AND LEFT.orig_name_suffix=RIGHT.orig_name_suffix AND LEFT.title=RIGHT.title AND LEFT.fname=RIGHT.fname AND LEFT.mname=RIGHT.mname AND LEFT.lname=RIGHT.lname AND LEFT.name_suffix=RIGHT.name_suffix AND LEFT.name_score=RIGHT.name_score
              AND LEFT.cname=RIGHT.cname AND LEFT.orig_company=RIGHT.orig_company AND LEFT.orig_addr1=RIGHT.orig_addr1 AND LEFT.orig_addr2=RIGHT.orig_addr2 AND LEFT.orig_city=RIGHT.orig_city AND LEFT.orig_st=RIGHT.orig_st AND LEFT.orig_zip5=RIGHT.orig_zip5 AND LEFT.orig_zip4=RIGHT.orig_zip4 AND LEFT.orig_email=RIGHT.orig_email AND LEFT.orig_fax=RIGHT.orig_fax
              AND LEFT.prim_range=RIGHT.prim_range AND LEFT.predir=RIGHT.predir AND LEFT.prim_name=RIGHT.prim_name AND LEFT.addr_suffix=RIGHT.addr_suffix AND LEFT.postdir=RIGHT.postdir AND LEFT.unit_desig=RIGHT.unit_desig AND LEFT.sec_range=RIGHT.sec_range AND LEFT.p_city_name=RIGHT.p_city_name AND LEFT.v_city_name=RIGHT.v_city_name AND LEFT.st=RIGHT.st
              AND LEFT.zip=RIGHT.zip AND LEFT.zip4=RIGHT.zip4 AND LEFT.cart=RIGHT.cart AND LEFT.cr_sort_sz=RIGHT.cr_sort_sz AND LEFT.lot=RIGHT.lot AND LEFT.lot_order=RIGHT.lot_order AND LEFT.dbpc=RIGHT.dbpc AND LEFT.chk_digit=RIGHT.chk_digit AND LEFT.rec_type=RIGHT.rec_type AND LEFT.county=RIGHT.county
              AND LEFT.geo_lat=RIGHT.geo_lat AND LEFT.geo_long=RIGHT.geo_long AND LEFT.msa=RIGHT.msa AND LEFT.geo_blk=RIGHT.geo_blk AND LEFT.geo_match=RIGHT.geo_match AND LEFT.err_stat=RIGHT.err_stat AND LEFT.phone=RIGHT.phone AND LEFT.did=RIGHT.did AND LEFT.bdid=RIGHT.bdid AND LEFT.app_ssn=RIGHT.app_ssn
              AND LEFT.app_tax_id=RIGHT.app_tax_id AND LEFT.date_first_seen=RIGHT.date_first_seen AND LEFT.date_last_seen=RIGHT.date_last_seen AND LEFT.date_vendor_first_reported=RIGHT.date_vendor_first_reported AND LEFT.date_vendor_last_reported=RIGHT.date_vendor_last_reported AND LEFT.disptypedesc=RIGHT.disptypedesc AND LEFT.srcdesc=RIGHT.srcdesc AND LEFT.srcmtchdesc=RIGHT.srcmtchdesc AND LEFT.screendesc=RIGHT.screendesc AND LEFT.dcodedesc=RIGHT.dcodedesc
              AND LEFT.date_filed=RIGHT.date_filed AND LEFT.record_type=RIGHT.record_type AND LEFT.delete_flag=RIGHT.delete_flag AND LEFT.dotid=RIGHT.dotid AND LEFT.dotscore=RIGHT.dotscore AND LEFT.dotweight=RIGHT.dotweight AND LEFT.empid=RIGHT.empid AND LEFT.empscore=RIGHT.empscore AND LEFT.empweight=RIGHT.empweight AND LEFT.powid=RIGHT.powid
              AND LEFT.powscore=RIGHT.powscore AND LEFT.powweight=RIGHT.powweight AND LEFT.proxid=RIGHT.proxid AND LEFT.proxscore=RIGHT.proxscore AND LEFT.proxweight=RIGHT.proxweight AND LEFT.seleid=RIGHT.seleid AND LEFT.selescore=RIGHT.selescore AND LEFT.seleweight=RIGHT.seleweight AND LEFT.orgid=RIGHT.orgid AND LEFT.orgscore=RIGHT.orgscore
              AND LEFT.orgweight=RIGHT.orgweight AND LEFT.ultid=RIGHT.ultid AND LEFT.ultscore=RIGHT.ultscore AND LEFT.ultweight=RIGHT.ultweight AND LEFT.source_rec_id=RIGHT.source_rec_id AND LEFT.scrubsbits1=RIGHT.scrubsbits1 AND LEFT.vault_date_last_seen=0 AND RIGHT.vault_date_last_seen=0,MergeData1(LEFT,RIGHT),FULL OUTER,HASH);
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
  SHARED AllRecs := ORe+NR1+NR(vault_rid<>0) : PERSIST('~temp::I_Bankruptcy_Search::Ingest_Cache',EXPIRE(I_Bankruptcy_Search.Config.PersistExpire));
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
