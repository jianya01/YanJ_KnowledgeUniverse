// Machine-readable versions of the spec file and subsets thereof
EXPORT GenerationMod := MODULE
 
  // SALT Version info
  EXPORT salt_VERSION := 'V3.8.0';
  EXPORT salt_MODULE := 'SALT38'; // Optional override by HACK:SALTMODULE
  EXPORT salt_TOOLSMODULE := 'SALTTOOLS30'; // Optional override by HACK:SALTTOOLSMODULE
 
  // Core module configuration values
  EXPORT spc_MODULE := 'I_cc_transaction_log';
  EXPORT spc_NAMESCOPE := '';
  EXPORT spc_PROCESS := '';
  EXPORT spc_IDNAME := ''; // cluster id (input)
  EXPORT spc_IDFIELD := ''; // cluster id (output)
  EXPORT spc_RIDFIELD := 'vault_rid'; // record id
 
  // The entire spec file
  EXPORT spcString :=
    'OPTIONS:-gn\n'
    + 'MODULE:I_cc_transaction_log\n'
    + 'FILENAME:Vault \n'
    + 'INGESTFILE:SRC:NAMED(Source) \n'
    + 'RIDFIELD:vault_rid\n'
    + 'SOURCERIDFIELD:vault_uid_hash\n'
    + 'FIELD:vault_date_first_seen:RECORDDATE(FIRST):\n'
    + 'FIELD:vault_date_last_seen:RECORDDATE(LAST):\n'
    + 'INGESTMODE:NONCONTIGUOUS(vault_date_first_seen,vault_date_last_seen)\n'
    + '\n'
    + 'FIELD:vault_uid_hash:TYPE(DATA16):0,0\n'
    + 'FIELD:transaction_id:TYPE(STRING20):0,0\n'
    + 'FIELD:product_id:TYPE(INTEGER4):0,0\n'
    + 'FIELD:cc_type_ind:TYPE(STRING1):0,0\n'
    + 'FIELD:am_best_name:TYPE(STRING20):0,0\n'
    + 'FIELD:group_name:TYPE(STRING60):0,0\n'
    + 'FIELD:report_code:TYPE(STRING4):0,0\n'
    + 'FIELD:billing_report_code:TYPE(STRING4):0,0\n'
    + 'FIELD:account_id:TYPE(INTEGER4):0,0\n'
    + 'FIELD:account_base:TYPE(STRING8):0,0\n'
    + 'FIELD:account_suffix:TYPE(STRING3):0,0\n'
    + 'FIELD:customer_number:TYPE(INTEGER4):0,0\n'
    + 'FIELD:anchor_product:TYPE(STRING3):0,0\n'
    + 'FIELD:inq_proc_err_nbr:TYPE(STRING4):0,0\n'
    + 'FIELD:prior_plcy_cnt:TYPE(STRING3):0,0\n'
    + 'FIELD:curr_plcy_cnt:TYPE(STRING3):0,0\n'
    + 'FIELD:secdry_reptg_thrshld:TYPE(STRING3):0,0\n'
    + 'FIELD:secdry_reptg_ind:TYPE(STRING1):0,0\n'
    + 'FIELD:rpt_usage_cd:TYPE(STRING2):0,0\n'
    + 'FIELD:prev_addr_cd:TYPE(STRING1):0,0\n'
    + 'FIELD:spcl_billing_ind:TYPE(STRING1):0,0\n'
    + 'FIELD:posting_indicator:TYPE(STRING1):0,0\n'
    + 'FIELD:policies_reported:TYPE(INTEGER4):0,0\n'
    + 'FIELD:policies_received:TYPE(INTEGER4):0,0\n'
    + 'FIELD:full_quote_back:TYPE(STRING60):0,0\n'
    + 'FIELD:last_name:TYPE(STRING20):0,0\n'
    + 'FIELD:middle_name:TYPE(STRING20):0,0\n'
    + 'FIELD:first_name:TYPE(STRING20):0,0\n'
    + 'FIELD:ssn:TYPE(STRING10):0,0\n'
    + 'FIELD:count_subject_in:TYPE(INTEGER4):0,0\n'
    + 'FIELD:count_addresses_in:TYPE(INTEGER4):0,0\n'
    + 'FIELD:count_addresses_used:TYPE(INTEGER4):0,0\n'
    + 'FIELD:dl_current:TYPE(STRING15):0,0\n'
    + 'FIELD:dl_prior:TYPE(STRING15):0,0\n'
    + 'FIELD:state_subject:TYPE(STRING2):0,0\n'
    + 'FIELD:record_version:TYPE(REAL8):0,0\n'
    + 'FIELD:special_billing_id:TYPE(STRING20):0,0\n'
    + 'FIELD:date_ordered:TYPE(STRING20):0,0\n'
    + 'FIELD:reference_number:TYPE(STRING20):0,0\n'
    + 'FIELD:processing_status:TYPE(STRING2):0,0\n'
    + 'FIELD:billing_type_id:TYPE(INTEGER3):0,0\n'
    + 'FIELD:price:TYPE(REAL8):0,0\n'
    + 'FIELD:pricing_error_code:TYPE(INTEGER3):0,0\n'
    + 'FIELD:free:TYPE(INTEGER3):0,0\n'
    + 'FIELD:result_format:TYPE(STRING20):0,0\n'
    + 'FIELD:report_options:TYPE(STRING255):0,0\n'
    + 'FIELD:transaction_code:TYPE(INTEGER3):0,0\n'
    + 'FIELD:return_node_id:TYPE(STRING9):0,0\n'
    + 'FIELD:request_node_id:TYPE(STRING9):0,0\n'
    + 'FIELD:order_status_code:TYPE(INTEGER3):0,0\n'
    + 'FIELD:original_service_type:TYPE(STRING1):0,0\n'
    + 'FIELD:contributor_type_code:TYPE(STRING1):0,0\n'
    + 'FIELD:report_as_code:TYPE(STRING1):0,0\n'
    + 'FIELD:order_type:TYPE(STRING1):0,0\n'
    + 'FIELD:login_history_id:TYPE(INTEGER3):0,0\n'
    + 'FIELD:ip_address:TYPE(STRING20):0,0\n'
    + 'FIELD:response_time:TYPE(STRING22):0,0\n'
    + 'FIELD:esp_method:TYPE(STRING22):0,0\n'
    + 'FIELD:batch_job_id:TYPE(INTEGER3):0,0\n'
    + 'FIELD:batch_seq_number:TYPE(INTEGER3):0,0\n'
    + 'FIELD:user_added:TYPE(STRING30):0,0\n'
    + 'FIELD:date_added:TYPE(STRING22):0,0\n'
    + 'FIELD:user_changed:TYPE(STRING30):0,0\n'
    + 'FIELD:date_changed:TYPE(STRING30):0,0\n'
    + 'FIELD:is_active:TYPE(INTEGER3):0,0\n'
    + '// CONCEPT statements should be used to group together interellated fields; such as address\n'
    + '// RELATIONSHIP is used to find non-obvious relationships between the clusters\n'
    + '// SOURCEFIELD is used if a field of the file denotes a source of the records in that file\n'
    + '// LINKPATH is used to define access paths for external linking\n'
    ;
 
  // Structured values
  EXPORT linkpaths := DATASET([
    ],{STRING linkpath;STRING compulsory;STRING optional;STRING bonus;STRING required;STRING search});
 
END;
