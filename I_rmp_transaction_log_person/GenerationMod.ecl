// Machine-readable versions of the spec file and subsets thereof
EXPORT GenerationMod := MODULE
 
  // SALT Version info
  EXPORT salt_VERSION := 'V3.8.0';
  EXPORT salt_MODULE := 'SALT38'; // Optional override by HACK:SALTMODULE
  EXPORT salt_TOOLSMODULE := 'SALTTOOLS30'; // Optional override by HACK:SALTTOOLSMODULE
 
  // Core module configuration values
  EXPORT spc_MODULE := 'I_rmp_transaction_log_person';
  EXPORT spc_NAMESCOPE := '';
  EXPORT spc_PROCESS := '';
  EXPORT spc_IDNAME := ''; // cluster id (input)
  EXPORT spc_IDFIELD := ''; // cluster id (output)
  EXPORT spc_RIDFIELD := 'vault_rid'; // record id
 
  // The entire spec file
  EXPORT spcString :=
    'OPTIONS:-gn\n'
    + 'MODULE:I_rmp_transaction_log_person\n'
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
    + 'FIELD:sequence:TYPE(INTEGER1):0,0\n'
    + 'FIELD:first_name:TYPE(STRING20):0,0\n'
    + 'FIELD:middle_name:TYPE(STRING20):0,0\n'
    + 'FIELD:last_name:TYPE(STRING20):0,0\n'
    + 'FIELD:suffix_name:TYPE(STRING3):0,0\n'
    + 'FIELD:ssn:TYPE(STRING9):0,0\n'
    + 'FIELD:current_dl_state:TYPE(STRING2):0,0\n'
    + 'FIELD:current_dl_number:TYPE(STRING25):0,0\n'
    + 'FIELD:prior_dl_state:TYPE(STRING2):0,0\n'
    + 'FIELD:prior_dl_number:TYPE(STRING25):0,0\n'
    + 'FIELD:prior_policy_number:TYPE(STRING20):0,0\n'
    + 'FIELD:date_added:TYPE(STRING19):0,0\n'
    + 'FIELD:product_id:TYPE(INTEGER4):0,0\n'
    + 'FIELD:telephone_area_code:TYPE(STRING3):0,0\n'
    + 'FIELD:telephone_exchange:TYPE(STRING3):0,0\n'
    + 'FIELD:telephone_number:TYPE(STRING4):0,0\n'
    + 'FIELD:reference_no:TYPE(STRING14):0,0\n'
    + 'FIELD:unit_no:TYPE(STRING3):0,0\n'
    + 'FIELD:customer_no:TYPE(STRING5):0,0\n'
    + 'FIELD:quoteback:TYPE(STRING60):0,0\n'
    + 'FIELD:order_date:TYPE(STRING8):0,0\n'
    + 'FIELD:current_house_no:TYPE(STRING9):0,0\n'
    + 'FIELD:current_street_name:TYPE(STRING20):0,0\n'
    + 'FIELD:current_apt_no:TYPE(STRING5):0,0\n'
    + 'FIELD:current_city:TYPE(STRING20):0,0\n'
    + 'FIELD:current_state:TYPE(STRING20):0,0\n'
    + 'FIELD:current_zip:TYPE(STRING5):0,0\n'
    + 'FIELD:current_zip_ext:TYPE(STRING4):0,0\n'
    + 'FIELD:former_house_no:TYPE(STRING9):0,0\n'
    + 'FIELD:former_street_name:TYPE(STRING20):0,0\n'
    + 'FIELD:former_apt_no:TYPE(STRING5):0,0\n'
    + 'FIELD:former_city:TYPE(STRING20):0,0\n'
    + 'FIELD:former_state:TYPE(STRING20):0,0\n'
    + 'FIELD:former_zip:TYPE(STRING5):0,0\n'
    + 'FIELD:former_zip_ext:TYPE(STRING4):0,0\n'
    + 'FIELD:dob:TYPE(STRING8):0,0\n'
    + 'FIELD:sex:TYPE(STRING1):0,0\n'
    + 'FIELD:service_type:TYPE(STRING1):0,0\n'
    + 'FIELD:spl_bill_id:TYPE(STRING20):0,0\n'
    + 'FIELD:subject_process_stat_code:TYPE(STRING1):0,0\n'
    + 'FIELD:mortgage_no:TYPE(STRING15):0,0\n'
    + 'FIELD:lex_id:TYPE(INTEGER8):0,0\n'
    + 'FIELD:participant_number:TYPE(STRING3):0,0\n'
    + 'FIELD:participant_type:TYPE(STRING30):0,0\n'
    + 'FIELD:participant_role:TYPE(STRING30):0,0\n'
    + 'FIELD:participant_policy_number:TYPE(STRING30):0,0\n'
    + 'FIELD:participant_carrier_name:TYPE(STRING80):0,0\n'
    + 'FIELD:address_line:TYPE(STRING90):0,0\n'
    + 'FIELD:address_street_type:TYPE(INTEGER1):0,0\n'
    + 'FIELD:party_subj_id:TYPE(STRING30):0,0\n'
    + '// CONCEPT statements should be used to group together interellated fields; such as address\n'
    + '// RELATIONSHIP is used to find non-obvious relationships between the clusters\n'
    + '// SOURCEFIELD is used if a field of the file denotes a source of the records in that file\n'
    + '// LINKPATH is used to define access paths for external linking\n'
    ;
 
  // Structured values
  EXPORT linkpaths := DATASET([
    ],{STRING linkpath;STRING compulsory;STRING optional;STRING bonus;STRING required;STRING search});
 
END;
