// Machine-readable versions of the spec file and subsets thereof
IMPORT SALT38;
EXPORT GenerationMod := MODULE(SALT38.iGenerationMod)
 
  // SALT Version info
  EXPORT salt_VERSION := 'V3.8.1';
  EXPORT salt_MODULE := 'SALT38'; // Optional override by HACK:SALTMODULE
  EXPORT salt_TOOLSMODULE := 'SALTTOOLS30'; // Optional override by HACK:SALTTOOLSMODULE
 
  // Core module configuration values
  EXPORT spc_MODULE := 'I_Tobacco_MediaOne';
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
    + 'MODULE:I_Tobacco_MediaOne\n'
    + 'FILENAME:Vault\n'
    + 'INGESTFILE:OFPU:NAMED(Vault_Source)\n'
    + 'RIDFIELD:vault_rid\n'
    + 'SOURCERIDFIELD:vault_UID_Hash\n'
    + 'FIELD:vault_date_first_seen:RECORDDATE(FIRST):\n'
    + 'FIELD:vault_date_last_seen:RECORDDATE(LAST):\n'
    + 'INGESTMODE:NONCONTIGUOUS(vault_date_first_seen,vault_date_last_seen)\n'
    + '\n'
    + 'FIELD:vault_uid_hash:TYPE(DATA16):0,0\n'
    + 'FIELD:lexid:TYPE(UNSIGNED8):0,0\n'
    + 'FIELD:receive_date:TYPE(STRING10):0,0\n'
    + 'FIELD:recordid:TYPE(STRING):0,0\n'
    + 'FIELD:email:TYPE(STRING):0,0\n'
    + 'FIELD:first_name:TYPE(STRING):0,0\n'
    + 'FIELD:last_name:TYPE(STRING):0,0\n'
    + 'FIELD:suffix:TYPE(STRING):0,0\n'
    + 'FIELD:delivery_address:TYPE(STRING):0,0\n'
    + 'FIELD:delivery_address2:TYPE(STRING):0,0\n'
    + 'FIELD:city_address:TYPE(STRING):0,0\n'
    + 'FIELD:state:TYPE(STRING):0,0\n'
    + 'FIELD:zip_code:TYPE(STRING):0,0\n'
    + 'FIELD:plus4:TYPE(STRING):0,0\n'
    + 'FIELD:phone:TYPE(STRING):0,0\n'
    + 'FIELD:cell_phone:TYPE(STRING):0,0\n'
    + 'FIELD:dob:TYPE(STRING):0,0\n'
    + 'FIELD:gender:TYPE(STRING):0,0\n'
    + 'FIELD:use:TYPE(STRING):0,0\n'
    + 'FIELD:cigbrand:TYPE(STRING):0,0\n'
    + 'FIELD:ciglength:TYPE(STRING):0,0\n'
    + 'FIELD:purchasecigs:TYPE(STRING):0,0\n'
    + 'FIELD:usual_brand:TYPE(STRING):0,0\n'
    + 'FIELD:amtbrandpurchase:TYPE(STRING):0,0\n'
    + 'FIELD:brandunavailable:TYPE(STRING):0,0\n'
    + 'FIELD:second_brand:TYPE(STRING):0,0\n'
    + 'FIELD:smokeless_brand:TYPE(STRING):0,0\n'
    + 'FIELD:smokeless_style:TYPE(STRING):0,0\n'
    + 'FIELD:smokeless_flavor:TYPE(STRING):0,0\n'
    + 'FIELD:cigar_brand:TYPE(STRING):0,0\n'
    + 'FIELD:ip:TYPE(STRING):0,0\n'
    + 'FIELD:cigtype:TYPE(STRING):0,0\n'
    + 'FIELD:source:TYPE(STRING):0,0\n'
    + 'FIELD:estimated_income:TYPE(STRING):0,0\n'
    + 'FIELD:net_worth:TYPE(STRING):0,0\n'
    + 'FIELD:ownership_rent:TYPE(STRING):0,0\n'
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
