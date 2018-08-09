// Machine-readable versions of the spec file and subsets thereof
IMPORT SALT311;
EXPORT GenerationMod := MODULE(SALT311.iGenerationMod)
 
  // SALT Version info
  EXPORT salt_VERSION := 'V3.11.2';
  EXPORT salt_MODULE := 'SALT311'; // Optional override by HACK:SALTMODULE
  EXPORT salt_TOOLSMODULE := 'SALTTOOLS30'; // Optional override by HACK:SALTTOOLSMODULE
 
  // Core module configuration values
  EXPORT spc_MODULE := 'I_fcra_alloymedia_student_list_did';
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
  EXPORT spc_EXTERNAL_BATCH_PARAM := ',/* MY_ */,vault_date_first_seen,vault_date_last_seen,vault_uid_hash,did,school_act_code,tuition_code,public_private_code,school_size_code,student_last_name,student_first_name,gender_code,competitive_code,intl_exchange_student_code,address_sequence_code,school_name,school_address_2_secondary,filler_1,school_address_1_primary,filler_2,school_city,school_state,school_zip5,school_zip4,school_phone_number,school_housing_code,filler_3,home_address_1_secondary,filler_4,home_address_2_primary,filler_5,home_city,home_state,home_zip5,home_zip4,home_phone_number,home_housing_code,class_rank,major_code,school_info_time_zone,filler_6,filler_7,home_info_time_zone,filler_8,filler_9,address_type,address_info_code,sequence_number,filler_10,filler_11,key_code,carriage_return,line_feed,file_type,ln_college_name,tier,did_score,clean_title,clean_fname,clean_mname,clean_lname,clean_name_suffix,clean_name_score,clean_addr_code,rawaid,append_prep_address,append_prep_address_last,clean_phone_number,clean_prim_range,clean_predir,clean_prim_name,clean_addr_suffix,clean_postdir,clean_unit_desig,clean_sec_range,clean_p_city_name,clean_v_city_name,clean_st,clean_zip5,clean_zip4,clean_cart,clean_cr_sort_sz,clean_lot,clean_lot_order,clean_dbpc,clean_chk_digit,clean_rec_type,clean_county,clean_ace_fips_st,clean_fips_county,clean_geo_lat,clean_geo_long,clean_msa,clean_geo_blk,clean_geo_match,clean_err_stat,process_date,date_first_seen,date_last_seen,date_vendor_first_reported,date_vendor_last_reported,tier2,source,__internal_fpos__';
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
    + 'MODULE:I_fcra_alloymedia_student_list_did\n'
    + 'FILENAME:Vault\n'
    + 'INGESTFILE:OFPU:NAMED(SRC)\n'
    + 'RIDFIELD:vault_rid\n'
    + 'SOURCERIDFIELD:vault_uid_hash\n'
    + 'FIELD:vault_date_first_seen:RECORDDATE(FIRST):\n'
    + 'FIELD:vault_date_last_seen:RECORDDATE(LAST):\n'
    + 'INGESTMODE:NONCONTIGUOUS(vault_date_first_seen,vault_date_last_seen)\n'
    + '\n'
    + 'FIELD:vault_uid_hash:TYPE(DATA16):0,0\n'
    + 'FIELD:did:TYPE(UNSIGNED8):0,0\n'
    + 'FIELD:school_act_code:TYPE(STRING5):0,0\n'
    + 'FIELD:tuition_code:TYPE(STRING1):0,0\n'
    + 'FIELD:public_private_code:TYPE(STRING1):0,0\n'
    + 'FIELD:school_size_code:TYPE(STRING1):0,0\n'
    + 'FIELD:student_last_name:TYPE(STRING20):0,0\n'
    + 'FIELD:student_first_name:TYPE(STRING20):0,0\n'
    + 'FIELD:gender_code:TYPE(STRING1):0,0\n'
    + 'FIELD:competitive_code:TYPE(STRING1):0,0\n'
    + 'FIELD:intl_exchange_student_code:TYPE(STRING1):0,0\n'
    + 'FIELD:address_sequence_code:TYPE(STRING1):0,0\n'
    + 'FIELD:school_name:TYPE(STRING30):0,0\n'
    + 'FIELD:school_address_2_secondary:TYPE(STRING30):0,0\n'
    + 'FIELD:filler_1:TYPE(STRING5):0,0\n'
    + 'FIELD:school_address_1_primary:TYPE(STRING30):0,0\n'
    + 'FIELD:filler_2:TYPE(STRING5):0,0\n'
    + 'FIELD:school_city:TYPE(STRING20):0,0\n'
    + 'FIELD:school_state:TYPE(STRING2):0,0\n'
    + 'FIELD:school_zip5:TYPE(STRING5):0,0\n'
    + 'FIELD:school_zip4:TYPE(STRING4):0,0\n'
    + 'FIELD:school_phone_number:TYPE(STRING10):0,0\n'
    + 'FIELD:school_housing_code:TYPE(STRING1):0,0\n'
    + 'FIELD:filler_3:TYPE(STRING5):0,0\n'
    + 'FIELD:home_address_1_secondary:TYPE(STRING30):0,0\n'
    + 'FIELD:filler_4:TYPE(STRING5):0,0\n'
    + 'FIELD:home_address_2_primary:TYPE(STRING30):0,0\n'
    + 'FIELD:filler_5:TYPE(STRING5):0,0\n'
    + 'FIELD:home_city:TYPE(STRING20):0,0\n'
    + 'FIELD:home_state:TYPE(STRING2):0,0\n'
    + 'FIELD:home_zip5:TYPE(STRING5):0,0\n'
    + 'FIELD:home_zip4:TYPE(STRING4):0,0\n'
    + 'FIELD:home_phone_number:TYPE(STRING10):0,0\n'
    + 'FIELD:home_housing_code:TYPE(STRING1):0,0\n'
    + 'FIELD:class_rank:TYPE(STRING1):0,0\n'
    + 'FIELD:major_code:TYPE(STRING3):0,0\n'
    + 'FIELD:school_info_time_zone:TYPE(STRING1):0,0\n'
    + 'FIELD:filler_6:TYPE(STRING2):0,0\n'
    + 'FIELD:filler_7:TYPE(STRING4):0,0\n'
    + 'FIELD:home_info_time_zone:TYPE(STRING1):0,0\n'
    + 'FIELD:filler_8:TYPE(STRING2):0,0\n'
    + 'FIELD:filler_9:TYPE(STRING4):0,0\n'
    + 'FIELD:address_type:TYPE(STRING1):0,0\n'
    + 'FIELD:address_info_code:TYPE(STRING1):0,0\n'
    + 'FIELD:sequence_number:TYPE(STRING7):0,0\n'
    + 'FIELD:filler_10:TYPE(STRING2):0,0\n'
    + 'FIELD:filler_11:TYPE(STRING50):0,0\n'
    + 'FIELD:key_code:TYPE(STRING15):0,0\n'
    + 'FIELD:carriage_return:TYPE(STRING1):0,0\n'
    + 'FIELD:line_feed:TYPE(STRING1):0,0\n'
    + 'FIELD:file_type:TYPE(STRING1):0,0\n'
    + 'FIELD:ln_college_name:TYPE(STRING50):0,0\n'
    + 'FIELD:tier:TYPE(STRING1):0,0\n'
    + 'FIELD:did_score:TYPE(UNSIGNED8):0,0\n'
    + 'FIELD:clean_title:TYPE(STRING5):0,0\n'
    + 'FIELD:clean_fname:TYPE(STRING20):0,0\n'
    + 'FIELD:clean_mname:TYPE(STRING20):0,0\n'
    + 'FIELD:clean_lname:TYPE(STRING20):0,0\n'
    + 'FIELD:clean_name_suffix:TYPE(STRING5):0,0\n'
    + 'FIELD:clean_name_score:TYPE(STRING3):0,0\n'
    + 'FIELD:clean_addr_code:TYPE(STRING1):0,0\n'
    + 'FIELD:rawaid:TYPE(UNSIGNED8):0,0\n'
    + 'FIELD:append_prep_address:TYPE(STRING77):0,0\n'
    + 'FIELD:append_prep_address_last:TYPE(STRING54):0,0\n'
    + 'FIELD:clean_phone_number:TYPE(STRING10):0,0\n'
    + 'FIELD:clean_prim_range:TYPE(STRING10):0,0\n'
    + 'FIELD:clean_predir:TYPE(STRING2):0,0\n'
    + 'FIELD:clean_prim_name:TYPE(STRING28):0,0\n'
    + 'FIELD:clean_addr_suffix:TYPE(STRING4):0,0\n'
    + 'FIELD:clean_postdir:TYPE(STRING2):0,0\n'
    + 'FIELD:clean_unit_desig:TYPE(STRING10):0,0\n'
    + 'FIELD:clean_sec_range:TYPE(STRING8):0,0\n'
    + 'FIELD:clean_p_city_name:TYPE(STRING25):0,0\n'
    + 'FIELD:clean_v_city_name:TYPE(STRING25):0,0\n'
    + 'FIELD:clean_st:TYPE(STRING2):0,0\n'
    + 'FIELD:clean_zip5:TYPE(STRING5):0,0\n'
    + 'FIELD:clean_zip4:TYPE(STRING4):0,0\n'
    + 'FIELD:clean_cart:TYPE(STRING4):0,0\n'
    + 'FIELD:clean_cr_sort_sz:TYPE(STRING1):0,0\n'
    + 'FIELD:clean_lot:TYPE(STRING4):0,0\n'
    + 'FIELD:clean_lot_order:TYPE(STRING1):0,0\n'
    + 'FIELD:clean_dbpc:TYPE(STRING2):0,0\n'
    + 'FIELD:clean_chk_digit:TYPE(STRING1):0,0\n'
    + 'FIELD:clean_rec_type:TYPE(STRING2):0,0\n'
    + 'FIELD:clean_county:TYPE(STRING5):0,0\n'
    + 'FIELD:clean_ace_fips_st:TYPE(STRING2):0,0\n'
    + 'FIELD:clean_fips_county:TYPE(STRING3):0,0\n'
    + 'FIELD:clean_geo_lat:TYPE(STRING10):0,0\n'
    + 'FIELD:clean_geo_long:TYPE(STRING11):0,0\n'
    + 'FIELD:clean_msa:TYPE(STRING4):0,0\n'
    + 'FIELD:clean_geo_blk:TYPE(STRING7):0,0\n'
    + 'FIELD:clean_geo_match:TYPE(STRING1):0,0\n'
    + 'FIELD:clean_err_stat:TYPE(STRING4):0,0\n'
    + 'FIELD:process_date:TYPE(STRING8):0,0\n'
    + 'FIELD:date_first_seen:TYPE(STRING8):0,0\n'
    + 'FIELD:date_last_seen:TYPE(STRING8):0,0\n'
    + 'FIELD:date_vendor_first_reported:TYPE(STRING8):0,0\n'
    + 'FIELD:date_vendor_last_reported:TYPE(STRING8):0,0\n'
    + 'FIELD:tier2:TYPE(STRING5):0,0\n'
    + 'FIELD:source:TYPE(STRING2):0,0\n'
    + 'FIELD:__internal_fpos__:TYPE(UNSIGNED8):0,0\n'
    + '\n'
    + '\n'
    + '\n'
    + '\n'
    ;
 
  // Structured values
  EXPORT linkpaths := DATASET([
    ],{STRING linkpath;STRING compulsory;STRING optional;STRING bonus;STRING required;STRING search});
 
END;

