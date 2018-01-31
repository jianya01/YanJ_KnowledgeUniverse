// Machine-readable versions of the spec file and subsets thereof
IMPORT SALT39;
EXPORT GenerationMod := MODULE(SALT39.iGenerationMod)
 
  // SALT Version info
  EXPORT salt_VERSION := 'V3.9.0';
  EXPORT salt_MODULE := 'SALT39'; // Optional override by HACK:SALTMODULE
  EXPORT salt_TOOLSMODULE := 'SALTTOOLS30'; // Optional override by HACK:SALTTOOLSMODULE
 
  // Core module configuration values
  EXPORT spc_MODULE := 'I_Tobacco_Vente';
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
  EXPORT spc_EXTERNAL_BATCH_PARAM := ',/* MY_ */,vault_date_first_seen,vault_date_last_seen,vault_uid_hash,lexid,receive_date,member_id,fname,lname,street,city_address,state,zip_code,zip_code4,dob,last_reg_date,isasmoker,sourcerid,name_id,clean_fname,clean_lname,clean_sname,address_id,prim_range,predir,prim_name,addr_suffix,postdir,unit_desig,sec_range,city,st,zip,zip4,cart,cr_sort_sz,lot,lot_order,dbpc,chk_digit,rec_type,fips_state,fips_county,geo_lat,geo_long,msa,geo_blk,geo_match,error_code';
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
    + 'MODULE:I_Tobacco_Vente\n'
    + 'FILENAME:Vault\n'
    + 'INGESTFILE:OFPU:NAMED(Source)\n'
    + 'RIDFIELD:vault_rid\n'
    + 'SOURCERIDFIELD:vault_UID_Hash\n'
    + 'FIELD:vault_date_first_seen:RECORDDATE(FIRST):\n'
    + 'FIELD:vault_date_last_seen:RECORDDATE(LAST):\n'
    + 'INGESTMODE:NONCONTIGUOUS(vault_date_first_seen,vault_date_last_seen)\n'
    + '\n'
    + '\n'
    + 'FIELD:vault_uid_hash:TYPE(DATA16):0,0\n'
    + 'FIELD:lexid:TYPE(UNSIGNED8):0,0\n'
    + 'FIELD:receive_date:TYPE(STRING10):0,0\n'
    + 'FIELD:member_id:TYPE(STRING):0,0\n'
    + 'FIELD:fname:TYPE(STRING):0,0\n'
    + 'FIELD:lname:TYPE(STRING):0,0\n'
    + 'FIELD:street:TYPE(STRING):0,0\n'
    + 'FIELD:city_address:TYPE(STRING):0,0\n'
    + 'FIELD:state:TYPE(STRING):0,0\n'
    + 'FIELD:zip_code:TYPE(STRING):0,0\n'
    + 'FIELD:zip_code4:TYPE(STRING):0,0\n'
    + 'FIELD:dob:TYPE(STRING):0,0\n'
    + 'FIELD:last_reg_date:TYPE(STRING):0,0\n'
    + 'FIELD:isasmoker:TYPE(STRING):0,0\n'
    + 'FIELD:sourcerid:TYPE(UNSIGNED8):0,0\n'
    + 'FIELD:name_id:TYPE(UNSIGNED8):0,0\n'
    + 'FIELD:clean_fname:TYPE(STRING20):0,0\n'
    + 'FIELD:clean_lname:TYPE(STRING20):0,0\n'
    + 'FIELD:clean_sname:TYPE(STRING25):0,0\n'
    + 'FIELD:address_id:TYPE(UNSIGNED8):0,0\n'
    + 'FIELD:prim_range:TYPE(STRING10):0,0\n'
    + 'FIELD:predir:TYPE(STRING2):0,0\n'
    + 'FIELD:prim_name:TYPE(STRING28):0,0\n'
    + 'FIELD:addr_suffix:TYPE(STRING4):0,0\n'
    + 'FIELD:postdir:TYPE(STRING2):0,0\n'
    + 'FIELD:unit_desig:TYPE(STRING10):0,0\n'
    + 'FIELD:sec_range:TYPE(STRING8):0,0\n'
    + 'FIELD:city:TYPE(STRING20):0,0\n'
    + 'FIELD:st:TYPE(STRING2):0,0\n'
    + 'FIELD:zip:TYPE(STRING5):0,0\n'
    + 'FIELD:zip4:TYPE(STRING4):0,0\n'
    + 'FIELD:cart:TYPE(STRING4):0,0\n'
    + 'FIELD:cr_sort_sz:TYPE(STRING1):0,0\n'
    + 'FIELD:lot:TYPE(STRING4):0,0\n'
    + 'FIELD:lot_order:TYPE(STRING1):0,0\n'
    + 'FIELD:dbpc:TYPE(STRING2):0,0\n'
    + 'FIELD:chk_digit:TYPE(STRING1):0,0\n'
    + 'FIELD:rec_type:TYPE(STRING2):0,0\n'
    + 'FIELD:fips_state:TYPE(STRING2):0,0\n'
    + 'FIELD:fips_county:TYPE(STRING3):0,0\n'
    + 'FIELD:geo_lat:TYPE(STRING10):0,0\n'
    + 'FIELD:geo_long:TYPE(STRING11):0,0\n'
    + 'FIELD:msa:TYPE(STRING4):0,0\n'
    + 'FIELD:geo_blk:TYPE(STRING7):0,0\n'
    + 'FIELD:geo_match:TYPE(STRING1):0,0\n'
    + 'FIELD:error_code:TYPE(STRING4):0,0\n'
    + '\n'
    ;
 
  // Structured values
  EXPORT linkpaths := DATASET([
    ],{STRING linkpath;STRING compulsory;STRING optional;STRING bonus;STRING required;STRING search});
 
END;

