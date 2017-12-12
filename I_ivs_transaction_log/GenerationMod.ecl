// Machine-readable versions of the spec file and subsets thereof
EXPORT GenerationMod := MODULE
 
  // SALT Version info
  EXPORT salt_VERSION := 'V3.8.0';
  EXPORT salt_MODULE := 'SALT38'; // Optional override by HACK:SALTMODULE
  EXPORT salt_TOOLSMODULE := 'SALTTOOLS30'; // Optional override by HACK:SALTTOOLSMODULE
 
  // Core module configuration values
  EXPORT spc_MODULE := 'I_ivs_transaction_log';
  EXPORT spc_NAMESCOPE := '';
  EXPORT spc_PROCESS := '';
  EXPORT spc_IDNAME := ''; // cluster id (input)
  EXPORT spc_IDFIELD := ''; // cluster id (output)
  EXPORT spc_RIDFIELD := 'vault_rid'; // record id
 
  // The entire spec file
  EXPORT spcString :=
    'OPTIONS:-gn\n'
    + 'MODULE:I_ivs_transaction_log\n'
    + 'FILENAME:Vault\n'
    + 'INGESTFILE:SRCF:NAMED(Source)\n'
    + 'RIDFIELD:vault_rid\n'
    + 'SOURCERIDFIELD:vault_uid_hash\n'
    + 'FIELD:vault_date_first_seen:RECORDDATE(FIRST):\n'
    + 'FIELD:vault_date_last_seen:RECORDDATE(LAST):\n'
    + 'INGESTMODE:NONCONTIGUOUS(vault_date_first_seen,vault_date_last_seen)\n'
    + '\n'
    + 'FIELD:vault_uid_hash:TYPE(DATA16):0,0\n'
    + 'FIELD:transaction_id:TYPE(STRING20):0,0\n'
    + 'FIELD:product_id:TYPE(INTEGER4):0,0\n'
    + 'FIELD:date_added:TYPE(STRING19):0,0\n'
    + 'FIELD:session_id:TYPE(STRING60):0,0\n'
    + 'FIELD:report_code:TYPE(STRING4):0,0\n'
    + 'FIELD:function_name:TYPE(STRING30):0,0\n'
    + 'FIELD:account_base:TYPE(STRING8):0,0\n'
    + 'FIELD:account_suffix:TYPE(STRING3):0,0\n'
    + 'FIELD:account_id:TYPE(INTEGER4):0,0\n'
    + 'FIELD:customer_number:TYPE(INTEGER4):0,0\n'
    + 'FIELD:i_originator:TYPE(STRING200):0,0\n'
    + 'FIELD:i_full_quote_back:TYPE(STRING60):0,0\n'
    + 'FIELD:i_state_tracking_number:TYPE(STRING50):0,0\n'
    + 'FIELD:i_date_ordered:TYPE(STRING10):0,0\n'
    + 'FIELD:i_verification_date:TYPE(STRING10):0,0\n'
    + 'FIELD:i_person_ssn:TYPE(STRING9):0,0\n'
    + 'FIELD:i_person_name_prefix:TYPE(STRING5):0,0\n'
    + 'FIELD:i_person_last_name:TYPE(STRING20):0,0\n'
    + 'FIELD:i_person_first_name:TYPE(STRING20):0,0\n'
    + 'FIELD:i_person_middle_name:TYPE(STRING20):0,0\n'
    + 'FIELD:i_person_name_suffix:TYPE(STRING5):0,0\n'
    + 'FIELD:i_person_dob:TYPE(STRING8):0,0\n'
    + 'FIELD:i_vin_state:TYPE(STRING2):0,0\n'
    + 'FIELD:i_vehicle_vin:TYPE(STRING20):0,0\n'
    + 'FIELD:i_policy_number:TYPE(STRING30):0,0\n'
    + 'FIELD:i_naic:TYPE(INTEGER4):0,0\n'
    + 'FIELD:i_request_reason_code:TYPE(STRING8):0,0\n'
    + 'FIELD:o_response_reason_code:TYPE(STRING8):0,0\n'
    + 'FIELD:o_policy_number:TYPE(STRING30):0,0\n'
    + 'FIELD:o_status:TYPE(INTEGER1):0,0\n'
    + 'FIELD:o_response_system:TYPE(INTEGER1):0,0\n'
    + 'FIELD:o_naic:TYPE(INTEGER4):0,0\n'
    + 'FIELD:o_response_rule_applied:TYPE(INTEGER4):0,0\n'
    + 'FIELD:o_vehicle_vin:TYPE(STRING20):0,0\n'
    + 'FIELD:o_vin_state:TYPE(STRING2):0,0\n'
    + 'FIELD:o_vin_basic_liability_limit:TYPE(DECIMAL8):0,0\n'
    + 'FIELD:o_vin_bodily_injury_limit:TYPE(DECIMAL8):0,0\n'
    + 'FIELD:o_vin_coverage_start_date:TYPE(STRING10):0,0\n'
    + 'FIELD:o_vin_coverage_end_date:TYPE(STRING10):0,0\n'
    + 'FIELD:o_vin_prior_coverage_start_date:TYPE(STRING10):0,0\n'
    + 'FIELD:o_vin_prior_coverage_end_date:TYPE(STRING10):0,0\n'
    + 'FIELD:o_vin_later_coverage_start_date:TYPE(STRING10):0,0\n'
    + 'FIELD:o_vin_later_coverage_end_date:TYPE(STRING10):0,0\n'
    + 'FIELD:result_format:TYPE(STRING9):0,0\n'
    + 'FIELD:record_version:TYPE(DECIMAL3):0,0\n'
    + 'FIELD:reference_number:TYPE(STRING20):0,0\n'
    + 'FIELD:processing_status:TYPE(STRING1):0,0\n'
    + 'FIELD:billing_type_id:TYPE(INTEGER1):0,0\n'
    + 'FIELD:price:TYPE(DECIMAL10):0,0\n'
    + 'FIELD:currency:TYPE(INTEGER1):0,0\n'
    + 'FIELD:pricing_error_code:TYPE(INTEGER4):0,0\n'
    + 'FIELD:free:TYPE(INTEGER1):0,0\n'
    + 'FIELD:report_options:TYPE(UNSIGNED8):0,0\n'
    + 'FIELD:transaction_code:TYPE(INTEGER4):0,0\n'
    + 'FIELD:return_node_id:TYPE(STRING9):0,0\n'
    + 'FIELD:request_node_id:TYPE(STRING9):0,0\n'
    + 'FIELD:order_status_code:TYPE(INTEGER4):0,0\n'
    + 'FIELD:product_line:TYPE(STRING3):0,0\n'
    + 'FIELD:login_history_id:TYPE(INTEGER4):0,0\n'
    + 'FIELD:ip_address:TYPE(STRING20):0,0\n'
    + 'FIELD:response_time:TYPE(DECIMAL5):0,0\n'
    + 'FIELD:ivs_response_time:TYPE(DECIMAL5):0,0\n'
    + 'FIELD:alirts_response_time:TYPE(DECIMAL5):0,0\n'
    + 'FIELD:ext_customer_number:TYPE(INTEGER4):0,0\n'
    + 'FIELD:ext_customer_number_type:TYPE(INTEGER1):0,0\n'
    + 'FIELD:esp_method:TYPE(STRING40):0,0\n'
    + 'FIELD:batch_job_id:TYPE(INTEGER4):0,0\n'
    + 'FIELD:batch_seq_number:TYPE(INTEGER4):0,0\n'
    + 'FIELD:user_added:TYPE(STRING60):0,0\n'
    + 'FIELD:user_changed:TYPE(STRING60):0,0\n'
    + 'FIELD:date_changed:TYPE(STRING19):0,0\n'
    + '// CONCEPT statements should be used to group together interellated fields; such as address\n'
    + '// RELATIONSHIP is used to find non-obvious relationships between the clusters\n'
    + '// SOURCEFIELD is used if a field of the file denotes a source of the records in that file\n'
    + '// LINKPATH is used to define access paths for external linking\n'
    ;
 
  // Structured values
  EXPORT linkpaths := DATASET([
    ],{STRING linkpath;STRING compulsory;STRING optional;STRING bonus;STRING required;STRING search});
 
END;
