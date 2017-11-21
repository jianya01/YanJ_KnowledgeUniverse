// Machine-readable versions of the spec file and subsets thereof
IMPORT SALT38;
EXPORT GenerationMod := MODULE(SALT38.iGenerationMod)
 
  // SALT Version info
  EXPORT salt_VERSION := 'V3.8.1';
  EXPORT salt_MODULE := 'SALT38'; // Optional override by HACK:SALTMODULE
  EXPORT salt_TOOLSMODULE := 'SALTTOOLS30'; // Optional override by HACK:SALTTOOLSMODULE
 
  // Core module configuration values
  EXPORT spc_MODULE := 'I_dd_transaction_log';
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
    + 'MODULE:I_dd_transaction_log\n'
    + 'FILENAME:Vault\n'
    + 'INGESTFILE:OFPU:NAMED(Source)\n'
    + 'RIDFIELD:vault_rid\n'
    + 'SOURCERIDFIELD:vault_UID_Hash\n'
    + 'FIELD:vault_date_first_seen:RECORDDATE(FIRST):\n'
    + 'FIELD:vault_date_last_seen:RECORDDATE(LAST):\n'
    + 'INGESTMODE:NONCONTIGUOUS(vault_date_first_seen,vault_date_last_seen)\n'
    + '\n'
    + 'FIELD:vault_uid_hash:TYPE(INTEGER8):0,0\n'
    + 'FIELD:transaction_id:TYPE(STRING20):0,0\n'
    + 'FIELD:product_id:TYPE(INTEGER8):0,0\n'
    + 'FIELD:date_added:TYPE(STRING22):0,0\n'
    + 'FIELD:service_type:TYPE(STRING1):0,0\n'
    + 'FIELD:special_billing_id:TYPE(STRING20):0,0\n'
    + 'FIELD:report_code:TYPE(STRING4):0,0\n'
    + 'FIELD:report_usage:TYPE(STRING4):0,0\n'
    + 'FIELD:requestor:TYPE(STRING30):0,0\n'
    + 'FIELD:reference_number:TYPE(STRING20):0,0\n'
    + 'FIELD:account_base:TYPE(STRING8):0,0\n'
    + 'FIELD:account_suffix:TYPE(STRING3):0,0\n'
    + 'FIELD:account_id:TYPE(INTEGER8):0,0\n'
    + 'FIELD:customer_id:TYPE(INTEGER8):0,0\n'
    + 'FIELD:anchor_transaction_id:TYPE(STRING20):0,0\n'
    + 'FIELD:anchor_product_id:TYPE(INTEGER8):0,0\n'
    + 'FIELD:full_quote_back:TYPE(STRING60):0,0\n'
    + 'FIELD:i_date_ordered:TYPE(STRING30):0,0\n'
    + 'FIELD:i_addr_house_num:TYPE(STRING10):0,0\n'
    + 'FIELD:i_addr_apt_num:TYPE(STRING10):0,0\n'
    + 'FIELD:i_addr_line:TYPE(STRING50):0,0\n'
    + 'FIELD:i_addr_state:TYPE(STRING10):0,0\n'
    + 'FIELD:i_addr_zip:TYPE(STRING10):0,0\n'
    + 'FIELD:i_addr_city:TYPE(STRING50):0,0\n'
    + 'FIELD:i_addr_county:TYPE(STRING50):0,0\n'
    + 'FIELD:i_addr_country:TYPE(STRING10):0,0\n'
    + 'FIELD:i_addr_type:TYPE(INTEGER8):0,0\n'
    + 'FIELD:addr_household_sur_name:TYPE(STRING30):0,0\n'
    + 'FIELD:listed_driver_count:TYPE(INTEGER8):0,0\n'
    + 'FIELD:confirmed_count:TYPE(INTEGER8):0,0\n'
    + 'FIELD:not_confirmed_count:TYPE(INTEGER8):0,0\n'
    + 'FIELD:not_found_count:TYPE(INTEGER8):0,0\n'
    + 'FIELD:discovered_surname_count:TYPE(INTEGER8):0,0\n'
    + 'FIELD:discovered_surname_exception_count:TYPE(INTEGER8):0,0\n'
    + 'FIELD:result_format:TYPE(STRING9):0,0\n'
    + 'FIELD:record_version:TYPE(REAL8):0,0\n'
    + 'FIELD:processing_status:TYPE(STRING1):0,0\n'
    + 'FIELD:inquiry_status:TYPE(STRING1):0,0\n'
    + 'FIELD:inquiry_processing_status:TYPE(STRING1):0,0\n'
    + 'FIELD:billing_type_id:TYPE(INTEGER8):0,0\n'
    + 'FIELD:price:TYPE(REAL8):0,0\n'
    + 'FIELD:currency:TYPE(INTEGER8):0,0\n'
    + 'FIELD:pricing_error_code:TYPE(INTEGER4):0,0\n'
    + 'FIELD:free:TYPE(INTEGER8):0,0\n'
    + 'FIELD:report_options:TYPE(STRING10):0,0\n'
    + 'FIELD:transaction_code:TYPE(INTEGER4):0,0\n'
    + 'FIELD:return_node_id:TYPE(STRING9):0,0\n'
    + 'FIELD:request_node_id:TYPE(STRING9):0,0\n'
    + 'FIELD:order_status_code:TYPE(INTEGER4):0,0\n'
    + 'FIELD:product_line:TYPE(STRING3):0,0\n'
    + 'FIELD:login_history_id:TYPE(INTEGER8):0,0\n'
    + 'FIELD:ip_address:TYPE(STRING20):0,0\n'
    + 'FIELD:response_time:TYPE(STRING22):0,0\n'
    + 'FIELD:esp_method:TYPE(STRING40):0,0\n'
    + 'FIELD:batch_job_id:TYPE(INTEGER4):0,0\n'
    + 'FIELD:batch_seq_number:TYPE(INTEGER4):0,0\n'
    + 'FIELD:is_active:TYPE(INTEGER8):0,0\n'
    + 'FIELD:user_added:TYPE(STRING60):0,0\n'
    + 'FIELD:user_changed:TYPE(STRING60):0,0\n'
    + 'FIELD:date_changed:TYPE(STRING22):0,0\n'
    + '\n'
    ;
 
  // Structured values
  EXPORT linkpaths := DATASET([
    ],{STRING linkpath;STRING compulsory;STRING optional;STRING bonus;STRING required;STRING search});
 
END;
