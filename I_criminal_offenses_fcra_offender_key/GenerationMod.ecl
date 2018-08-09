// Machine-readable versions of the spec file and subsets thereof
IMPORT SALT311;
EXPORT GenerationMod := MODULE(SALT311.iGenerationMod)
 
  // SALT Version info
  EXPORT salt_VERSION := 'V3.11.2';
  EXPORT salt_MODULE := 'SALT311'; // Optional override by HACK:SALTMODULE
  EXPORT salt_TOOLSMODULE := 'SALTTOOLS30'; // Optional override by HACK:SALTTOOLSMODULE
 
  // Core module configuration values
  EXPORT spc_MODULE := 'I_criminal_offenses_fcra_offender_key';
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
  EXPORT spc_EXTERNAL_BATCH_PARAM := ',/* MY_ */,vault_date_first_seen,vault_date_last_seen,vault_uid_hash,ok,process_date,offender_key,vendor,county_of_origin,source_file,data_type,record_type,orig_state,offense_key,off_date,arr_date,case_num,total_num_of_offenses,num_of_counts,off_code,chg,chg_typ_flg,off_of_record,off_desc_1,off_desc_2,add_off_cd,add_off_desc,off_typ,off_lev,arr_disp_date,arr_disp_cd,arr_disp_desc_1,arr_disp_desc_2,arr_disp_desc_3,court_cd,court_desc,ct_dist,ct_fnl_plea_cd,ct_fnl_plea,ct_off_code,ct_chg,ct_chg_typ_flg,ct_off_desc_1,ct_off_desc_2,ct_addl_desc_cd,ct_off_lev,ct_disp_dt,ct_disp_cd,ct_disp_desc_1,ct_disp_desc_2,cty_conv_cd,cty_conv,adj_wthd,stc_dt,stc_cd,stc_comp,stc_desc_1,stc_desc_2,stc_desc_3,stc_desc_4,stc_lgth,stc_lgth_desc,inc_adm_dt,min_term,min_term_desc,max_term,max_term_desc,parole,probation,offensetown,convict_dt,court_county,fcra_offense_key,fcra_conviction_flag,fcra_traffic_flag,fcra_date,fcra_date_type,conviction_override_date,conviction_override_date_type,offense_score,offense_persistent_id,offense_category';
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
    + 'MODULE:I_criminal_offenses_fcra_offender_key\n'
    + 'FILENAME:Vault\n'
    + 'INGESTFILE:OFPU:NAMED(Source)\n'
    + 'RIDFIELD:vault_rid\n'
    + 'SOURCERIDFIELD:vault_uid_hash\n'
    + 'FIELD:vault_date_first_seen:RECORDDATE(FIRST):\n'
    + 'FIELD:vault_date_last_seen:RECORDDATE(LAST):\n'
    + 'INGESTMODE:NONCONTIGUOUS(vault_date_first_seen,vault_date_last_seen)\n'
    + '\n'
    + 'FIELD:vault_uid_hash:TYPE(DATA16):0,0\n'
    + 'FIELD:ok:TYPE(STRING60):0,0\n'
    + 'FIELD:process_date:TYPE(STRING8):0,0\n'
    + 'FIELD:offender_key:TYPE(STRING60):0,0\n'
    + 'FIELD:vendor:TYPE(STRING5):0,0\n'
    + 'FIELD:county_of_origin:TYPE(STRING30):0,0\n'
    + 'FIELD:source_file:TYPE(STRING20):0,0\n'
    + 'FIELD:data_type:TYPE(STRING1):0,0\n'
    + 'FIELD:record_type:TYPE(STRING2):0,0\n'
    + 'FIELD:orig_state:TYPE(STRING2):0,0\n'
    + 'FIELD:offense_key:TYPE(STRING50):0,0\n'
    + 'FIELD:off_date:TYPE(STRING8):0,0\n'
    + 'FIELD:arr_date:TYPE(STRING8):0,0\n'
    + 'FIELD:case_num:TYPE(STRING35):0,0\n'
    + 'FIELD:total_num_of_offenses:TYPE(STRING3):0,0\n'
    + 'FIELD:num_of_counts:TYPE(STRING3):0,0\n'
    + 'FIELD:off_code:TYPE(STRING20):0,0\n'
    + 'FIELD:chg:TYPE(STRING31):0,0\n'
    + 'FIELD:chg_typ_flg:TYPE(STRING1):0,0\n'
    + 'FIELD:off_of_record:TYPE(STRING4):0,0\n'
    + 'FIELD:off_desc_1:TYPE(STRING75):0,0\n'
    + 'FIELD:off_desc_2:TYPE(STRING50):0,0\n'
    + 'FIELD:add_off_cd:TYPE(STRING2):0,0\n'
    + 'FIELD:add_off_desc:TYPE(STRING30):0,0\n'
    + 'FIELD:off_typ:TYPE(STRING1):0,0\n'
    + 'FIELD:off_lev:TYPE(STRING5):0,0\n'
    + 'FIELD:arr_disp_date:TYPE(STRING8):0,0\n'
    + 'FIELD:arr_disp_cd:TYPE(STRING3):0,0\n'
    + 'FIELD:arr_disp_desc_1:TYPE(STRING50):0,0\n'
    + 'FIELD:arr_disp_desc_2:TYPE(STRING50):0,0\n'
    + 'FIELD:arr_disp_desc_3:TYPE(STRING50):0,0\n'
    + 'FIELD:court_cd:TYPE(STRING5):0,0\n'
    + 'FIELD:court_desc:TYPE(STRING40):0,0\n'
    + 'FIELD:ct_dist:TYPE(STRING40):0,0\n'
    + 'FIELD:ct_fnl_plea_cd:TYPE(STRING1):0,0\n'
    + 'FIELD:ct_fnl_plea:TYPE(STRING30):0,0\n'
    + 'FIELD:ct_off_code:TYPE(STRING8):0,0\n'
    + 'FIELD:ct_chg:TYPE(STRING17):0,0\n'
    + 'FIELD:ct_chg_typ_flg:TYPE(STRING1):0,0\n'
    + 'FIELD:ct_off_desc_1:TYPE(STRING50):0,0\n'
    + 'FIELD:ct_off_desc_2:TYPE(STRING50):0,0\n'
    + 'FIELD:ct_addl_desc_cd:TYPE(STRING1):0,0\n'
    + 'FIELD:ct_off_lev:TYPE(STRING2):0,0\n'
    + 'FIELD:ct_disp_dt:TYPE(STRING8):0,0\n'
    + 'FIELD:ct_disp_cd:TYPE(STRING4):0,0\n'
    + 'FIELD:ct_disp_desc_1:TYPE(STRING50):0,0\n'
    + 'FIELD:ct_disp_desc_2:TYPE(STRING50):0,0\n'
    + 'FIELD:cty_conv_cd:TYPE(STRING2):0,0\n'
    + 'FIELD:cty_conv:TYPE(STRING30):0,0\n'
    + 'FIELD:adj_wthd:TYPE(STRING1):0,0\n'
    + 'FIELD:stc_dt:TYPE(STRING8):0,0\n'
    + 'FIELD:stc_cd:TYPE(STRING3):0,0\n'
    + 'FIELD:stc_comp:TYPE(STRING3):0,0\n'
    + 'FIELD:stc_desc_1:TYPE(STRING50):0,0\n'
    + 'FIELD:stc_desc_2:TYPE(STRING50):0,0\n'
    + 'FIELD:stc_desc_3:TYPE(STRING50):0,0\n'
    + 'FIELD:stc_desc_4:TYPE(STRING50):0,0\n'
    + 'FIELD:stc_lgth:TYPE(STRING15):0,0\n'
    + 'FIELD:stc_lgth_desc:TYPE(STRING50):0,0\n'
    + 'FIELD:inc_adm_dt:TYPE(STRING8):0,0\n'
    + 'FIELD:min_term:TYPE(STRING10):0,0\n'
    + 'FIELD:min_term_desc:TYPE(STRING35):0,0\n'
    + 'FIELD:max_term:TYPE(STRING10):0,0\n'
    + 'FIELD:max_term_desc:TYPE(STRING35):0,0\n'
    + 'FIELD:parole:TYPE(STRING50):0,0\n'
    + 'FIELD:probation:TYPE(STRING50):0,0\n'
    + 'FIELD:offensetown:TYPE(STRING40):0,0\n'
    + 'FIELD:convict_dt:TYPE(STRING8):0,0\n'
    + 'FIELD:court_county:TYPE(STRING40):0,0\n'
    + 'FIELD:fcra_offense_key:TYPE(STRING60):0,0\n'
    + 'FIELD:fcra_conviction_flag:TYPE(STRING1):0,0\n'
    + 'FIELD:fcra_traffic_flag:TYPE(STRING1):0,0\n'
    + 'FIELD:fcra_date:TYPE(STRING8):0,0\n'
    + 'FIELD:fcra_date_type:TYPE(STRING1):0,0\n'
    + 'FIELD:conviction_override_date:TYPE(STRING8):0,0\n'
    + 'FIELD:conviction_override_date_type:TYPE(STRING1):0,0\n'
    + 'FIELD:offense_score:TYPE(STRING2):0,0\n'
    + 'FIELD:offense_persistent_id:TYPE(UNSIGNED8):0,0\n'
    + 'FIELD:offense_category:TYPE(UNSIGNED8):0,0\n'
    ;
 
  // Structured values
  EXPORT linkpaths := DATASET([
    ],{STRING linkpath;STRING compulsory;STRING optional;STRING bonus;STRING required;STRING search});
 
END;

