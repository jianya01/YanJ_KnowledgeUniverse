// Machine-readable versions of the spec file and subsets thereof
IMPORT SALT38;
EXPORT GenerationMod := MODULE(SALT38.iGenerationMod)
 
  // SALT Version info
  EXPORT salt_VERSION := 'V3.8.1';
  EXPORT salt_MODULE := 'SALT38'; // Optional override by HACK:SALTMODULE
  EXPORT salt_TOOLSMODULE := 'SALTTOOLS30'; // Optional override by HACK:SALTTOOLSMODULE
 
  // Core module configuration values
  EXPORT spc_MODULE := 'I_Crim_Offenses';
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
    + 'MODULE:I_Crim_Offenses\n'
    + 'FILENAME:Vault\n'
    + 'INGESTFILE:OFPU:NAMED(Source)\n'
    + 'RIDFIELD:vault_rid\n'
    + 'SOURCERIDFIELD:vault_UID_Hash\n'
    + 'FIELD:vault_date_first_seen:RECORDDATE(FIRST):\n'
    + 'FIELD:vault_date_last_seen:RECORDDATE(LAST):\n'
    + 'INGESTMODE:NONCONTIGUOUS(vault_date_first_seen,vault_date_last_seen)\n'
    + '\n'
    + 'FIELD:vault_uid_hash:TYPE(INTEGER8):0,0\n'
    + 'FIELD:process_date:TYPE(STRING8):0,0\n'
    + 'FIELD:offender_key:TYPE(STRING60):0,0\n'
    + 'FIELD:vendor:TYPE(STRING5):0,0\n'
    + 'FIELD:state_origin:TYPE(STRING2):0,0\n'
    + 'FIELD:source_file:TYPE(STRING20):0,0\n'
    + 'FIELD:data_type:TYPE(STRING1):0,0\n'
    + 'FIELD:off_comp:TYPE(STRING4):0,0\n'
    + 'FIELD:off_delete_flag:TYPE(STRING1):0,0\n'
    + 'FIELD:off_date:TYPE(STRING8):0,0\n'
    + 'FIELD:arr_date:TYPE(STRING8):0,0\n'
    + 'FIELD:num_of_counts:TYPE(STRING3):0,0\n'
    + 'FIELD:le_agency_cd:TYPE(STRING10):0,0\n'
    + 'FIELD:le_agency_desc:TYPE(STRING50):0,0\n'
    + 'FIELD:le_agency_case_number:TYPE(STRING35):0,0\n'
    + 'FIELD:traffic_ticket_number:TYPE(STRING35):0,0\n'
    + 'FIELD:traffic_dl_no:TYPE(STRING25):0,0\n'
    + 'FIELD:traffic_dl_st:TYPE(STRING2):0,0\n'
    + 'FIELD:arr_off_code:TYPE(STRING20):0,0\n'
    + 'FIELD:arr_off_desc_1:TYPE(STRING75):0,0\n'
    + 'FIELD:arr_off_desc_2:TYPE(STRING50):0,0\n'
    + 'FIELD:arr_off_type_cd:TYPE(STRING5):0,0\n'
    + 'FIELD:arr_off_type_desc:TYPE(STRING30):0,0\n'
    + 'FIELD:arr_off_lev:TYPE(STRING5):0,0\n'
    + 'FIELD:arr_statute:TYPE(STRING20):0,0\n'
    + 'FIELD:arr_statute_desc:TYPE(STRING70):0,0\n'
    + 'FIELD:arr_disp_date:TYPE(STRING8):0,0\n'
    + 'FIELD:arr_disp_code:TYPE(STRING5):0,0\n'
    + 'FIELD:arr_disp_desc_1:TYPE(STRING30):0,0\n'
    + 'FIELD:arr_disp_desc_2:TYPE(STRING30):0,0\n'
    + 'FIELD:pros_refer_cd:TYPE(STRING10):0,0\n'
    + 'FIELD:pros_refer:TYPE(STRING50):0,0\n'
    + 'FIELD:pros_assgn_cd:TYPE(STRING10):0,0\n'
    + 'FIELD:pros_assgn:TYPE(STRING50):0,0\n'
    + 'FIELD:pros_chg_rej:TYPE(STRING1):0,0\n'
    + 'FIELD:pros_off_code:TYPE(STRING20):0,0\n'
    + 'FIELD:pros_off_desc_1:TYPE(STRING75):0,0\n'
    + 'FIELD:pros_off_desc_2:TYPE(STRING50):0,0\n'
    + 'FIELD:pros_off_type_cd:TYPE(STRING5):0,0\n'
    + 'FIELD:pros_off_type_desc:TYPE(STRING30):0,0\n'
    + 'FIELD:pros_off_lev:TYPE(STRING5):0,0\n'
    + 'FIELD:pros_act_filed:TYPE(STRING30):0,0\n'
    + 'FIELD:court_case_number:TYPE(STRING35):0,0\n'
    + 'FIELD:court_cd:TYPE(STRING10):0,0\n'
    + 'FIELD:court_desc:TYPE(STRING40):0,0\n'
    + 'FIELD:court_appeal_flag:TYPE(STRING1):0,0\n'
    + 'FIELD:court_final_plea:TYPE(STRING30):0,0\n'
    + 'FIELD:court_off_code:TYPE(STRING20):0,0\n'
    + 'FIELD:court_off_desc_1:TYPE(STRING75):0,0\n'
    + 'FIELD:court_off_desc_2:TYPE(STRING50):0,0\n'
    + 'FIELD:court_off_type_cd:TYPE(STRING5):0,0\n'
    + 'FIELD:court_off_type_desc:TYPE(STRING30):0,0\n'
    + 'FIELD:court_off_lev:TYPE(STRING5):0,0\n'
    + 'FIELD:court_statute:TYPE(STRING20):0,0\n'
    + 'FIELD:court_additional_statutes:TYPE(STRING50):0,0\n'
    + 'FIELD:court_statute_desc:TYPE(STRING70):0,0\n'
    + 'FIELD:court_disp_date:TYPE(STRING8):0,0\n'
    + 'FIELD:court_disp_code:TYPE(STRING5):0,0\n'
    + 'FIELD:court_disp_desc_1:TYPE(STRING40):0,0\n'
    + 'FIELD:court_disp_desc_2:TYPE(STRING40):0,0\n'
    + 'FIELD:sent_date:TYPE(STRING8):0,0\n'
    + 'FIELD:sent_jail:TYPE(STRING50):0,0\n'
    + 'FIELD:sent_susp_time:TYPE(STRING50):0,0\n'
    + 'FIELD:sent_court_cost:TYPE(STRING8):0,0\n'
    + 'FIELD:sent_court_fine:TYPE(STRING9):0,0\n'
    + 'FIELD:sent_susp_court_fine:TYPE(STRING9):0,0\n'
    + 'FIELD:sent_probation:TYPE(STRING50):0,0\n'
    + 'FIELD:sent_addl_prov_code:TYPE(STRING5):0,0\n'
    + 'FIELD:sent_addl_prov_desc_1:TYPE(STRING40):0,0\n'
    + 'FIELD:sent_addl_prov_desc_2:TYPE(STRING40):0,0\n'
    + 'FIELD:sent_consec:TYPE(STRING2):0,0\n'
    + 'FIELD:sent_agency_rec_cust_ori:TYPE(STRING10):0,0\n'
    + 'FIELD:sent_agency_rec_cust:TYPE(STRING50):0,0\n'
    + 'FIELD:appeal_date:TYPE(STRING8):0,0\n'
    + 'FIELD:appeal_off_disp:TYPE(STRING40):0,0\n'
    + 'FIELD:appeal_final_decision:TYPE(STRING40):0,0\n'
    + 'FIELD:convict_dt:TYPE(STRING8):0,0\n'
    + 'FIELD:offense_town:TYPE(STRING30):0,0\n'
    + 'FIELD:cty_conv:TYPE(STRING30):0,0\n'
    + 'FIELD:restitution:TYPE(STRING12):0,0\n'
    + 'FIELD:community_service:TYPE(STRING30):0,0\n'
    + 'FIELD:parole:TYPE(STRING20):0,0\n'
    + 'FIELD:addl_sent_dates:TYPE(STRING30):0,0\n'
    + 'FIELD:probation_desc2:TYPE(STRING60):0,0\n'
    + 'FIELD:court_dt:TYPE(STRING8):0,0\n'
    + 'FIELD:court_county:TYPE(STRING40):0,0\n'
    + 'FIELD:arr_off_lev_mapped:TYPE(STRING35):0,0\n'
    + 'FIELD:court_off_lev_mapped:TYPE(STRING35):0,0\n'
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
    + 'FIELD:hyg_classification_code:TYPE(STRING8):0,0\n'
    + 'FIELD:old_ln_offense_score:TYPE(STRING8):0,0\n'
    + '\n'
    ;
 
  // Structured values
  EXPORT linkpaths := DATASET([
    ],{STRING linkpath;STRING compulsory;STRING optional;STRING bonus;STRING required;STRING search});
 
END;
