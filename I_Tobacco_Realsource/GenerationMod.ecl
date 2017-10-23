// Machine-readable versions of the spec file and subsets thereof
IMPORT SALT38;
EXPORT GenerationMod := MODULE(SALT38.iGenerationMod)
 
  // SALT Version info
  EXPORT salt_VERSION := 'V3.8.1';
  EXPORT salt_MODULE := 'SALT38'; // Optional override by HACK:SALTMODULE
  EXPORT salt_TOOLSMODULE := 'SALTTOOLS30'; // Optional override by HACK:SALTTOOLSMODULE
 
  // Core module configuration values
  EXPORT spc_MODULE := 'I_Tobacco_Realsource';
  EXPORT spc_NAMESCOPE := '';
  EXPORT spc_PROCESS := '';
  EXPORT spc_IDNAME := ''; // cluster id (input)
  EXPORT spc_IDFIELD := ''; // cluster id (output)
  EXPORT spc_RIDFIELD := 'vault_rid'; // record id
  EXPORT spc_CONFIG := 'Config';
  EXPORT spc_FILEPREFIX := 'In_';
  EXPORT spc_FILENAME := 'Vault';
  EXPORT spc_INGESTSTATUS := '';
  EXPORT spc_HAS_TWOSTEP := FALSE;
  EXPORT spc_HAS_PARTITION := FALSE;
  EXPORT spc_HAS_FIELDTYPES := FALSE;
  EXPORT spc_HAS_INCREMENTAL := FALSE;
  EXPORT spc_HAS_ASOF := FALSE;
  EXPORT spc_HAS_NONCONTIGUOUS := TRUE;
  EXPORT spc_HAS_SUPERFILES := FALSE;
 
  // The entire spec file
  EXPORT spcString :=
    'OPTIONS:-gn\n'
    + 'MODULE:I_Tobacco_Realsource\n'
    + 'FILENAME:Vault\n'
    + 'INGESTFILE:OFPU:NAMED(Source)\n'
    + 'RIDFIELD:vault_rid\n'
    + 'SOURCERIDFIELD:vault_UID_Hash\n'
    + 'FIELD:vault_date_first_seen:RECORDDATE(FIRST):\n'
    + 'FIELD:vault_date_last_seen:RECORDDATE(LAST):\n'
    + 'INGESTMODE:NONCONTIGUOUS(vault_date_first_seen,vault_date_last_seen)\n'
    + '\n'
    + 'FIELD:vault_uid_hash:TYPE(DATA16):0,0\n'
    + 'FIELD:lexid:TYPE(UNSIGNED8):0,0\n'
    + 'FIELD:receive_date:TYPE(STRING10):0,0\n'
    + 'FIELD:uid:TYPE(STRING):0,0\n'
    + 'FIELD:prefix_code:TYPE(STRING):0,0\n'
    + 'FIELD:first_name:TYPE(STRING):0,0\n'
    + 'FIELD:middle_initial:TYPE(STRING):0,0\n'
    + 'FIELD:last_name:TYPE(STRING):0,0\n'
    + 'FIELD:suffix_code:TYPE(STRING):0,0\n'
    + 'FIELD:company_secondary_name:TYPE(STRING):0,0\n'
    + 'FIELD:address_1:TYPE(STRING):0,0\n'
    + 'FIELD:address_2:TYPE(STRING):0,0\n'
    + 'FIELD:city_address:TYPE(STRING):0,0\n'
    + 'FIELD:state:TYPE(STRING):0,0\n'
    + 'FIELD:zip_code:TYPE(STRING):0,0\n'
    + 'FIELD:zip_code4:TYPE(STRING):0,0\n'
    + 'FIELD:phone_number:TYPE(STRING):0,0\n'
    + 'FIELD:dob:TYPE(STRING):0,0\n'
    + 'FIELD:id:TYPE(STRING):0,0\n'
    + 'FIELD:areyouasmoker:TYPE(STRING):0,0\n'
    + 'FIELD:legalsmokerage:TYPE(STRING):0,0\n'
    + 'FIELD:certifyme:TYPE(STRING):0,0\n'
    + 'FIELD:month:TYPE(STRING):0,0\n'
    + 'FIELD:day:TYPE(STRING):0,0\n'
    + 'FIELD:year:TYPE(STRING):0,0\n'
    + 'FIELD:gender:TYPE(STRING):0,0\n'
    + 'FIELD:optinemail:TYPE(STRING):0,0\n'
    + 'FIELD:use:TYPE(STRING):0,0\n'
    + 'FIELD:sgbrand:TYPE(STRING):0,0\n'
    + 'FIELD:ciglength:TYPE(STRING):0,0\n'
    + 'FIELD:cigtype:TYPE(STRING):0,0\n'
    + 'FIELD:purchaseage:TYPE(STRING):0,0\n'
    + 'FIELD:usualbrand:TYPE(STRING):0,0\n'
    + 'FIELD:amtbrandpurchase:TYPE(STRING):0,0\n'
    + 'FIELD:brandunavailable:TYPE(STRING):0,0\n'
    + 'FIELD:secondbrand:TYPE(STRING):0,0\n'
    + 'FIELD:smokelessbrand:TYPE(STRING):0,0\n'
    + 'FIELD:smokelesstype:TYPE(STRING):0,0\n'
    + 'FIELD:smokelessflavor:TYPE(STRING):0,0\n'
    + 'FIELD:cigarbrand:TYPE(STRING):0,0\n'
    + 'FIELD:dt:TYPE(STRING):0,0\n'
    + 'FIELD:ip:TYPE(STRING):0,0\n'
    + 'FIELD:pkid:TYPE(STRING):0,0\n'
    + 'FIELD:fed:TYPE(STRING):0,0\n'
    + 'FIELD:agecaptureid:TYPE(STRING):0,0\n'
    + 'FIELD:sourcerid:TYPE(UNSIGNED8):0,0\n'
    + 'FIELD:name_id:TYPE(UNSIGNED8):0,0\n'
    + 'FIELD:clean_title:TYPE(STRING20):0,0\n'
    + 'FIELD:clean_fname:TYPE(STRING20):0,0\n'
    + 'FIELD:clean_mname:TYPE(STRING20):0,0\n'
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
