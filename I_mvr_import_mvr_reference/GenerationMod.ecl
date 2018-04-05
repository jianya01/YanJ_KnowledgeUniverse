// Machine-readable versions of the spec file and subsets thereof
IMPORT SALT38;
EXPORT GenerationMod := MODULE(SALT38.iGenerationMod)
 
  // SALT Version info
  EXPORT salt_VERSION := 'V3.8.1';
  EXPORT salt_MODULE := 'SALT38'; // Optional override by HACK:SALTMODULE
  EXPORT salt_TOOLSMODULE := 'SALTTOOLS30'; // Optional override by HACK:SALTTOOLSMODULE
 
  // Core module configuration values
  EXPORT spc_MODULE := 'I_mvr_import_mvr_reference';
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
    + 'MODULE:I_mvr_import_mvr_reference\n'
    + 'FILENAME:Vault\n'
    + 'INGESTFILE:OFPU:NAMED(Source)\n'
    + 'RIDFIELD:vault_rid\n'
    + 'SOURCERIDFIELD:vault_uid_hash\n'
    + 'FIELD:vault_date_first_seen:RECORDDATE(FIRST):\n'
    + 'FIELD:vault_date_last_seen:RECORDDATE(LAST):\n'
    + 'INGESTMODE:NONCONTIGUOUS(vault_date_first_seen,vault_date_last_seen)\n'
    + '\n'
    + 'FIELD:vault_uid_hash:TYPE(DATA16):0,0\n'
    + 'FIELD:import_ref_value_id:TYPE(STRING25):0,0\n'
    + 'FIELD:data_type:TYPE(STRING30):0,0\n'
    + 'FIELD:data_code:TYPE(STRING100):0,0\n'
    + 'FIELD:data_state_postal_code:TYPE(STRING2):0,0\n'
    + 'FIELD:data_source_code:TYPE(STRING5):0,0\n'
    + 'FIELD:data_translation1:TYPE(STRING100):0,0\n'
    + 'FIELD:data_translation2:TYPE(STRING100):0,0\n'
    + 'FIELD:data_translation3:TYPE(STRING100):0,0\n'
    + 'FIELD:data_translation4:TYPE(STRING100):0,0\n'
    + 'FIELD:data_translation5:TYPE(STRING100):0,0\n'
    + 'FIELD:data_translation6:TYPE(STRING100):0,0\n'
    + 'FIELD:data_translation7:TYPE(STRING100):0,0\n'
    + 'FIELD:data_translation8:TYPE(STRING100):0,0\n'
    + 'FIELD:data_translation9:TYPE(STRING100):0,0\n'
    + 'FIELD:data_translation10:TYPE(STRING100):0,0\n'
    + 'FIELD:date_added:TYPE(STRING19):0,0\n'
    + 'FIELD:user_added:TYPE(STRING40):0,0\n'
    + 'FIELD:process_status:TYPE(STRING1):0,0\n'
    + 'FIELD:process_date:TYPE(STRING19):0,0\n'
    + 'FIELD:process_reference_id:TYPE(INTEGER8):0,0\n'
    + 'FIELD:process_priority:TYPE(INTEGER4):0,0\n'
    ;
 
  // Structured values
  EXPORT linkpaths := DATASET([
    ],{STRING linkpath;STRING compulsory;STRING optional;STRING bonus;STRING required;STRING search});
 
END;
