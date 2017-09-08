// Machine-readable versions of the spec file and subsets thereof
IMPORT SALT38;
EXPORT GenerationMod := MODULE(SALT38.iGenerationMod)
 
  // SALT Version info
  EXPORT salt_VERSION := 'V3.8.1';
  EXPORT salt_MODULE := 'SALT38'; // Optional override by HACK:SALTMODULE
  EXPORT salt_TOOLSMODULE := 'SALTTOOLS30'; // Optional override by HACK:SALTTOOLSMODULE
 
  // Core module configuration values
  EXPORT spc_MODULE := 'I_Key_BocaShell_Did';
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
    + 'MODULE:I_Key_BocaShell_Did\n'
    + 'FILENAME:Vault\n'
    + 'INGESTFILE:OFPU:NAMED(Source)\n'
    + 'RIDFIELD:vault_rid\n'
    + 'SOURCERIDFIELD:vault_UID_Hash\n'
    + 'FIELD:vault_date_first_seen:RECORDDATE(FIRST):\n'
    + 'FIELD:vault_date_last_seen:RECORDDATE(LAST):\n'
    + 'INGESTMODE:NONCONTIGUOUS(vault_date_first_seen,vault_date_last_seen)\n'
    + '\n'
    + 'FIELD:vault_uid_hash:TYPE(INTEGER8):0,0\n'
    + 'FIELD:did:TYPE(UNSIGNED6):0,0\n'
    + 'FIELD:criminal_count:TYPE(UNSIGNED1):0,0\n'
    + 'FIELD:last_criminal_date:TYPE(UNSIGNED4):0,0\n'
    + 'FIELD:felony_count:TYPE(UNSIGNED1):0,0\n'
    + 'FIELD:last_felony_date:TYPE(UNSIGNED4):0,0\n'
    + 'FIELD:criminal_count30:TYPE(UNSIGNED1):0,0\n'
    + 'FIELD:criminal_count90:TYPE(UNSIGNED1):0,0\n'
    + 'FIELD:criminal_count180:TYPE(UNSIGNED1):0,0\n'
    + 'FIELD:criminal_count12:TYPE(UNSIGNED1):0,0\n'
    + 'FIELD:criminal_count24:TYPE(UNSIGNED1):0,0\n'
    + 'FIELD:criminal_count36:TYPE(UNSIGNED1):0,0\n'
    + 'FIELD:criminal_count60:TYPE(UNSIGNED1):0,0\n'
    + 'FIELD:crim_case_num:TYPE(STRING35):0,0\n'
    + 'FIELD:arrests_count:TYPE(UNSIGNED1):0,0\n'
    + 'FIELD:date_last_arrest:TYPE(UNSIGNED4):0,0\n'
    + 'FIELD:arrests_count30:TYPE(UNSIGNED1):0,0\n'
    + 'FIELD:arrests_count90:TYPE(UNSIGNED1):0,0\n'
    + 'FIELD:arrests_count180:TYPE(UNSIGNED1):0,0\n'
    + 'FIELD:arrests_count12:TYPE(UNSIGNED1):0,0\n'
    + 'FIELD:arrests_count24:TYPE(UNSIGNED1):0,0\n'
    + 'FIELD:arrests_count36:TYPE(UNSIGNED1):0,0\n'
    + 'FIELD:arrests_count60:TYPE(UNSIGNED1):0,0\n'
    + '\n'
    ;
 
  // Structured values
  EXPORT linkpaths := DATASET([
    ],{STRING linkpath;STRING compulsory;STRING optional;STRING bonus;STRING required;STRING search});
 
END;
