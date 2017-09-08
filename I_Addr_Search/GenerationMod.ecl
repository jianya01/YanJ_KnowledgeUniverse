// Machine-readable versions of the spec file and subsets thereof
IMPORT SALT38;
EXPORT GenerationMod := MODULE(SALT38.iGenerationMod)
 
  // SALT Version info
  EXPORT salt_VERSION := 'V3.8.1';
  EXPORT salt_MODULE := 'SALT38'; // Optional override by HACK:SALTMODULE
  EXPORT salt_TOOLSMODULE := 'SALTTOOLS30'; // Optional override by HACK:SALTTOOLSMODULE
 
  // Core module configuration values
  EXPORT spc_MODULE := 'I_Addr_Search';
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
    + 'MODULE:I_Addr_Search\n'
    + 'FILENAME:Vault\n'
    + 'INGESTFILE:OFPU:NAMED(Source)\n'
    + 'RIDFIELD:vault_rid\n'
    + 'SOURCERIDFIELD:vault_UID_Hash\n'
    + 'FIELD:vault_date_first_seen:RECORDDATE(FIRST):\n'
    + 'FIELD:vault_date_last_seen:RECORDDATE(LAST):\n'
    + 'INGESTMODE:NONCONTIGUOUS(vault_date_first_seen,vault_date_last_seen)\n'
    + '\n'
    + '\n'
    + 'FIELD:vault_uid_hash:TYPE(INTEGER8):0,0\n'
    + 'FIELD:zip:TYPE(STRING5):0,0\n'
    + 'FIELD:prim_range:TYPE(STRING10):0,0\n'
    + 'FIELD:prim_name:TYPE(STRING28):0,0\n'
    + 'FIELD:addr_suffix:TYPE(STRING4):0,0\n'
    + 'FIELD:predir:TYPE(STRING2):0,0\n'
    + 'FIELD:postdir:TYPE(STRING2):0,0\n'
    + 'FIELD:sec_range:TYPE(STRING8):0,0\n'
    + 'FIELD:zip_5:TYPE(STRING5):0,0\n'
    + 'FIELD:route_num:TYPE(STRING4):0,0\n'
    + 'FIELD:zip_4:TYPE(STRING4):0,0\n'
    + 'FIELD:walk_sequence:TYPE(STRING9):0,0\n'
    + 'FIELD:street_num:TYPE(STRING10):0,0\n'
    + 'FIELD:street_pre_directional:TYPE(STRING2):0,0\n'
    + 'FIELD:street_name:TYPE(STRING28):0,0\n'
    + 'FIELD:street_post_directional:TYPE(STRING2):0,0\n'
    + 'FIELD:street_suffix:TYPE(STRING4):0,0\n'
    + 'FIELD:secondary_unit_designator:TYPE(STRING4):0,0\n'
    + 'FIELD:secondary_unit_number:TYPE(STRING8):0,0\n'
    + 'FIELD:address_vacancy_indicator:TYPE(STRING1):0,0\n'
    + 'FIELD:throw_back_indicator:TYPE(STRING1):0,0\n'
    + 'FIELD:seasonal_delivery_indicator:TYPE(STRING1):0,0\n'
    + 'FIELD:seasonal_start_suppression_date:TYPE(STRING5):0,0\n'
    + 'FIELD:seasonal_end_suppression_date:TYPE(STRING5):0,0\n'
    + 'FIELD:dnd_indicator:TYPE(STRING1):0,0\n'
    + 'FIELD:college_indicator:TYPE(STRING1):0,0\n'
    + 'FIELD:college_start_suppression_date:TYPE(STRING10):0,0\n'
    + 'FIELD:college_end_suppression_date:TYPE(STRING10):0,0\n'
    + 'FIELD:address_style_flag:TYPE(STRING1):0,0\n'
    + 'FIELD:simplify_address_count:TYPE(STRING5):0,0\n'
    + 'FIELD:drop_indicator:TYPE(STRING1):0,0\n'
    + 'FIELD:residential_or_business_ind:TYPE(STRING1):0,0\n'
    + 'FIELD:dpbc_digit:TYPE(STRING2):0,0\n'
    + 'FIELD:dpbc_check_digit:TYPE(STRING1):0,0\n'
    + 'FIELD:update_date:TYPE(STRING10):0,0\n'
    + 'FIELD:file_release_date:TYPE(STRING10):0,0\n'
    + 'FIELD:override_file_release_date:TYPE(STRING10):0,0\n'
    + 'FIELD:county_num:TYPE(STRING3):0,0\n'
    + 'FIELD:county_name:TYPE(STRING28):0,0\n'
    + 'FIELD:city_name:TYPE(STRING28):0,0\n'
    + 'FIELD:state_code:TYPE(STRING2):0,0\n'
    + 'FIELD:state_num:TYPE(STRING2):0,0\n'
    + 'FIELD:congressional_district_number:TYPE(STRING2):0,0\n'
    + 'FIELD:owgm_indicator:TYPE(STRING1):0,0\n'
    + 'FIELD:record_type_code:TYPE(STRING1):0,0\n'
    + 'FIELD:advo_key:TYPE(STRING10):0,0\n'
    + 'FIELD:address_type:TYPE(STRING1):0,0\n'
    + 'FIELD:mixed_address_usage:TYPE(STRING1):0,0\n'
    + 'FIELD:date_first_seen:TYPE(STRING8):0,0\n'
    + 'FIELD:date_last_seen:TYPE(STRING8):0,0\n'
    + 'FIELD:date_vendor_first_reported:TYPE(STRING8):0,0\n'
    + 'FIELD:date_vendor_last_reported:TYPE(STRING8):0,0\n'
    + 'FIELD:vac_begdt:TYPE(STRING8):0,0\n'
    + 'FIELD:vac_enddt:TYPE(STRING8):0,0\n'
    + 'FIELD:months_vac_curr:TYPE(STRING8):0,0\n'
    + 'FIELD:months_vac_max:TYPE(STRING8):0,0\n'
    + 'FIELD:vac_count:TYPE(STRING8):0,0\n'
    + 'FIELD:unit_desig:TYPE(STRING10):0,0\n'
    + 'FIELD:p_city_name:TYPE(STRING25):0,0\n'
    + 'FIELD:v_city_name:TYPE(STRING25):0,0\n'
    + 'FIELD:st:TYPE(STRING2):0,0\n'
    + 'FIELD:zip4:TYPE(STRING4):0,0\n'
    + 'FIELD:cart:TYPE(STRING4):0,0\n'
    + 'FIELD:cr_sort_sz:TYPE(STRING1):0,0\n'
    + 'FIELD:lot:TYPE(STRING4):0,0\n'
    + 'FIELD:lot_order:TYPE(STRING1):0,0\n'
    + 'FIELD:dbpc:TYPE(STRING2):0,0\n'
    + 'FIELD:chk_digit:TYPE(STRING1):0,0\n'
    + 'FIELD:rec_type:TYPE(STRING2):0,0\n'
    + 'FIELD:fips_county:TYPE(STRING2):0,0\n'
    + 'FIELD:county:TYPE(STRING3):0,0\n'
    + 'FIELD:geo_lat:TYPE(STRING10):0,0\n'
    + 'FIELD:geo_long:TYPE(STRING11):0,0\n'
    + 'FIELD:msa:TYPE(STRING4):0,0\n'
    + 'FIELD:geo_blk:TYPE(STRING7):0,0\n'
    + 'FIELD:geo_match:TYPE(STRING1):0,0\n'
    + 'FIELD:err_stat:TYPE(STRING4):0,0\n'
    + 'FIELD:src:TYPE(STRING2):0,0\n'
    + 'FIELD:__internal_fpos__:TYPE(UNSIGNED8):0,0\n'
    + '\n'
    ;
 
  // Structured values
  EXPORT linkpaths := DATASET([
    ],{STRING linkpath;STRING compulsory;STRING optional;STRING bonus;STRING required;STRING search});
 
END;
