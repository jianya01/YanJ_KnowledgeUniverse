﻿// Machine-readable versions of the spec file and subsets thereof
IMPORT SALT38;
EXPORT GenerationMod := MODULE(SALT38.iGenerationMod)
 
  // SALT Version info
  EXPORT salt_VERSION := 'V3.8.1';
  EXPORT salt_MODULE := 'SALT38'; // Optional override by HACK:SALTMODULE
  EXPORT salt_TOOLSMODULE := 'SALTTOOLS30'; // Optional override by HACK:SALTTOOLSMODULE
 
  // Core module configuration values
  EXPORT spc_MODULE := 'I_trimerge_trimerge_caopr_verification_judgement';
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
    + 'MODULE:I_trimerge_trimerge_caopr_verification_judgement\n'
    + 'FILENAME:Vault\n'
    + 'INGESTFILE:OFPU:NAMED(Source)\n'
    + 'RIDFIELD:vault_rid\n'
    + 'SOURCERIDFIELD:vault_uid_hash\n'
    + 'FIELD:vault_date_first_seen:RECORDDATE(FIRST):\n'
    + 'FIELD:vault_date_last_seen:RECORDDATE(LAST):\n'
    + 'INGESTMODE:NONCONTIGUOUS(vault_date_first_seen,vault_date_last_seen)\n'
    + '\n'
    + 'FIELD:vault_uid_hash:TYPE(DATA16):0,0\n'
    + 'FIELD:verification_id:TYPE(INTEGER4):0,0\n'
    + 'FIELD:defendant_name:TYPE(STRING50):0,0\n'
    + 'FIELD:defendant_address:TYPE(STRING200):0,0\n'
    + 'FIELD:defendant_ssn:TYPE(STRING20):0,0\n'
    + 'FIELD:plaintiff:TYPE(STRING50):0,0\n'
    + 'FIELD:case_number:TYPE(STRING40):0,0\n'
    + 'FIELD:judgement_type:TYPE(INTEGER1):0,0\n'
    + 'FIELD:other_judgement_type:TYPE(STRING50):0,0\n'
    + 'FIELD:judgement_date:TYPE(STRING19):0,0\n'
    + 'FIELD:amount:TYPE(DECIMAL8):0,0\n'
    + 'FIELD:disposition:TYPE(STRING50):0,0\n'
    + 'FIELD:case_status:TYPE(STRING150):0,0\n'
    + 'FIELD:satisfied_date:TYPE(STRING19):0,0\n'
    + 'FIELD:satisfaction_document_number:TYPE(STRING50):0,0\n'
    + 'FIELD:date_added:TYPE(STRING19):0,0\n'
    + 'FIELD:user_added:TYPE(STRING30):0,0\n'
    + 'FIELD:date_changed:TYPE(STRING19):0,0\n'
    + 'FIELD:user_changed:TYPE(STRING30):0,0\n'
    ;
 
  // Structured values
  EXPORT linkpaths := DATASET([
    ],{STRING linkpath;STRING compulsory;STRING optional;STRING bonus;STRING required;STRING search});
 
END;