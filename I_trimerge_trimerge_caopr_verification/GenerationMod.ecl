// Machine-readable versions of the spec file and subsets thereof
IMPORT SALT38;
EXPORT GenerationMod := MODULE(SALT38.iGenerationMod)
 
  // SALT Version info
  EXPORT salt_VERSION := 'V3.8.1';
  EXPORT salt_MODULE := 'SALT38'; // Optional override by HACK:SALTMODULE
  EXPORT salt_TOOLSMODULE := 'SALTTOOLS30'; // Optional override by HACK:SALTTOOLSMODULE
 
  // Core module configuration values
  EXPORT spc_MODULE := 'I_trimerge_trimerge_caopr_verification';
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
    + 'MODULE:I_trimerge_trimerge_caopr_verification\n'
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
    + 'FIELD:transaction_id:TYPE(STRING20):0,0\n'
    + 'FIELD:credit_public_record_id:TYPE(STRING50):0,0\n'
    + 'FIELD:caopr_record_type_id:TYPE(INTEGER4):0,0\n'
    + 'FIELD:record_ordered:TYPE(STRING30):0,0\n'
    + 'FIELD:search_results:TYPE(STRING50):0,0\n'
    + 'FIELD:type_of_search:TYPE(STRING50):0,0\n'
    + 'FIELD:date_of_search:TYPE(STRING19):0,0\n'
    + 'FIELD:search_period_start:TYPE(STRING19):0,0\n'
    + 'FIELD:search_period_end:TYPE(STRING19):0,0\n'
    + 'FIELD:address_covered:TYPE(STRING200):0,0\n'
    + 'FIELD:court_name:TYPE(STRING100):0,0\n'
    + 'FIELD:court_location:TYPE(STRING255):0,0\n'
    + 'FIELD:subject_first_name:TYPE(STRING50):0,0\n'
    + 'FIELD:subject_middle_name:TYPE(STRING50):0,0\n'
    + 'FIELD:subject_last_name:TYPE(STRING50):0,0\n'
    + 'FIELD:subject_suffix:TYPE(STRING10):0,0\n'
    + 'FIELD:subject_ssn:TYPE(STRING9):0,0\n'
    + 'FIELD:subject_address:TYPE(STRING200):0,0\n'
    + 'FIELD:subject_verified:TYPE(STRING2):0,0\n'
    + 'FIELD:comments:TYPE(STRING):0,0\n'
    + 'FIELD:remarks:TYPE(STRING):0,0\n'
    + 'FIELD:is_verified:TYPE(INTEGER1):0,0\n'
    + 'FIELD:date_verified:TYPE(STRING19):0,0\n'
    + 'FIELD:user_verified:TYPE(STRING30):0,0\n'
    + 'FIELD:date_added:TYPE(STRING19):0,0\n'
    + 'FIELD:user_added:TYPE(STRING30):0,0\n'
    + 'FIELD:date_changed:TYPE(STRING19):0,0\n'
    + 'FIELD:user_changed:TYPE(STRING30):0,0\n'
    ;
 
  // Structured values
  EXPORT linkpaths := DATASET([
    ],{STRING linkpath;STRING compulsory;STRING optional;STRING bonus;STRING required;STRING search});
 
END;
