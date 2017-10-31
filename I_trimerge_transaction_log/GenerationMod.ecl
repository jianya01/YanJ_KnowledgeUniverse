// Machine-readable versions of the spec file and subsets thereof
IMPORT SALT38;
EXPORT GenerationMod := MODULE(SALT38.iGenerationMod)
 
  // SALT Version info
  EXPORT salt_VERSION := 'V3.8.1';
  EXPORT salt_MODULE := 'SALT38'; // Optional override by HACK:SALTMODULE
  EXPORT salt_TOOLSMODULE := 'SALTTOOLS30'; // Optional override by HACK:SALTTOOLSMODULE
 
  // Core module configuration values
  EXPORT spc_MODULE := 'I_trimerge_transaction_log';
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
    + 'MODULE:I_trimerge_transaction_log\n'
    + 'FILENAME:Vault\n'
    + 'INGESTFILE:OFPU:NAMED(Source)\n'
    + 'RIDFIELD:vault_rid\n'
    + 'SOURCERIDFIELD:vault_uid_hash\n'
    + 'FIELD:vault_date_first_seen:RECORDDATE(FIRST):\n'
    + 'FIELD:vault_date_last_seen:RECORDDATE(LAST):\n'
    + 'INGESTMODE:NONCONTIGUOUS(vault_date_first_seen,vault_date_last_seen)\n'
    + '\n'
    + 'FIELD:vault_uid_hash:TYPE(DATA16):0,0\n'
    + 'FIELD:transaction_id:TYPE(STRING17):0,0\n'
    + 'FIELD:product_id:TYPE(INTEGER4):0,0\n'
    + 'FIELD:date_added:TYPE(STRING19):0,0\n'
    + 'FIELD:internal_account_id:TYPE(STRING30):0,0\n'
    + 'FIELD:end_user:TYPE(STRING60):0,0\n'
    + 'FIELD:special_billing_id:TYPE(STRING60):0,0\n'
    + 'FIELD:report_service_type:TYPE(STRING2):0,0\n'
    + 'FIELD:billing_report_code:TYPE(STRING4):0,0\n'
    + 'FIELD:eqx_report_code:TYPE(STRING4):0,0\n'
    + 'FIELD:exp_report_code:TYPE(STRING4):0,0\n'
    + 'FIELD:tran_report_code:TYPE(STRING4):0,0\n'
    + 'FIELD:ln_report_code:TYPE(STRING4):0,0\n'
    + 'FIELD:condition_code:TYPE(STRING3):0,0\n'
    + 'FIELD:account_base:TYPE(STRING8):0,0\n'
    + 'FIELD:account_suffix:TYPE(STRING3):0,0\n'
    + 'FIELD:account_id:TYPE(INTEGER4):0,0\n'
    + 'FIELD:consumer_number:TYPE(INTEGER4):0,0\n'
    + 'FIELD:customer_number:TYPE(INTEGER4):0,0\n'
    + 'FIELD:i_full_quote_back:TYPE(STRING60):0,0\n'
    + 'FIELD:i_date_ordered:TYPE(STRING10):0,0\n'
    + 'FIELD:i_individual_ssn:TYPE(STRING9):0,0\n'
    + 'FIELD:i_individual_name_prefix:TYPE(STRING5):0,0\n'
    + 'FIELD:i_individual_last_name:TYPE(STRING30):0,0\n'
    + 'FIELD:i_individual_first_name:TYPE(STRING20):0,0\n'
    + 'FIELD:i_individual_middle_name:TYPE(STRING20):0,0\n'
    + 'FIELD:i_individual_name_suffix:TYPE(STRING5):0,0\n'
    + 'FIELD:i_individual_dob_age:TYPE(STRING8):0,0\n'
    + 'FIELD:o_individual_ssn:TYPE(STRING9):0,0\n'
    + 'FIELD:o_individual_vendor_ssn:TYPE(STRING9):0,0\n'
    + 'FIELD:o_individual_name_prefix:TYPE(STRING5):0,0\n'
    + 'FIELD:o_individual_last_name:TYPE(STRING30):0,0\n'
    + 'FIELD:o_individual_first_name:TYPE(STRING20):0,0\n'
    + 'FIELD:o_individual_middle_name:TYPE(STRING20):0,0\n'
    + 'FIELD:o_individual_name_suffix:TYPE(STRING5):0,0\n'
    + 'FIELD:o_individual_dob_age:TYPE(STRING8):0,0\n'
    + 'FIELD:o_individual_processing_status:TYPE(STRING1):0,0\n'
    + 'FIELD:o_individual_error_code:TYPE(STRING8):0,0\n'
    + 'FIELD:count_person_in:TYPE(INTEGER1):0,0\n'
    + 'FIELD:o_house_num_current_addr:TYPE(STRING10):0,0\n'
    + 'FIELD:o_quad_current_addr:TYPE(STRING2):0,0\n'
    + 'FIELD:o_apt_current_addr:TYPE(STRING5):0,0\n'
    + 'FIELD:o_street_name_current_addr:TYPE(STRING40):0,0\n'
    + 'FIELD:o_street_type_current_addr:TYPE(STRING2):0,0\n'
    + 'FIELD:o_state_current_addr:TYPE(STRING2):0,0\n'
    + 'FIELD:o_city_current_addr:TYPE(STRING40):0,0\n'
    + 'FIELD:o_zip_current_addr:TYPE(STRING10):0,0\n'
    + 'FIELD:o_county_current_addr:TYPE(STRING30):0,0\n'
    + 'FIELD:o_country_current_addr:TYPE(STRING3):0,0\n'
    + 'FIELD:o_house_num_prior_addr:TYPE(STRING10):0,0\n'
    + 'FIELD:o_quad_prior_addr:TYPE(STRING2):0,0\n'
    + 'FIELD:o_apt_prior_addr:TYPE(STRING5):0,0\n'
    + 'FIELD:o_street_name_prior_addr:TYPE(STRING40):0,0\n'
    + 'FIELD:o_street_type_prior_addr:TYPE(STRING2):0,0\n'
    + 'FIELD:o_state_prior_addr:TYPE(STRING2):0,0\n'
    + 'FIELD:o_city_prior_addr:TYPE(STRING40):0,0\n'
    + 'FIELD:o_zip_prior_addr:TYPE(STRING10):0,0\n'
    + 'FIELD:o_county_prior_addr:TYPE(STRING30):0,0\n'
    + 'FIELD:o_country_prior_addr:TYPE(STRING3):0,0\n'
    + 'FIELD:count_addr_in:TYPE(INTEGER1):0,0\n'
    + 'FIELD:order_indicator:TYPE(STRING1):0,0\n'
    + 'FIELD:test_prod_indicator:TYPE(STRING1):0,0\n'
    + 'FIELD:report_usage_code:TYPE(STRING2):0,0\n'
    + 'FIELD:type_of_business:TYPE(STRING2):0,0\n'
    + 'FIELD:i_state_specific_account:TYPE(STRING1):0,0\n'
    + 'FIELD:first_vendor:TYPE(STRING1):0,0\n'
    + 'FIELD:second_vendor:TYPE(STRING1):0,0\n'
    + 'FIELD:final_vendor:TYPE(STRING10):0,0\n'
    + 'FIELD:vendor_switch_condition:TYPE(STRING1):0,0\n'
    + 'FIELD:dupe_keys_selected:TYPE(INTEGER4):0,0\n'
    + 'FIELD:enhanced_dob:TYPE(STRING1):0,0\n'
    + 'FIELD:letter_indicator:TYPE(STRING1):0,0\n'
    + 'FIELD:dupe_vendor_flag:TYPE(STRING2):0,0\n'
    + 'FIELD:inquiry_single_order:TYPE(STRING1):0,0\n'
    + 'FIELD:individual_beacon_score:TYPE(STRING5):0,0\n'
    + 'FIELD:score_type_indicator:TYPE(STRING2):0,0\n'
    + 'FIELD:carrier_cnt:TYPE(INTEGER1):0,0\n'
    + 'FIELD:record_version:TYPE(DECIMAL3):0,0\n'
    + 'FIELD:reference_number:TYPE(STRING16):0,0\n'
    + 'FIELD:original_reference_number:TYPE(STRING14):0,0\n'
    + 'FIELD:bill_location_code:TYPE(STRING1):0,0\n'
    + 'FIELD:billing_type_id:TYPE(INTEGER1):0,0\n'
    + 'FIELD:price:TYPE(DECIMAL10):0,0\n'
    + 'FIELD:currency:TYPE(INTEGER1):0,0\n'
    + 'FIELD:pricing_error_code:TYPE(INTEGER4):0,0\n'
    + 'FIELD:free:TYPE(INTEGER1):0,0\n'
    + 'FIELD:result_format:TYPE(STRING9):0,0\n'
    + 'FIELD:report_options:TYPE(UNSIGNED8):0,0\n'
    + 'FIELD:transaction_code:TYPE(INTEGER4):0,0\n'
    + 'FIELD:return_node_id:TYPE(STRING9):0,0\n'
    + 'FIELD:request_node_id:TYPE(STRING9):0,0\n'
    + 'FIELD:order_status_code:TYPE(INTEGER4):0,0\n'
    + 'FIELD:product_line:TYPE(STRING3):0,0\n'
    + 'FIELD:login_history_id:TYPE(INTEGER4):0,0\n'
    + 'FIELD:ip_address:TYPE(STRING20):0,0\n'
    + 'FIELD:response_time:TYPE(DECIMAL5):0,0\n'
    + 'FIELD:esp_method:TYPE(STRING40):0,0\n'
    + 'FIELD:batch_job_id:TYPE(INTEGER4):0,0\n'
    + 'FIELD:batch_seq_number:TYPE(INTEGER4):0,0\n'
    + 'FIELD:is_active:TYPE(INTEGER1):0,0\n'
    + 'FIELD:credit_public_records_verified:TYPE(INTEGER1):0,0\n'
    + 'FIELD:user_added:TYPE(STRING60):0,0\n'
    + 'FIELD:user_changed:TYPE(STRING60):0,0\n'
    + 'FIELD:date_changed:TYPE(STRING19):0,0\n'
    + 'FIELD:scoring_algo_name:TYPE(STRING20):0,0\n'
    + 'FIELD:scoring_algo_score:TYPE(STRING20):0,0\n'
    + 'FIELD:case_number:TYPE(INTEGER4):0,0\n'
    + 'FIELD:release_date:TYPE(STRING19):0,0\n'
    + 'FIELD:permissible_purpose:TYPE(STRING40):0,0\n'
    ;
 
  // Structured values
  EXPORT linkpaths := DATASET([
    ],{STRING linkpath;STRING compulsory;STRING optional;STRING bonus;STRING required;STRING search});
 
END;
