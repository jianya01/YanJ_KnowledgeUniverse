// Machine-readable versions of the spec file and subsets thereof
IMPORT SALT38;
EXPORT GenerationMod := MODULE(SALT38.iGenerationMod)
 
  // SALT Version info
  EXPORT salt_VERSION := 'V3.8.1';
  EXPORT salt_MODULE := 'SALT38'; // Optional override by HACK:SALTMODULE
  EXPORT salt_TOOLSMODULE := 'SALTTOOLS30'; // Optional override by HACK:SALTTOOLSMODULE
 
  // Core module configuration values
  EXPORT spc_MODULE := 'I_rules_transaction_log';
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
    + 'MODULE:I_rules_transaction_log\n'
    + 'FILENAME:Vault\n'
    + 'INGESTFILE:SRTL:NAMED(Source)\n'
    + 'RIDFIELD:vault_rid\n'
    + 'SOURCERIDFIELD:vault_uid_hash\n'
    + 'FIELD:vault_date_first_seen:RECORDDATE(FIRST):\n'
    + 'FIELD:vault_date_last_seen:RECORDDATE(LAST):\n'
    + 'INGESTMODE:NONCONTIGUOUS(vault_date_first_seen,vault_date_last_seen)\n'
    + '\n'
    + 'FIELD:vault_uid_hash:TYPE(DATA16):0,0\n'
    + 'FIELD:transaction_id:TYPE(STRING60):0,0\n'
    + 'FIELD:client_order_id:TYPE(STRING20):0,0\n'
    + 'FIELD:rules_product_id:TYPE(INTEGER4):0,0\n'
    + 'FIELD:date_added:TYPE(STRING19):0,0\n'
    + 'FIELD:switch_fee_indicator:TYPE(STRING1):0,0\n'
    + 'FIELD:login_id:TYPE(STRING60):0,0\n'
    + 'FIELD:special_billing_id:TYPE(STRING60):0,0\n'
    + 'FIELD:function_name:TYPE(STRING30):0,0\n'
    + 'FIELD:report_code:TYPE(STRING4):0,0\n'
    + 'FIELD:account_base:TYPE(STRING8):0,0\n'
    + 'FIELD:account_suffix:TYPE(STRING3):0,0\n'
    + 'FIELD:vendor_account_base:TYPE(STRING8):0,0\n'
    + 'FIELD:vendor_account_suffix:TYPE(STRING3):0,0\n'
    + 'FIELD:account_id:TYPE(INTEGER4):0,0\n'
    + 'FIELD:customer_number:TYPE(INTEGER4):0,0\n'
    + 'FIELD:full_quote_back:TYPE(STRING60):0,0\n'
    + 'FIELD:date_ordered:TYPE(STRING10):0,0\n'
    + 'FIELD:unique_id:TYPE(STRING32):0,0\n'
    + 'FIELD:unique_id_type:TYPE(INTEGER1):0,0\n'
    + 'FIELD:record_version:TYPE(DECIMAL3):0,0\n'
    + 'FIELD:reference_number:TYPE(STRING20):0,0\n'
    + 'FIELD:line_of_business:TYPE(STRING20):0,0\n'
    + 'FIELD:processing_status:TYPE(STRING6):0,0\n'
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
    + 'FIELD:response_time:TYPE(DECIMAL5):0,0\n'
    + 'FIELD:login_history_id:TYPE(INTEGER4):0,0\n'
    + 'FIELD:ip_address:TYPE(STRING20):0,0\n'
    + 'FIELD:batch_job_id:TYPE(INTEGER4):0,0\n'
    + 'FIELD:batch_seq_number:TYPE(INTEGER4):0,0\n'
    + 'FIELD:user_added:TYPE(STRING60):0,0\n'
    + 'FIELD:user_changed:TYPE(STRING60):0,0\n'
    + 'FIELD:date_changed:TYPE(STRING19):0,0\n'
    + 'FIELD:esp_method:TYPE(STRING40):0,0\n'
    + 'FIELD:account_type:TYPE(STRING1):0,0\n'
    + 'FIELD:bill_no_hit:TYPE(STRING1):0,0\n'
    + 'FIELD:glb_purpose:TYPE(INTEGER4):0,0\n'
    + 'FIELD:dppa_purpose:TYPE(INTEGER4):0,0\n'
    + 'FIELD:permissible_purpose:TYPE(INTEGER4):0,0\n'
    ;
 
  // Structured values
  EXPORT linkpaths := DATASET([
    ],{STRING linkpath;STRING compulsory;STRING optional;STRING bonus;STRING required;STRING search});
 
END;
