﻿// Machine-readable versions of the spec file and subsets thereof
IMPORT SALT38;
EXPORT GenerationMod := MODULE(SALT38.iGenerationMod)
 
  // SALT Version info
  EXPORT salt_VERSION := 'V3.8.1';
  EXPORT salt_MODULE := 'SALT38'; // Optional override by HACK:SALTMODULE
  EXPORT salt_TOOLSMODULE := 'SALTTOOLS30'; // Optional override by HACK:SALTTOOLSMODULE
 
  // Core module configuration values
  EXPORT spc_MODULE := 'I_mbsi_nonfcra_transaction_log_address';
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
    + 'MODULE:I_mbsi_nonfcra_transaction_log_address\n'
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
    + 'FIELD:date_added:TYPE(STRING19):0,0\n'
    + 'FIELD:person_seq:TYPE(INTEGER1):0,0\n'
    + 'FIELD:business_seq:TYPE(INTEGER1):0,0\n'
    + 'FIELD:address_seq:TYPE(INTEGER1):0,0\n'
    + 'FIELD:address_classification:TYPE(STRING2):0,0\n'
    + 'FIELD:address_type:TYPE(STRING10):0,0\n'
    + 'FIELD:address_line1:TYPE(STRING90):0,0\n'
    + 'FIELD:address_line2:TYPE(STRING90):0,0\n'
    + 'FIELD:address_line3:TYPE(STRING90):0,0\n'
    + 'FIELD:address_house_no:TYPE(STRING9):0,0\n'
    + 'FIELD:address_street_name:TYPE(STRING20):0,0\n'
    + 'FIELD:address_apt_no:TYPE(STRING5):0,0\n'
    + 'FIELD:address_city:TYPE(STRING20):0,0\n'
    + 'FIELD:address_state:TYPE(STRING20):0,0\n'
    + 'FIELD:address_zip:TYPE(STRING5):0,0\n'
    + 'FIELD:address_zip_ext:TYPE(STRING4):0,0\n'
    + '\n'
    ;
 
  // Structured values
  EXPORT linkpaths := DATASET([
    ],{STRING linkpath;STRING compulsory;STRING optional;STRING bonus;STRING required;STRING search});
 
END;
