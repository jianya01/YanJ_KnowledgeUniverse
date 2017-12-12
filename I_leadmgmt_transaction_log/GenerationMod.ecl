// Machine-readable versions of the spec file and subsets thereof
EXPORT GenerationMod := MODULE
 
  // SALT Version info
  EXPORT salt_VERSION := 'V3.8.0';
  EXPORT salt_MODULE := 'SALT38'; // Optional override by HACK:SALTMODULE
  EXPORT salt_TOOLSMODULE := 'SALTTOOLS30'; // Optional override by HACK:SALTTOOLSMODULE
 
  // Core module configuration values
  EXPORT spc_MODULE := 'I_leadmgmt_transaction_log';
  EXPORT spc_NAMESCOPE := '';
  EXPORT spc_PROCESS := '';
  EXPORT spc_IDNAME := ''; // cluster id (input)
  EXPORT spc_IDFIELD := ''; // cluster id (output)
  EXPORT spc_RIDFIELD := 'vault_rid'; // record id
 
  // The entire spec file
  EXPORT spcString :=
    'OPTIONS:-gn\n'
    + 'MODULE:I_leadmgmt_transaction_log\n'
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
    + 'FIELD:date_added:TYPE(STRING22):0,0\n'
    + 'FIELD:login_id:TYPE(STRING60):0,0\n'
    + 'FIELD:billing_code:TYPE(STRING20):0,0\n'
    + 'FIELD:function_name:TYPE(STRING30):0,0\n'
    + 'FIELD:report_code:TYPE(STRING4):0,0\n'
    + 'FIELD:account_base:TYPE(STRING8):0,0\n'
    + 'FIELD:account_suffix:TYPE(STRING3):0,0\n'
    + 'FIELD:account_id:TYPE(INTEGER4):0,0\n'
    + 'FIELD:customer_number:TYPE(INTEGER4):0,0\n'
    + 'FIELD:source_account_base:TYPE(STRING8):0,0\n'
    + 'FIELD:source_account_suffix:TYPE(STRING3):0,0\n'
    + 'FIELD:source_account_id:TYPE(INTEGER4):0,0\n'
    + 'FIELD:source_customer_number:TYPE(INTEGER4):0,0\n'
    + 'FIELD:customer_reference_code:TYPE(STRING60):0,0\n'
    + 'FIELD:i_date_ordered:TYPE(STRING10):0,0\n'
    + 'FIELD:i_source_lead_id:TYPE(STRING50):0,0\n'
    + 'FIELD:i_target_business_line:TYPE(STRING2):0,0\n'
    + 'FIELD:i_lead_price:TYPE(REAL8):0,0\n'
    + 'FIELD:i_person_first_name:TYPE(STRING20):0,0\n'
    + 'FIELD:i_person_middle_name:TYPE(STRING20):0,0\n'
    + 'FIELD:i_person_last_name:TYPE(STRING20):0,0\n'
    + 'FIELD:i_person_name_suffix:TYPE(STRING5):0,0\n'
    + 'FIELD:i_person_ssn:TYPE(STRING9):0,0\n'
    + 'FIELD:i_dl_state:TYPE(STRING2):0,0\n'
    + 'FIELD:i_dl_number:TYPE(STRING25):0,0\n'
    + 'FIELD:i_person_dob:TYPE(STRING8):0,0\n'
    + 'FIELD:i_addr_line:TYPE(STRING90):0,0\n'
    + 'FIELD:i_addr_city:TYPE(STRING50):0,0\n'
    + 'FIELD:i_addr_state:TYPE(STRING2):0,0\n'
    + 'FIELD:i_addr_zip:TYPE(STRING10):0,0\n'
    + 'FIELD:i_addr_country:TYPE(STRING3):0,0\n'
    + 'FIELD:i_phone_1:TYPE(STRING10):0,0\n'
    + 'FIELD:i_phone_2:TYPE(STRING10):0,0\n'
    + 'FIELD:i_phone_3:TYPE(STRING10):0,0\n'
    + 'FIELD:i_email:TYPE(STRING50):0,0\n'
    + 'FIELD:i_person_gender:TYPE(STRING1):0,0\n'
    + 'FIELD:scoring_marketview_maybecount:TYPE(STRING2):0,0\n'
    + 'FIELD:scoring_marketview_passcount:TYPE(STRING2):0,0\n'
    + 'FIELD:scoring_marketview_failcount:TYPE(STRING2):0,0\n'
    + 'FIELD:scoring_email:TYPE(STRING1):0,0\n'
    + 'FIELD:scoring_instantid:TYPE(STRING1):0,0\n'
    + 'FIELD:scoring_carrierdisc:TYPE(STRING1):0,0\n'
    + 'FIELD:on_do_not_solicit:TYPE(STRING1):0,0\n'
    + 'FIELD:is_duplicate:TYPE(STRING1):0,0\n'
    + 'FIELD:append_vehicle_count:TYPE(STRING5):0,0\n'
    + 'FIELD:append_driver_count:TYPE(STRING5):0,0\n'
    + 'FIELD:append_hsi_score:TYPE(STRING5):0,0\n'
    + 'FIELD:append_hsi_message:TYPE(STRING255):0,0\n'
    + 'FIELD:append_watercraft:TYPE(STRING1):0,0\n'
    + 'FIELD:processing_status:TYPE(STRING6):0,0\n'
    + 'FIELD:reject_reason_code:TYPE(STRING6):0,0\n'
    + 'FIELD:billing_type_id:TYPE(INTEGER3):0,0\n'
    + 'FIELD:price:TYPE(REAL8):0,0\n'
    + 'FIELD:currency:TYPE(INTEGER3):0,0\n'
    + 'FIELD:pricing_error_code:TYPE(INTEGER4):0,0\n'
    + 'FIELD:free:TYPE(INTEGER3):0,0\n'
    + 'FIELD:ln_lead_id:TYPE(STRING50):0,0\n'
    + 'FIELD:record_version:TYPE(REAL8):0,0\n'
    + 'FIELD:reference_number:TYPE(STRING20):0,0\n'
    + 'FIELD:request_format:TYPE(STRING9):0,0\n'
    + 'FIELD:result_format:TYPE(STRING9):0,0\n'
    + 'FIELD:request_node_id:TYPE(STRING9):0,0\n'
    + 'FIELD:return_node_id:TYPE(STRING9):0,0\n'
    + 'FIELD:report_options:TYPE(STRING10):0,0\n'
    + 'FIELD:transaction_code:TYPE(INTEGER4):0,0\n'
    + 'FIELD:order_status_code:TYPE(INTEGER4):0,0\n'
    + 'FIELD:login_history_id:TYPE(INTEGER4):0,0\n'
    + 'FIELD:ip_address:TYPE(STRING20):0,0\n'
    + 'FIELD:response_time:TYPE(STRING22):0,0\n'
    + 'FIELD:esp_method:TYPE(STRING40):0,0\n'
    + 'FIELD:batch_job_id:TYPE(INTEGER4):0,0\n'
    + 'FIELD:batch_seq_number:TYPE(INTEGER4):0,0\n'
    + 'FIELD:user_added:TYPE(STRING60):0,0\n'
    + 'FIELD:user_changed:TYPE(STRING60):0,0\n'
    + 'FIELD:date_changed:TYPE(STRING22):0,0\n'
    + '// CONCEPT statements should be used to group together interellated fields; such as address\n'
    + '// RELATIONSHIP is used to find non-obvious relationships between the clusters\n'
    + '// SOURCEFIELD is used if a field of the file denotes a source of the records in that file\n'
    + '// LINKPATH is used to define access paths for external linking\n'
    ;
 
  // Structured values
  EXPORT linkpaths := DATASET([
    ],{STRING linkpath;STRING compulsory;STRING optional;STRING bonus;STRING required;STRING search});
 
END;
