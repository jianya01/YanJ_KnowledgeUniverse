﻿// Machine-readable versions of the spec file and subsets thereof
IMPORT SALT38;
EXPORT GenerationMod := MODULE(SALT38.iGenerationMod)
 
  // SALT Version info
  EXPORT salt_VERSION := 'V3.8.1';
  EXPORT salt_MODULE := 'SALT38'; // Optional override by HACK:SALTMODULE
  EXPORT salt_TOOLSMODULE := 'SALTTOOLS30'; // Optional override by HACK:SALTTOOLSMODULE
 
  // Core module configuration values
  EXPORT spc_MODULE := 'I_mbsi_fcra_translog_model';
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
    + 'MODULE:I_mbsi_fcra_translog_model\n'
    + 'FILENAME:Vault\n'
    + 'INGESTFILE:OFPU:NAMED(Source)\n'
    + 'RIDFIELD:vault_rid\n'
    + 'SOURCERIDFIELD:vault_uid_hash\n'
    + 'FIELD:vault_date_first_seen:RECORDDATE(FIRST):\n'
    + 'FIELD:vault_date_last_seen:RECORDDATE(LAST):\n'
    + 'INGESTMODE:NONCONTIGUOUS(vault_date_first_seen,vault_date_last_seen)\n'
    + '\n'
    + 'FIELD:vault_uid_hash:TYPE(DATA16):0,0\n'
    + 'FIELD:transaction_id:TYPE(STRING60):0,0\n'
    + 'FIELD:sequence:TYPE(INTEGER4):0,0\n'
    + 'FIELD:score_model:TYPE(STRING4):0,0\n'
    + 'FIELD:score_model_version:TYPE(STRING1):0,0\n'
    + 'FIELD:report_code:TYPE(STRING4):0,0\n'
    + 'FIELD:processing_status:TYPE(STRING6):0,0\n'
    + 'FIELD:score:TYPE(INTEGER4):0,0\n'
    + 'FIELD:reasoncode_01:TYPE(STRING4):0,0\n'
    + 'FIELD:reasoncode_01_text:TYPE(STRING255):0,0\n'
    + 'FIELD:reasoncode_02:TYPE(STRING4):0,0\n'
    + 'FIELD:reasoncode_02_text:TYPE(STRING255):0,0\n'
    + 'FIELD:reasoncode_03:TYPE(STRING4):0,0\n'
    + 'FIELD:reasoncode_03_text:TYPE(STRING255):0,0\n'
    + 'FIELD:reasoncode_04:TYPE(STRING4):0,0\n'
    + 'FIELD:reasoncode_04_text:TYPE(STRING255):0,0\n'
    + 'FIELD:date_added:TYPE(STRING19):0,0\n'
    + 'FIELD:customer_input_flg:TYPE(STRING1):0,0\n'
    + '\n'
    ;
 
  // Structured values
  EXPORT linkpaths := DATASET([
    ],{STRING linkpath;STRING compulsory;STRING optional;STRING bonus;STRING required;STRING search});
 
END;