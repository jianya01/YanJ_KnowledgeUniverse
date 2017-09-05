// Machine-readable versions of the spec file and subsets thereof
EXPORT GenerationMod := MODULE
 
  // SALT Version info
  EXPORT salt_VERSION := 'V3.8.0';
  EXPORT salt_MODULE := 'SALT38'; // Optional override by HACK:SALTMODULE
  EXPORT salt_TOOLSMODULE := 'SALTTOOLS30'; // Optional override by HACK:SALTTOOLSMODULE
 
  // Core module configuration values
  EXPORT spc_MODULE := 'I_cc_transaction_log_policy';
  EXPORT spc_NAMESCOPE := '';
  EXPORT spc_PROCESS := '';
  EXPORT spc_IDNAME := ''; // cluster id (input)
  EXPORT spc_IDFIELD := ''; // cluster id (output)
  EXPORT spc_RIDFIELD := 'vault_rid'; // record id
 
  // The entire spec file
  EXPORT spcString :=
    'OPTIONS:-gn\n'
    + 'MODULE:I_cc_transaction_log_policy\n'
    + 'FILENAME:Vault\n'
    + 'INGESTFILE:SRCF:NAMED(Source)\n'
    + 'RIDFIELD:vault_rid\n'
    + 'SOURCERIDFIELD:vault_uid_hash\n'
    + 'FIELD:vault_date_first_seen:RECORDDATE(FIRST):\n'
    + 'FIELD:vault_date_last_seen:RECORDDATE(LAST):\n'
    + 'INGESTMODE:NONCONTIGUOUS(vault_date_first_seen,vault_date_last_seen)\n'
    + '\n'
    + '\n'
    + 'FIELD:vault_uid_hash:TYPE(DATA16):0,0\n'
    + 'FIELD:transaction_id:TYPE(STRING20):0,0\n'
    + 'FIELD:sequence:TYPE(STRING4):0,0\n'
    + 'FIELD:status:TYPE(STRING1):0,0\n'
    + 'FIELD:state:TYPE(STRING2):0,0\n'
    + 'FIELD:am_best:TYPE(STRING6):0,0\n'
    + 'FIELD:policy_number:TYPE(STRING20):0,0\n'
    + 'FIELD:policy_type:TYPE(STRING2):0,0\n'
    + 'FIELD:policy_inception_date:TYPE(STRING10):0,0\n'
    + 'FIELD:policy_begin_date:TYPE(STRING10):0,0\n'
    + 'FIELD:policy_cancel_date:TYPE(STRING10):0,0\n'
    + 'FIELD:policy_end_date:TYPE(STRING10):0,0\n'
    + 'FIELD:last_cancel_reason:TYPE(STRING4):0,0\n'
    + 'FIELD:insurance_type:TYPE(STRING2):0,0\n'
    + 'FIELD:suppressed:TYPE(STRING1):0,0\n'
    + 'FIELD:naic:TYPE(STRING5):0,0\n'
    + 'FIELD:risk_type:TYPE(STRING1):0,0\n'
    + 'FIELD:carrier_name:TYPE(STRING30):0,0\n'
    + 'FIELD:date_added:TYPE(STRING20):0,0\n'
    + '// CONCEPT statements should be used to group together interellated fields; such as address\n'
    + '// RELATIONSHIP is used to find non-obvious relationships between the clusters\n'
    + '// SOURCEFIELD is used if a field of the file denotes a source of the records in that file\n'
    + '// LINKPATH is used to define access paths for external linking\n'
    ;
 
  // Structured values
  EXPORT linkpaths := DATASET([
    ],{STRING linkpath;STRING compulsory;STRING optional;STRING bonus;STRING required;STRING search});
 
END;
