// Machine-readable versions of the spec file and subsets thereof
IMPORT SALT311;
EXPORT GenerationMod := MODULE(SALT311.iGenerationMod)
 
  // SALT Version info
  EXPORT salt_VERSION := 'V3.11.2';
  EXPORT salt_MODULE := 'SALT311'; // Optional override by HACK:SALTMODULE
  EXPORT salt_TOOLSMODULE := 'SALTTOOLS30'; // Optional override by HACK:SALTTOOLSMODULE
 
  // Core module configuration values
  EXPORT spc_MODULE := 'I_faa_fcra_aircraft_id_qa';
  EXPORT spc_NAMESCOPE := '';
  EXPORT spc_PROCESS := '';
  EXPORT spc_PROCLAYOUTS := 'Process__Layouts';
  EXPORT spc_IDNAME := ''; // cluster id (input)
  EXPORT spc_IDFIELD := ''; // cluster id (output)
  EXPORT spc_RIDFIELD := 'vault_rid'; // record id
  EXPORT spc_CONFIG := 'Config';
  EXPORT spc_CONFIGPARAM := FALSE;
  EXPORT spc_SOURCEFIELD := '';
  EXPORT spc_FILEPREFIX := 'In_';
  EXPORT spc_FILENAME := 'Vault';
  EXPORT spc_INGESTSTATUS := '';
  EXPORT spc_EXTERNAL_MAPPING := 'UniqueID:vault_rid';
  EXPORT spc_EXTERNAL_BATCH_PARAM := ',/* MY_ */,vault_date_first_seen,vault_date_last_seen,vault_uid_hash,aircraft_id,d_score,best_ssn,did_out,bdid_out,date_first_seen,date_last_seen,current_flag,n_number,serial_number,mfr_mdl_code,eng_mfr_mdl,year_mfr,type_registrant,name,street,street2,city,state,zip_code,region,orig_county,country,last_action_date,cert_issue_date,certification,type_aircraft,type_engine,status_code,mode_s_code,fract_owner,aircraft_mfr_name,model_name,prim_range,predir,prim_name,addr_suffix,postdir,unit_desig,sec_range,p_city_name,v_city_name,st,zip,z4,cart,cr_sort_sz,lot,lot_order,dpbc,chk_digit,rec_type,ace_fips_st,county,geo_lat,geo_long,msa,geo_blk,geo_match,err_stat,title,fname,mname,lname,name_suffix,compname,persistent_record_id,dotid,dotscore,dotweight,empid,empscore,empweight,powid,powscore,powweight,proxid,proxscore,proxweight,seleid,selescore,seleweight,orgid,orgscore,orgweight,ultid,ultscore,ultweight';
  EXPORT spc_HAS_TWOSTEP := FALSE;
  EXPORT spc_HAS_PARTITION := FALSE;
  EXPORT spc_HAS_FIELDTYPES := FALSE;
  EXPORT spc_HAS_INCREMENTAL := FALSE;
  EXPORT spc_HAS_ASOF := FALSE;
  EXPORT spc_HAS_NONCONTIGUOUS := TRUE;
  EXPORT spc_HAS_SUPERFILES := FALSE;
  EXPORT spc_HAS_CONSISTENT := FALSE;
  EXPORT spc_HAS_EXTERNAL := FALSE;
  EXPORT spc_HAS_PARENTS := FALSE;
  EXPORT spc_HAS_FORCE := FALSE;
  EXPORT spc_HAS_BLOCKLINK := FALSE;
 
  // The entire spec file
  EXPORT spcString :=
    'OPTIONS:-gn\n'
    + 'MODULE:I_faa_fcra_aircraft_id_qa\n'
    + 'FILENAME:Vault\n'
    + 'INGESTFILE:OFPU:NAMED(Source)\n'
    + 'RIDFIELD:vault_rid\n'
    + 'SOURCERIDFIELD:vault_uid_hash\n'
    + 'FIELD:vault_date_first_seen:RECORDDATE(FIRST):\n'
    + 'FIELD:vault_date_last_seen:RECORDDATE(LAST):\n'
    + 'INGESTMODE:NONCONTIGUOUS(vault_date_first_seen,vault_date_last_seen)\n'
    + '\n'
    + 'FIELD:vault_uid_hash:TYPE(DATA16):0,0\n'
    + 'FIELD:aircraft_id:TYPE(UNSIGNED6):0,0\n'
    + 'FIELD:d_score:TYPE(STRING3):0,0\n'
    + 'FIELD:best_ssn:TYPE(STRING9):0,0\n'
    + 'FIELD:did_out:TYPE(STRING12):0,0\n'
    + 'FIELD:bdid_out:TYPE(STRING12):0,0\n'
    + 'FIELD:date_first_seen:TYPE(STRING8):0,0\n'
    + 'FIELD:date_last_seen:TYPE(STRING8):0,0\n'
    + 'FIELD:current_flag:TYPE(STRING1):0,0\n'
    + 'FIELD:n_number:TYPE(STRING8):0,0\n'
    + 'FIELD:serial_number:TYPE(STRING30):0,0\n'
    + 'FIELD:mfr_mdl_code:TYPE(STRING12):0,0\n'
    + 'FIELD:eng_mfr_mdl:TYPE(STRING11):0,0\n'
    + 'FIELD:year_mfr:TYPE(STRING8):0,0\n'
    + 'FIELD:type_registrant:TYPE(STRING15):0,0\n'
    + 'FIELD:name:TYPE(STRING50):0,0\n'
    + 'FIELD:street:TYPE(STRING33):0,0\n'
    + 'FIELD:street2:TYPE(STRING33):0,0\n'
    + 'FIELD:city:TYPE(STRING18):0,0\n'
    + 'FIELD:state:TYPE(STRING5):0,0\n'
    + 'FIELD:zip_code:TYPE(STRING10):0,0\n'
    + 'FIELD:region:TYPE(STRING6):0,0\n'
    + 'FIELD:orig_county:TYPE(STRING6):0,0\n'
    + 'FIELD:country:TYPE(STRING7):0,0\n'
    + 'FIELD:last_action_date:TYPE(STRING16):0,0\n'
    + 'FIELD:cert_issue_date:TYPE(STRING15):0,0\n'
    + 'FIELD:certification:TYPE(STRING13):0,0\n'
    + 'FIELD:type_aircraft:TYPE(STRING13):0,0\n'
    + 'FIELD:type_engine:TYPE(STRING11):0,0\n'
    + 'FIELD:status_code:TYPE(STRING11):0,0\n'
    + 'FIELD:mode_s_code:TYPE(STRING11):0,0\n'
    + 'FIELD:fract_owner:TYPE(STRING11):0,0\n'
    + 'FIELD:aircraft_mfr_name:TYPE(STRING30):0,0\n'
    + 'FIELD:model_name:TYPE(STRING20):0,0\n'
    + 'FIELD:prim_range:TYPE(STRING10):0,0\n'
    + 'FIELD:predir:TYPE(STRING2):0,0\n'
    + 'FIELD:prim_name:TYPE(STRING28):0,0\n'
    + 'FIELD:addr_suffix:TYPE(STRING4):0,0\n'
    + 'FIELD:postdir:TYPE(STRING2):0,0\n'
    + 'FIELD:unit_desig:TYPE(STRING10):0,0\n'
    + 'FIELD:sec_range:TYPE(STRING8):0,0\n'
    + 'FIELD:p_city_name:TYPE(STRING25):0,0\n'
    + 'FIELD:v_city_name:TYPE(STRING25):0,0\n'
    + 'FIELD:st:TYPE(STRING2):0,0\n'
    + 'FIELD:zip:TYPE(STRING5):0,0\n'
    + 'FIELD:z4:TYPE(STRING4):0,0\n'
    + 'FIELD:cart:TYPE(STRING4):0,0\n'
    + 'FIELD:cr_sort_sz:TYPE(STRING1):0,0\n'
    + 'FIELD:lot:TYPE(STRING4):0,0\n'
    + 'FIELD:lot_order:TYPE(STRING1):0,0\n'
    + 'FIELD:dpbc:TYPE(STRING2):0,0\n'
    + 'FIELD:chk_digit:TYPE(STRING1):0,0\n'
    + 'FIELD:rec_type:TYPE(STRING2):0,0\n'
    + 'FIELD:ace_fips_st:TYPE(STRING2):0,0\n'
    + 'FIELD:county:TYPE(STRING3):0,0\n'
    + 'FIELD:geo_lat:TYPE(STRING10):0,0\n'
    + 'FIELD:geo_long:TYPE(STRING11):0,0\n'
    + 'FIELD:msa:TYPE(STRING4):0,0\n'
    + 'FIELD:geo_blk:TYPE(STRING7):0,0\n'
    + 'FIELD:geo_match:TYPE(STRING1):0,0\n'
    + 'FIELD:err_stat:TYPE(STRING4):0,0\n'
    + 'FIELD:title:TYPE(STRING5):0,0\n'
    + 'FIELD:fname:TYPE(STRING20):0,0\n'
    + 'FIELD:mname:TYPE(STRING20):0,0\n'
    + 'FIELD:lname:TYPE(STRING20):0,0\n'
    + 'FIELD:name_suffix:TYPE(STRING5):0,0\n'
    + 'FIELD:compname:TYPE(STRING50):0,0\n'
    + 'FIELD:persistent_record_id:TYPE(UNSIGNED8):0,0\n'
    + 'FIELD:dotid:TYPE(UNSIGNED6):0,0\n'
    + 'FIELD:dotscore:TYPE(UNSIGNED2):0,0\n'
    + 'FIELD:dotweight:TYPE(UNSIGNED2):0,0\n'
    + 'FIELD:empid:TYPE(UNSIGNED6):0,0\n'
    + 'FIELD:empscore:TYPE(UNSIGNED2):0,0\n'
    + 'FIELD:empweight:TYPE(UNSIGNED2):0,0\n'
    + 'FIELD:powid:TYPE(UNSIGNED6):0,0\n'
    + 'FIELD:powscore:TYPE(UNSIGNED2):0,0\n'
    + 'FIELD:powweight:TYPE(UNSIGNED2):0,0\n'
    + 'FIELD:proxid:TYPE(UNSIGNED6):0,0\n'
    + 'FIELD:proxscore:TYPE(UNSIGNED2):0,0\n'
    + 'FIELD:proxweight:TYPE(UNSIGNED2):0,0\n'
    + 'FIELD:seleid:TYPE(UNSIGNED6):0,0\n'
    + 'FIELD:selescore:TYPE(UNSIGNED2):0,0\n'
    + 'FIELD:seleweight:TYPE(UNSIGNED2):0,0\n'
    + 'FIELD:orgid:TYPE(UNSIGNED6):0,0\n'
    + 'FIELD:orgscore:TYPE(UNSIGNED2):0,0\n'
    + 'FIELD:orgweight:TYPE(UNSIGNED2):0,0\n'
    + 'FIELD:ultid:TYPE(UNSIGNED6):0,0\n'
    + 'FIELD:ultscore:TYPE(UNSIGNED2):0,0\n'
    + 'FIELD:ultweight:TYPE(UNSIGNED2):0,0\n'
    + '\n'
    ;
 
  // Structured values
  EXPORT linkpaths := DATASET([
    ],{STRING linkpath;STRING compulsory;STRING optional;STRING bonus;STRING required;STRING search});
 
END;

