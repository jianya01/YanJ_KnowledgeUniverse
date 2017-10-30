// Machine-readable versions of the spec file and subsets thereof
EXPORT GenerationMod := MODULE
 
  // SALT Version info
  EXPORT salt_VERSION := 'V3.8.0';
  EXPORT salt_MODULE := 'SALT38'; // Optional override by HACK:SALTMODULE
  EXPORT salt_TOOLSMODULE := 'SALTTOOLS30'; // Optional override by HACK:SALTTOOLSMODULE
 
  // Core module configuration values
  EXPORT spc_MODULE := 'I_CDSC_transaction_log';
  EXPORT spc_NAMESCOPE := '';
  EXPORT spc_PROCESS := '';
  EXPORT spc_IDNAME := ''; // cluster id (input)
  EXPORT spc_IDFIELD := ''; // cluster id (output)
  EXPORT spc_RIDFIELD := 'vault_rid'; // record id
 
  // The entire spec file
  EXPORT spcString :=
    'OPTIONS:-gn\n'
    + 'MODULE:I_CDSC_transaction_log\n'
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
    + 'FIELD:service_type:TYPE(STRING1):0,0\n'
    + 'FIELD:special_billing_id:TYPE(STRING20):0,0\n'
    + 'FIELD:report_code:TYPE(STRING4):0,0\n'
    + 'FIELD:customer_number:TYPE(INTEGER4):0,0\n'
    + 'FIELD:order_point_company_number:TYPE(STRING9):0,0\n'
    + 'FIELD:full_quote_back:TYPE(STRING60):0,0\n'
    + 'FIELD:i_date_ordered:TYPE(STRING20):0,0\n'
    + 'FIELD:count_person_in:TYPE(INTEGER3):0,0\n'
    + 'FIELD:count_person_used:TYPE(INTEGER3):0,0\n'
    + 'FIELD:i_addr1_house_num:TYPE(STRING9):0,0\n'
    + 'FIELD:i_addr1_apt_num:TYPE(STRING5):0,0\n'
    + 'FIELD:i_addr1_line:TYPE(STRING20):0,0\n'
    + 'FIELD:i_addr1_state:TYPE(STRING2):0,0\n'
    + 'FIELD:i_addr1_zip:TYPE(STRING10):0,0\n'
    + 'FIELD:i_addr1_city:TYPE(STRING50):0,0\n'
    + 'FIELD:i_addr1_county:TYPE(STRING50):0,0\n'
    + 'FIELD:i_addr1_country:TYPE(STRING3):0,0\n'
    + 'FIELD:i_addr1_type:TYPE(INTEGER3):0,0\n'
    + 'FIELD:i_addr2_house_num:TYPE(STRING9):0,0\n'
    + 'FIELD:i_addr2_apt_num:TYPE(STRING5):0,0\n'
    + 'FIELD:i_addr2_line:TYPE(STRING20):0,0\n'
    + 'FIELD:i_addr2_state:TYPE(STRING2):0,0\n'
    + 'FIELD:i_addr2_zip:TYPE(STRING10):0,0\n'
    + 'FIELD:i_addr2_city:TYPE(STRING50):0,0\n'
    + 'FIELD:i_addr2_county:TYPE(STRING50):0,0\n'
    + 'FIELD:i_addr2_country:TYPE(STRING3):0,0\n'
    + 'FIELD:i_addr2_type:TYPE(INTEGER3):0,0\n'
    + 'FIELD:i_addr3_line:TYPE(STRING20):0,0\n'
    + 'FIELD:i_addr3_house_num:TYPE(STRING9):0,0\n'
    + 'FIELD:i_addr3_apt_num:TYPE(STRING5):0,0\n'
    + 'FIELD:i_addr3_state:TYPE(STRING2):0,0\n'
    + 'FIELD:i_addr3_zip:TYPE(STRING10):0,0\n'
    + 'FIELD:i_addr3_city:TYPE(STRING50):0,0\n'
    + 'FIELD:i_addr3_county:TYPE(STRING50):0,0\n'
    + 'FIELD:i_addr3_country:TYPE(STRING3):0,0\n'
    + 'FIELD:i_addr3_type:TYPE(INTEGER3):0,0\n'
    + 'FIELD:count_addr_in:TYPE(INTEGER3):0,0\n'
    + 'FIELD:count_addr_used:TYPE(INTEGER3):0,0\n'
    + 'FIELD:count_vehicle_in:TYPE(INTEGER3):0,0\n'
    + 'FIELD:count_vehicle_used:TYPE(INTEGER3):0,0\n'
    + 'FIELD:vin_d_code:TYPE(STRING1):0,0\n'
    + 'FIELD:jua_ltr_code:TYPE(STRING1):0,0\n'
    + 'FIELD:prc_founds:TYPE(UNSIGNED3):0,0\n'
    + 'FIELD:addit_driver_reported:TYPE(UNSIGNED3):0,0\n'
    + 'FIELD:prior_inquiry_found:TYPE(INTEGER3):0,0\n'
    + 'FIELD:dd_flag:TYPE(STRING1):0,0\n'
    + 'FIELD:policy_number:TYPE(STRING20):0,0\n'
    + 'FIELD:inq_hist_claims:TYPE(INTEGER3):0,0\n'
    + 'FIELD:count_claims_found:TYPE(INTEGER3):0,0\n'
    + 'FIELD:count_claims_reported:TYPE(INTEGER3):0,0\n'
    + 'FIELD:requestor_type:TYPE(STRING1):0,0\n'
    + 'FIELD:test_prod_indicator:TYPE(STRING1):0,0\n'
    + 'FIELD:iso_vm:TYPE(STRING10):0,0\n'
    + 'FIELD:line_id:TYPE(STRING10):0,0\n'
    + 'FIELD:inquiry_history_records_added:TYPE(UNSIGNED3):0,0\n'
    + 'FIELD:processing_comments:TYPE(STRING40):0,0\n'
    + 'FIELD:record_version:TYPE(REAL8):0,0\n'
    + 'FIELD:reference_number:TYPE(STRING20):0,0\n'
    + 'FIELD:processing_status:TYPE(STRING2):0,0\n'
    + 'FIELD:billing_type_id:TYPE(INTEGER3):0,0\n'
    + 'FIELD:price:TYPE(REAL8):0,0\n'
    + 'FIELD:currency:TYPE(INTEGER3):0,0\n'
    + 'FIELD:pricing_error_code:TYPE(INTEGER3):0,0\n'
    + 'FIELD:free:TYPE(INTEGER3):0,0\n'
    + 'FIELD:record_count:TYPE(REAL8):0,0\n'
    + 'FIELD:result_format:TYPE(STRING20):0,0\n'
    + 'FIELD:report_options:TYPE(STRING255):0,0\n'
    + 'FIELD:transaction_code:TYPE(INTEGER3):0,0\n'
    + 'FIELD:return_node_id:TYPE(STRING9):0,0\n'
    + 'FIELD:request_node_id:TYPE(STRING9):0,0\n'
    + 'FIELD:order_status_code:TYPE(INTEGER3):0,0\n'
    + 'FIELD:product_line:TYPE(STRING3):0,0\n'
    + 'FIELD:login_history_id:TYPE(INTEGER3):0,0\n'
    + 'FIELD:ip_address:TYPE(STRING20):0,0\n'
    + 'FIELD:response_time:TYPE(STRING22):0,0\n'
    + 'FIELD:esp_method:TYPE(STRING22):0,0\n'
    + 'FIELD:batch_job_id:TYPE(INTEGER3):0,0\n'
    + 'FIELD:batch_seq_number:TYPE(INTEGER3):0,0\n'
    + 'FIELD:is_active:TYPE(INTEGER3):0,0\n'
    + 'FIELD:user_added:TYPE(STRING30):0,0\n'
    + 'FIELD:user_changed:TYPE(STRING30):0,0\n'
    + 'FIELD:date_changed:TYPE(STRING30):0,0\n'
    + '// CONCEPT statements should be used to group together interellated fields; such as address\n'
    + '// RELATIONSHIP is used to find non-obvious relationships between the clusters\n'
    + '// SOURCEFIELD is used if a field of the file denotes a source of the records in that file\n'
    + '// LINKPATH is used to define access paths for external linking\n'
    ;
 
  // Structured values
  EXPORT linkpaths := DATASET([
    ],{STRING linkpath;STRING compulsory;STRING optional;STRING bonus;STRING required;STRING search});
 
END;
