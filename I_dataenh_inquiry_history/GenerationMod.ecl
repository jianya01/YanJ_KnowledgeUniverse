// Machine-readable versions of the spec file and subsets thereof
EXPORT GenerationMod := MODULE
  EXPORT spcString :=
    'OPTIONS:-gn\n'
    + 'MODULE:I_dataenh_inquiry_history\n'
    + 'FILENAME:Vault \n'
    + 'INGESTFILE:SRC:NAMED(Source) \n'
    + 'RIDFIELD:vault_rid\n'
    + 'SOURCERIDFIELD:vault_uid_hash\n'
    + 'FIELD:vault_date_first_seen:RECORDDATE(FIRST):\n'
    + 'FIELD:vault_date_last_seen:RECORDDATE(LAST):\n'
    + 'INGESTMODE:NONCONTIGUOUS(vault_date_first_seen,vault_date_last_seen)\n'
    + '\n'
    + 'FIELD:vault_uid_hash:TYPE(INTEGER8):0,0\n'
    + 'FIELD:transaction_id:TYPE(STRING16):0,0\n'
    + 'FIELD:product_id:TYPE(STRING11):0,0\n'
    + 'FIELD:date_added:TYPE(STRING19):0,0\n'
    + 'FIELD:process_type:TYPE(STRING4):0,0\n'
    + 'FIELD:processing_time:TYPE(STRING8):0,0\n'
    + 'FIELD:vendor_code:TYPE(STRING10):0,0\n'
    + 'FIELD:request_type:TYPE(STRING20):0,0\n'
    + 'FIELD:product_version:TYPE(STRING20):0,0\n'
    + 'FIELD:reference_number:TYPE(STRING15):0,0\n'
    + 'FIELD:content_data:TYPE(STRING):0,0\n'
    + '// CONCEPT statements should be used to group together interellated fields; such as address\n'
    + '// RELATIONSHIP is used to find non-obvious relationships between the clusters\n'
    + '// SOURCEFIELD is used if a field of the file denotes a source of the records in that file\n'
    + '// LINKPATH is used to define access paths for external linking\n'
    ;

  EXPORT linkpaths := DATASET([
    ],{STRING linkpath;STRING compulsory;STRING optional;STRING bonus;STRING required;STRING search});

END;
