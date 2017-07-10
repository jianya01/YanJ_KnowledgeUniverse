// Machine-readable versions of the spec file and subsets thereof
EXPORT GenerationMod := MODULE
 
  // SALT Version info
  EXPORT salt_VERSION := 'V3.8.0';
  EXPORT salt_MODULE := 'SALT38'; // Optional override by HACK:SALTMODULE
  EXPORT salt_TOOLSMODULE := 'SALTTOOLS30'; // Optional override by HACK:SALTTOOLSMODULE
 
  // Core module configuration values
  EXPORT spc_MODULE := 'I_dataenh_transaction_log_batch_summary';
  EXPORT spc_NAMESCOPE := '';
  EXPORT spc_PROCESS := '';
  EXPORT spc_IDNAME := ''; // cluster id (input)
  EXPORT spc_IDFIELD := ''; // cluster id (output)
  EXPORT spc_RIDFIELD := 'vault_rid'; // record id
 
  // The entire spec file
  EXPORT spcString :=
    'OPTIONS:-gn\n'
    + 'MODULE:I_dataenh_transaction_log_batch_summary\n'
    + 'FILENAME:Vault\n'
    + 'INGESTFILE:SRCF:NAMED(Source)\n'
    + 'RIDFIELD:vault_rid\n'
    + 'SOURCERIDFIELD:vault_UID_Hash\n'
    + 'FIELD:vault_date_first_seen:RECORDDATE(FIRST):\n'
    + 'FIELD:vault_date_last_seen:RECORDDATE(LAST):\n'
    + 'INGESTMODE:NONCONTIGUOUS(vault_date_first_seen,vault_date_last_seen)\n'
    + 'FIELD:vault_uid_hash:TYPE(INTEGER8):0,0\n'
    + 'FIELD:batch_job_id:TYPE(STRING11):0,0\n'
    + 'FIELD:product_id:TYPE(STRING11):0,0\n'
    + 'FIELD:start_time:TYPE(STRING22):0,0\n'
    + 'FIELD:end_time:TYPE(STRING22):0,0\n'
    + 'FIELD:total_process_time:TYPE(STRING20):0,0\n'
    + 'FIELD:account:TYPE(STRING9):0,0\n'
    + 'FIELD:total_order:TYPE(STRING11):0,0\n'
    + 'FIELD:hits:TYPE(STRING11):0,0\n'
    + 'FIELD:no_hits:TYPE(STRING11):0,0\n'
    + 'FIELD:errors:TYPE(STRING11):0,0\n'
    + 'FIELD:date_added:TYPE(STRING22):0,0\n'
    ;
 
  // Structured values
  EXPORT linkpaths := DATASET([
    ],{STRING linkpath;STRING compulsory;STRING optional;STRING bonus;STRING required;STRING search});
 
END;
