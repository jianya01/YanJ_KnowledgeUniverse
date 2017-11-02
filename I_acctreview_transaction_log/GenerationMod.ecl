// Machine-readable versions of the spec file and subsets thereof
EXPORT GenerationMod := MODULE
 
  // SALT Version info
  EXPORT salt_VERSION := 'V3.8.0';
  EXPORT salt_MODULE := 'SALT38'; // Optional override by HACK:SALTMODULE
  EXPORT salt_TOOLSMODULE := 'SALTTOOLS30'; // Optional override by HACK:SALTTOOLSMODULE
 
  // Core module configuration values
  EXPORT spc_MODULE := 'I_acctreview_transaction_log';
  EXPORT spc_NAMESCOPE := '';
  EXPORT spc_PROCESS := '';
  EXPORT spc_IDNAME := ''; // cluster id (input)
  EXPORT spc_IDFIELD := ''; // cluster id (output)
  EXPORT spc_RIDFIELD := 'vault_rid'; // record id
 
  // The entire spec file
  EXPORT spcString :=
    'OPTIONS:-gn\n'
    + 'MODULE:I_acctreview_transaction_log\n'
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
    + 'FIELD:reference_number:TYPE(STRING20):0,0\n'
    + 'FIELD:status:TYPE(STRING3):0,0\n'
    + 'FIELD:reorder_status:TYPE(STRING1):0,0\n'
    + 'FIELD:review_date:TYPE(STRING22):0,0\n'
    + 'FIELD:i_person_first_name:TYPE(STRING20):0,0\n'
    + 'FIELD:i_person_last_name:TYPE(STRING20):0,0\n'
    + 'FIELD:i_person_middle_name:TYPE(STRING20):0,0\n'
    + 'FIELD:i_person_name_suffix:TYPE(STRING5):0,0\n'
    + 'FIELD:i_addr_line:TYPE(STRING90):0,0\n'
    + 'FIELD:i_addr_city:TYPE(STRING50):0,0\n'
    + 'FIELD:i_addr_state:TYPE(STRING2):0,0\n'
    + 'FIELD:i_addr_zip:TYPE(STRING10):0,0\n'
    + 'FIELD:i_addr_zip_ext:TYPE(STRING4):0,0\n'
    + 'FIELD:i_person_ssn:TYPE(STRING9):0,0\n'
    + 'FIELD:i_person_dob:TYPE(STRING8):0,0\n'
    + 'FIELD:customer_number:TYPE(INTEGER4):0,0\n'
    + 'FIELD:vendor:TYPE(STRING3):0,0\n'
    + 'FIELD:member_number:TYPE(STRING15):0,0\n'
    + 'FIELD:i_spouse_first_name:TYPE(STRING20):0,0\n'
    + 'FIELD:i_spouse_last_name:TYPE(STRING20):0,0\n'
    + 'FIELD:i_spouse_middle_name:TYPE(STRING20):0,0\n'
    + 'FIELD:i_spouse_name_suffix:TYPE(STRING5):0,0\n'
    + 'FIELD:login_id:TYPE(STRING60):0,0\n'
    + 'FIELD:is_active:TYPE(INTEGER3):0,0\n'
    + 'FIELD:user_added:TYPE(STRING30):0,0\n'
    + 'FIELD:user_changed:TYPE(STRING30):0,0\n'
    + 'FIELD:date_added:TYPE(STRING22):0,0\n'
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
