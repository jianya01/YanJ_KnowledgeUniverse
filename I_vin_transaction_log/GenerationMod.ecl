// Machine-readable versions of the spec file and subsets thereof
EXPORT GenerationMod := MODULE
 
  // SALT Version info
  EXPORT salt_VERSION := 'V3.8.0';
  EXPORT salt_MODULE := 'SALT38'; // Optional override by HACK:SALTMODULE
  EXPORT salt_TOOLSMODULE := 'SALTTOOLS30'; // Optional override by HACK:SALTTOOLSMODULE
 
  // Core module configuration values
  EXPORT spc_MODULE := 'I_vin_transaction_log';
  EXPORT spc_NAMESCOPE := '';
  EXPORT spc_PROCESS := '';
  EXPORT spc_IDNAME := ''; // cluster id (input)
  EXPORT spc_IDFIELD := ''; // cluster id (output)
  EXPORT spc_RIDFIELD := 'vault_rid'; // record id
 
  // The entire spec file
  EXPORT spcString :=
    'OPTIONS:-gn\n'
    + 'MODULE:I_vin_transaction_log\n'
    + 'FILENAME:Vault\n'
    + 'INGESTFILE:SRCF:NAMED(Source)\n'
    + 'RIDFIELD:vault_rid\n'
    + 'SOURCERIDFIELD:vault_uid_hash\n'
    + 'FIELD:vault_date_first_seen:RECORDDATE(FIRST):\n'
    + 'FIELD:vault_date_last_seen:RECORDDATE(LAST):\n'
    + 'INGESTMODE:NONCONTIGUOUS(vault_date_first_seen,vault_date_last_seen)\n'
    + '\n'
    + 'FIELD:vault_uid_hash:TYPE(DATA16):0,0\n'
    + 'FIELD:lexid:TYPE(UNSIGNED8):0,0\n'
    + 'FIELD:customer_nbr:TYPE(STRING5):0,0\n'
    + 'FIELD:transaction_id:TYPE(STRING20):0,0\n'
    + 'FIELD:date_added:TYPE(STRING19):0,0\n'
    + 'FIELD:report_code:TYPE(STRING4):0,0\n'
    + 'FIELD:account_base:TYPE(STRING8):0,0\n'
    + 'FIELD:account_suffix:TYPE(STRING3):0,0\n'
    + 'FIELD:full_quote_back:TYPE(STRING60):0,0\n'
    + 'FIELD:name_prefix:TYPE(STRING5):0,0\n'
    + 'FIELD:last_name:TYPE(STRING20):0,0\n'
    + 'FIELD:first_name:TYPE(STRING20):0,0\n'
    + 'FIELD:middle_name:TYPE(STRING20):0,0\n'
    + 'FIELD:name_suffix:TYPE(STRING5):0,0\n'
    + 'FIELD:record_version:TYPE(REAL8):0,0\n'
    + 'FIELD:dob:TYPE(STRING12):0,0\n'
    + 'FIELD:special_billing_id:TYPE(STRING20):0,0\n'
    + 'FIELD:date_ordered:TYPE(STRING20):0,0\n'
    + 'FIELD:reference_number:TYPE(STRING15):0,0\n'
    + 'FIELD:processing_status:TYPE(STRING6):0,0\n'
    + 'FIELD:name_type:TYPE(STRING6):0,0\n'
    + 'FIELD:count_subject_in:TYPE(INTEGER8):0,0\n'
    + 'FIELD:billing_type_id:TYPE(INTEGER8):0,0\n'
    + 'FIELD:price:TYPE(REAL8):0,0\n'
    + 'FIELD:pricing_error_code:TYPE(INTEGER8):0,0\n'
    + 'FIELD:free:TYPE(INTEGER8):0,0\n'
    + 'FIELD:result_format:TYPE(STRING9):0,0\n'
    + 'FIELD:report_options:TYPE(STRING255):0,0\n'
    + 'FIELD:transaction_code:TYPE(INTEGER8):0,0\n'
    + 'FIELD:vins_inquiry:TYPE(INTEGER8):0,0\n'
    + 'FIELD:vins_matched:TYPE(INTEGER8):0,0\n'
    + 'FIELD:vins_developed:TYPE(INTEGER8):0,0\n'
    + 'FIELD:return_node_id:TYPE(STRING9):0,0\n'
    + 'FIELD:order_status_code:TYPE(INTEGER8):0,0\n'
    + 'FIELD:report_service_type:TYPE(STRING3):0,0\n'
    + 'FIELD:address_type:TYPE(STRING3):0,0\n'
    + 'FIELD:product_line:TYPE(STRING3):0,0\n'
    + 'FIELD:vin:TYPE(STRING20):0,0\n'
    + 'FIELD:vehicle_year:TYPE(STRING4):0,0\n'
    + 'FIELD:vehicle_make:TYPE(STRING30):0,0\n'
    + 'FIELD:vehicle_model:TYPE(STRING30):0,0\n'
    + 'FIELD:vehicle_plate_data:TYPE(STRING10):0,0\n'
    + 'FIELD:vehicle_state:TYPE(STRING4):0,0\n'
    + 'FIELD:line_address:TYPE(STRING90):0,0\n'
    + 'FIELD:state_address:TYPE(STRING4):0,0\n'
    + 'FIELD:zip_address:TYPE(STRING10):0,0\n'
    + 'FIELD:city_address:TYPE(STRING50):0,0\n'
    + 'FIELD:county_address:TYPE(STRING50):0,0\n'
    + 'FIELD:country_address:TYPE(STRING3):0,0\n'
    + 'FIELD:login_history_id:TYPE(INTEGER8):0,0\n'
    + 'FIELD:ip_address:TYPE(STRING20):0,0\n'
    + 'FIELD:response_time:TYPE(REAL8):0,0\n'
    + 'FIELD:esp_method:TYPE(STRING20):0,0\n'
    + 'FIELD:batch_job_id:TYPE(INTEGER8):0,0\n'
    + 'FIELD:batch_seq_number:TYPE(INTEGER8):0,0\n'
    + 'FIELD:is_active:TYPE(INTEGER4):0,0\n'
    + 'FIELD:user_added:TYPE(STRING30):0,0\n'
    + 'FIELD:user_changed:TYPE(STRING30):0,0\n'
    + 'FIELD:date_changed:TYPE(STRING22):0,0\n'
    + 'FIELD:address_id:TYPE(UNSIGNED8):0,0\n'
    + 'FIELD:prim_range:TYPE(STRING10):0,0\n'
    + 'FIELD:predir:TYPE(STRING2):0,0\n'
    + 'FIELD:prim_name:TYPE(STRING28):0,0\n'
    + 'FIELD:addr_suffix:TYPE(STRING4):0,0\n'
    + 'FIELD:postdir:TYPE(STRING2):0,0\n'
    + 'FIELD:unit_desig:TYPE(STRING10):0,0\n'
    + 'FIELD:sec_range:TYPE(STRING8):0,0\n'
    + 'FIELD:city:TYPE(STRING25):0,0\n'
    + 'FIELD:st:TYPE(STRING2):0,0\n'
    + 'FIELD:zip:TYPE(STRING5):0,0\n'
    + 'FIELD:zip4:TYPE(STRING4):0,0\n'
    + '// CONCEPT statements should be used to group together interellated fields; such as address\n'
    + '// RELATIONSHIP is used to find non-obvious relationships between the clusters\n'
    + '// SOURCEFIELD is used if a field of the file denotes a source of the records in that file\n'
    + '// LINKPATH is used to define access paths for external linking\n'
    ;
 
  // Structured values
  EXPORT linkpaths := DATASET([
    ],{STRING linkpath;STRING compulsory;STRING optional;STRING bonus;STRING required;STRING search});
 
END;
