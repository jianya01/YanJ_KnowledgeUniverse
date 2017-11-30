﻿// Machine-readable versions of the spec file and subsets thereof
EXPORT GenerationMod := MODULE
 
  // SALT Version info
  EXPORT salt_VERSION := 'V3.8.0';
  EXPORT salt_MODULE := 'SALT38'; // Optional override by HACK:SALTMODULE
  EXPORT salt_TOOLSMODULE := 'SALTTOOLS30'; // Optional override by HACK:SALTTOOLSMODULE
 
  // Core module configuration values
  EXPORT spc_MODULE := 'I_mvr_transaction_log_billing';
  EXPORT spc_NAMESCOPE := '';
  EXPORT spc_PROCESS := '';
  EXPORT spc_IDNAME := ''; // cluster id (input)
  EXPORT spc_IDFIELD := ''; // cluster id (output)
  EXPORT spc_RIDFIELD := 'vault_rid'; // record id
 
  // The entire spec file
  EXPORT spcString :=
    'OPTIONS:-gn\n'
    + 'MODULE:I_mvr_transaction_log_billing\n'
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
    + 'FIELD:dmv_submission_date:TYPE(STRING19):0,0\n'
    + 'FIELD:pre_search_period_used:TYPE(STRING3):0,0\n'
    + 'FIELD:delivery_mode:TYPE(STRING1):0,0\n'
    + 'FIELD:no_charge_registry:TYPE(STRING1):0,0\n'
    + 'FIELD:renp_searched:TYPE(STRING1):0,0\n'
    + 'FIELD:sbaws_searched:TYPE(STRING1):0,0\n'
    + 'FIELD:force_dmv:TYPE(STRING1):0,0\n'
    + 'FIELD:no_dmv_request:TYPE(STRING1):0,0\n'
    + 'FIELD:amp_request:TYPE(STRING1):0,0\n'
    + 'FIELD:detail_type_1:TYPE(INTEGER1):0,0\n'
    + 'FIELD:detail_value_1:TYPE(STRING10):0,0\n'
    + 'FIELD:detail_type_2:TYPE(INTEGER1):0,0\n'
    + 'FIELD:detail_value_2:TYPE(STRING10):0,0\n'
    + 'FIELD:detail_type_3:TYPE(INTEGER1):0,0\n'
    + 'FIELD:detail_value_3:TYPE(STRING10):0,0\n'
    + 'FIELD:detail_type_4:TYPE(INTEGER1):0,0\n'
    + 'FIELD:detail_value_4:TYPE(STRING10):0,0\n'
    + 'FIELD:detail_type_5:TYPE(INTEGER1):0,0\n'
    + 'FIELD:detail_value_5:TYPE(STRING10):0,0\n'
    + 'FIELD:date_added:TYPE(STRING19):0,0\n'
    + '// CONCEPT statements should be used to group together interellated fields; such as address\n'
    + '// RELATIONSHIP is used to find non-obvious relationships between the clusters\n'
    + '// SOURCEFIELD is used if a field of the file denotes a source of the records in that file\n'
    + '// LINKPATH is used to define access paths for external linking\n'
    ;
 
  // Structured values
  EXPORT linkpaths := DATASET([
    ],{STRING linkpath;STRING compulsory;STRING optional;STRING bonus;STRING required;STRING search});
 
END;