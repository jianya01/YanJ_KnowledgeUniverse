// Machine-readable versions of the spec file and subsets thereof
IMPORT SALT311;
EXPORT GenerationMod := MODULE(SALT311.iGenerationMod)
 
  // SALT Version info
  EXPORT salt_VERSION := 'V3.11.2';
  EXPORT salt_MODULE := 'SALT311'; // Optional override by HACK:SALTMODULE
  EXPORT salt_TOOLSMODULE := 'SALTTOOLS30'; // Optional override by HACK:SALTTOOLSMODULE
 
  // Core module configuration values
  EXPORT spc_MODULE := 'I_gong_history_fcra_phone';
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
  EXPORT spc_EXTERNAL_BATCH_PARAM := ',/* MY_ */,vault_date_first_seen,vault_date_last_seen,vault_uid_hash,p7,p3,st,current_flag,business_flag,src,listing_type_bus,listing_type_res,listing_type_gov,publish_code,prior_area_code,phone10,prim_range,predir,prim_name,suffix,postdir,unit_desig,sec_range,p_city_name,v_predir,v_prim_name,v_suffix,v_postdir,v_city_name,z5,z4,county_code,geo_lat,geo_long,msa,designation,name_prefix,name_first,name_middle,name_last,name_suffix,listed_name,caption_text,omit_address,omit_phone,omit_locality,see_also_text,did,hhid,bdid,dt_first_seen,dt_last_seen,current_record_flag,deletion_date,disc_cnt6,disc_cnt12,disc_cnt18,persistent_record_id,phone7,area_code,__internal_fpos__';
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
    + 'MODULE:I_gong_history_fcra_phone\n'
    + 'FILENAME:Vault\n'
    + 'INGESTFILE:OFPU:NAMED(Source)\n'
    + 'RIDFIELD:vault_rid\n'
    + 'SOURCERIDFIELD:vault_uid_hash\n'
    + 'FIELD:vault_date_first_seen:RECORDDATE(FIRST):\n'
    + 'FIELD:vault_date_last_seen:RECORDDATE(LAST):\n'
    + 'INGESTMODE:NONCONTIGUOUS(vault_date_first_seen,vault_date_last_seen)\n'
    + '\n'
    + 'FIELD:vault_uid_hash:TYPE(DATA16):0,0\n'
    + 'FIELD:p7:TYPE(STRING7):0,0\n'
    + 'FIELD:p3:TYPE(STRING3):0,0\n'
    + 'FIELD:st:TYPE(STRING2):0,0\n'
    + 'FIELD:current_flag:TYPE(BOOLEAN1):0,0\n'
    + 'FIELD:business_flag:TYPE(BOOLEAN1):0,0\n'
    + 'FIELD:src:TYPE(STRING2):0,0\n'
    + 'FIELD:listing_type_bus:TYPE(STRING1):0,0\n'
    + 'FIELD:listing_type_res:TYPE(STRING1):0,0\n'
    + 'FIELD:listing_type_gov:TYPE(STRING1):0,0\n'
    + 'FIELD:publish_code:TYPE(STRING1):0,0\n'
    + 'FIELD:prior_area_code:TYPE(STRING3):0,0\n'
    + 'FIELD:phone10:TYPE(STRING10):0,0\n'
    + 'FIELD:prim_range:TYPE(STRING10):0,0\n'
    + 'FIELD:predir:TYPE(STRING2):0,0\n'
    + 'FIELD:prim_name:TYPE(STRING28):0,0\n'
    + 'FIELD:suffix:TYPE(STRING4):0,0\n'
    + 'FIELD:postdir:TYPE(STRING2):0,0\n'
    + 'FIELD:unit_desig:TYPE(STRING10):0,0\n'
    + 'FIELD:sec_range:TYPE(STRING8):0,0\n'
    + 'FIELD:p_city_name:TYPE(STRING25):0,0\n'
    + 'FIELD:v_predir:TYPE(STRING2):0,0\n'
    + 'FIELD:v_prim_name:TYPE(STRING28):0,0\n'
    + 'FIELD:v_suffix:TYPE(STRING4):0,0\n'
    + 'FIELD:v_postdir:TYPE(STRING2):0,0\n'
    + 'FIELD:v_city_name:TYPE(STRING25):0,0\n'
    + 'FIELD:z5:TYPE(STRING5):0,0\n'
    + 'FIELD:z4:TYPE(STRING4):0,0\n'
    + 'FIELD:county_code:TYPE(STRING5):0,0\n'
    + 'FIELD:geo_lat:TYPE(STRING10):0,0\n'
    + 'FIELD:geo_long:TYPE(STRING11):0,0\n'
    + 'FIELD:msa:TYPE(STRING4):0,0\n'
    + 'FIELD:designation:TYPE(STRING32):0,0\n'
    + 'FIELD:name_prefix:TYPE(STRING5):0,0\n'
    + 'FIELD:name_first:TYPE(STRING20):0,0\n'
    + 'FIELD:name_middle:TYPE(STRING20):0,0\n'
    + 'FIELD:name_last:TYPE(STRING20):0,0\n'
    + 'FIELD:name_suffix:TYPE(STRING5):0,0\n'
    + 'FIELD:listed_name:TYPE(STRING120):0,0\n'
    + 'FIELD:caption_text:TYPE(STRING254):0,0\n'
    + 'FIELD:omit_address:TYPE(STRING1):0,0\n'
    + 'FIELD:omit_phone:TYPE(STRING1):0,0\n'
    + 'FIELD:omit_locality:TYPE(STRING1):0,0\n'
    + 'FIELD:see_also_text:TYPE(STRING64):0,0\n'
    + 'FIELD:did:TYPE(UNSIGNED6):0,0\n'
    + 'FIELD:hhid:TYPE(UNSIGNED6):0,0\n'
    + 'FIELD:bdid:TYPE(UNSIGNED6):0,0\n'
    + 'FIELD:dt_first_seen:TYPE(STRING8):0,0\n'
    + 'FIELD:dt_last_seen:TYPE(STRING8):0,0\n'
    + 'FIELD:current_record_flag:TYPE(STRING1):0,0\n'
    + 'FIELD:deletion_date:TYPE(STRING8):0,0\n'
    + 'FIELD:disc_cnt6:TYPE(UNSIGNED2):0,0\n'
    + 'FIELD:disc_cnt12:TYPE(UNSIGNED2):0,0\n'
    + 'FIELD:disc_cnt18:TYPE(UNSIGNED2):0,0\n'
    + 'FIELD:persistent_record_id:TYPE(UNSIGNED8):0,0\n'
    + 'FIELD:phone7:TYPE(STRING7):0,0\n'
    + 'FIELD:area_code:TYPE(STRING3):0,0\n'
    + 'FIELD:__internal_fpos__:TYPE(UNSIGNED8):0,0\n'
    ;
 
  // Structured values
  EXPORT linkpaths := DATASET([
    ],{STRING linkpath;STRING compulsory;STRING optional;STRING bonus;STRING required;STRING search});
 
END;

