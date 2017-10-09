// Machine-readable versions of the spec file and subsets thereof
IMPORT SALT38;
EXPORT GenerationMod := MODULE(SALT38.iGenerationMod)
 
  // SALT Version info
  EXPORT salt_VERSION := 'V3.8.1';
  EXPORT salt_MODULE := 'SALT38'; // Optional override by HACK:SALTMODULE
  EXPORT salt_TOOLSMODULE := 'SALTTOOLS30'; // Optional override by HACK:SALTTOOLSMODULE
 
  // Core module configuration values
  EXPORT spc_MODULE := 'I_rules_transaction_log_police';
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
    + 'MODULE:I_rules_transaction_log_police\n'
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
    + 'FIELD:agency_type:TYPE(STRING40):0,0\n'
    + 'FIELD:order_id:TYPE(STRING20):0,0\n'
    + 'FIELD:claim_number:TYPE(STRING40):0,0\n'
    + 'FIELD:claim_state:TYPE(STRING2):0,0\n'
    + 'FIELD:date_loss:TYPE(STRING19):0,0\n'
    + 'FIELD:report_type:TYPE(STRING40):0,0\n'
    + 'FIELD:policy_number:TYPE(STRING40):0,0\n'
    + 'FIELD:return_options:TYPE(STRING40):0,0\n'
    + 'FIELD:order_type:TYPE(STRING40):0,0\n'
    + 'FIELD:initial_status:TYPE(STRING40):0,0\n'
    + 'FIELD:date_returned:TYPE(STRING19):0,0\n'
    + 'FIELD:data_elements:TYPE(STRING40):0,0\n'
    + 'FIELD:return:TYPE(STRING40):0,0\n'
    + 'FIELD:report_available:TYPE(STRING40):0,0\n'
    + 'FIELD:date_added:TYPE(STRING25):0,0\n'
    + 'FIELD:agency_name:TYPE(STRING200):0,0\n'
    ;
 
  // Structured values
  EXPORT linkpaths := DATASET([
    ],{STRING linkpath;STRING compulsory;STRING optional;STRING bonus;STRING required;STRING search});
 
END;
