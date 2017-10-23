IMPORT STD,SALT38;
EXPORT Ingest(BOOLEAN CloseOlds = FALSE, DATASET(Layout_Vault) dsBase = In_Vault // Change IN_Vault to change input to ingest process
, DATASET(RECORDOF(Vault_Source))  infile = Vault_Source
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
  Ingest0 := JOIN( Base0,FilesToIngest0,LEFT.vault_uid_hash=RIGHT.vault_uid_hash AND LEFT.lexid=RIGHT.lexid AND LEFT.receive_date=RIGHT.receive_date AND LEFT.recordid=RIGHT.recordid AND LEFT.email=RIGHT.email AND LEFT.first_name=RIGHT.first_name AND LEFT.last_name=RIGHT.last_name
              AND LEFT.suffix=RIGHT.suffix AND LEFT.delivery_address=RIGHT.delivery_address AND LEFT.delivery_address2=RIGHT.delivery_address2 AND LEFT.city_address=RIGHT.city_address AND LEFT.state=RIGHT.state AND LEFT.zip_code=RIGHT.zip_code AND LEFT.plus4=RIGHT.plus4 AND LEFT.phone=RIGHT.phone AND LEFT.cell_phone=RIGHT.cell_phone AND LEFT.dob=RIGHT.dob
              AND LEFT.gender=RIGHT.gender AND LEFT.use=RIGHT.use AND LEFT.cigbrand=RIGHT.cigbrand AND LEFT.ciglength=RIGHT.ciglength AND LEFT.purchasecigs=RIGHT.purchasecigs AND LEFT.usual_brand=RIGHT.usual_brand AND LEFT.amtbrandpurchase=RIGHT.amtbrandpurchase AND LEFT.brandunavailable=RIGHT.brandunavailable AND LEFT.second_brand=RIGHT.second_brand AND LEFT.smokeless_brand=RIGHT.smokeless_brand
              AND LEFT.smokeless_style=RIGHT.smokeless_style AND LEFT.smokeless_flavor=RIGHT.smokeless_flavor AND LEFT.cigar_brand=RIGHT.cigar_brand AND LEFT.ip=RIGHT.ip AND LEFT.cigtype=RIGHT.cigtype AND LEFT.source=RIGHT.source AND LEFT.estimated_income=RIGHT.estimated_income AND LEFT.net_worth=RIGHT.net_worth AND LEFT.ownership_rent=RIGHT.ownership_rent AND LEFT.clean_fname=RIGHT.clean_fname
              AND LEFT.clean_lname=RIGHT.clean_lname AND LEFT.clean_sname=RIGHT.clean_sname AND LEFT.address_id=RIGHT.address_id AND LEFT.prim_range=RIGHT.prim_range AND LEFT.predir=RIGHT.predir AND LEFT.prim_name=RIGHT.prim_name AND LEFT.addr_suffix=RIGHT.addr_suffix AND LEFT.postdir=RIGHT.postdir AND LEFT.unit_desig=RIGHT.unit_desig AND LEFT.sec_range=RIGHT.sec_range
              AND LEFT.city=RIGHT.city AND LEFT.st=RIGHT.st AND LEFT.zip=RIGHT.zip AND LEFT.zip4=RIGHT.zip4 AND LEFT.cart=RIGHT.cart AND LEFT.cr_sort_sz=RIGHT.cr_sort_sz AND LEFT.lot=RIGHT.lot AND LEFT.lot_order=RIGHT.lot_order AND LEFT.dbpc=RIGHT.dbpc AND LEFT.chk_digit=RIGHT.chk_digit
              AND LEFT.rec_type=RIGHT.rec_type AND LEFT.fips_state=RIGHT.fips_state AND LEFT.fips_county=RIGHT.fips_county AND LEFT.geo_lat=RIGHT.geo_lat AND LEFT.geo_long=RIGHT.geo_long AND LEFT.msa=RIGHT.msa AND LEFT.geo_blk=RIGHT.geo_blk AND LEFT.geo_match=RIGHT.geo_match AND LEFT.error_code=RIGHT.error_code AND LEFT.vault_date_first_seen=RIGHT.vault_date_first_seen AND LEFT.vault_date_last_seen=RIGHT.vault_date_last_seen,MergeData(LEFT,RIGHT),FULL OUTER,HASH);
  WithRT MergeData1(WithRT le, WithRT ri) := TRANSFORM // old, updated, new
    SELF.vault_date_first_seen := MAP (le.__Tpe = 0 => ri.vault_date_first_seen,ri.__Tpe = 0 => le.vault_date_first_seen,le.vault_date_first_seen<ri.vault_date_first_seen => le.vault_date_first_seen,ri.vault_date_first_seen);
    SELF.__Tpe := MAP (le.__Tpe = 0 => ri.__Tpe,ri.__Tpe = 0 => le.__Tpe,RecordType.Updated);
    SELF := IF( le.__Tpe=0,ri,le);
  END;
 
  // Ingest1: Merge Open Old with Open New to get old, updated, new
  Ingest1 := JOIN( Ingest0(__Tpe=RecordType.Old),Ingest0(__Tpe=RecordType.New),LEFT.vault_uid_hash=RIGHT.vault_uid_hash AND LEFT.lexid=RIGHT.lexid AND LEFT.receive_date=RIGHT.receive_date AND LEFT.recordid=RIGHT.recordid AND LEFT.email=RIGHT.email AND LEFT.first_name=RIGHT.first_name AND LEFT.last_name=RIGHT.last_name
              AND LEFT.suffix=RIGHT.suffix AND LEFT.delivery_address=RIGHT.delivery_address AND LEFT.delivery_address2=RIGHT.delivery_address2 AND LEFT.city_address=RIGHT.city_address AND LEFT.state=RIGHT.state AND LEFT.zip_code=RIGHT.zip_code AND LEFT.plus4=RIGHT.plus4 AND LEFT.phone=RIGHT.phone AND LEFT.cell_phone=RIGHT.cell_phone AND LEFT.dob=RIGHT.dob
              AND LEFT.gender=RIGHT.gender AND LEFT.use=RIGHT.use AND LEFT.cigbrand=RIGHT.cigbrand AND LEFT.ciglength=RIGHT.ciglength AND LEFT.purchasecigs=RIGHT.purchasecigs AND LEFT.usual_brand=RIGHT.usual_brand AND LEFT.amtbrandpurchase=RIGHT.amtbrandpurchase AND LEFT.brandunavailable=RIGHT.brandunavailable AND LEFT.second_brand=RIGHT.second_brand AND LEFT.smokeless_brand=RIGHT.smokeless_brand
              AND LEFT.smokeless_style=RIGHT.smokeless_style AND LEFT.smokeless_flavor=RIGHT.smokeless_flavor AND LEFT.cigar_brand=RIGHT.cigar_brand AND LEFT.ip=RIGHT.ip AND LEFT.cigtype=RIGHT.cigtype AND LEFT.source=RIGHT.source AND LEFT.estimated_income=RIGHT.estimated_income AND LEFT.net_worth=RIGHT.net_worth AND LEFT.ownership_rent=RIGHT.ownership_rent AND LEFT.clean_fname=RIGHT.clean_fname
              AND LEFT.clean_lname=RIGHT.clean_lname AND LEFT.clean_sname=RIGHT.clean_sname AND LEFT.address_id=RIGHT.address_id AND LEFT.prim_range=RIGHT.prim_range AND LEFT.predir=RIGHT.predir AND LEFT.prim_name=RIGHT.prim_name AND LEFT.addr_suffix=RIGHT.addr_suffix AND LEFT.postdir=RIGHT.postdir AND LEFT.unit_desig=RIGHT.unit_desig AND LEFT.sec_range=RIGHT.sec_range
              AND LEFT.city=RIGHT.city AND LEFT.st=RIGHT.st AND LEFT.zip=RIGHT.zip AND LEFT.zip4=RIGHT.zip4 AND LEFT.cart=RIGHT.cart AND LEFT.cr_sort_sz=RIGHT.cr_sort_sz AND LEFT.lot=RIGHT.lot AND LEFT.lot_order=RIGHT.lot_order AND LEFT.dbpc=RIGHT.dbpc AND LEFT.chk_digit=RIGHT.chk_digit
              AND LEFT.rec_type=RIGHT.rec_type AND LEFT.fips_state=RIGHT.fips_state AND LEFT.fips_county=RIGHT.fips_county AND LEFT.geo_lat=RIGHT.geo_lat AND LEFT.geo_long=RIGHT.geo_long AND LEFT.msa=RIGHT.msa AND LEFT.geo_blk=RIGHT.geo_blk AND LEFT.geo_match=RIGHT.geo_match AND LEFT.error_code=RIGHT.error_code AND LEFT.vault_date_last_seen=0 AND RIGHT.vault_date_last_seen=0,MergeData1(LEFT,RIGHT),FULL OUTER,HASH);
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
  SHARED AllRecs := ORe+NR1+NR(vault_rid<>0) : PERSIST('~temp::I_Tobacco_MediaOne::Ingest_Cache',EXPIRE(I_Tobacco_MediaOne.Config.PersistExpire));
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
