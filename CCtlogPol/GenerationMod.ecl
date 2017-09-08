// Machine-readable versions of the spec file and subsets thereof
EXPORT GenerationMod := MODULE
  EXPORT spcString :=
    'OPTIONS:-gn\n'
    + 'MODULE:CCtlogPol\n'
    + 'FILENAME:Vault \n'
    + 'INGESTFILE:CCPP:NAMED(Source) \n'
    + '\n'
    + 'RIDFIELD:vault_rid\n'
    + 'SOURCERIDFIELD:vault_uid_hash\n'
    + '\n'
    + 'FIELD:vault_date_first_seen:RECORDDATE(FIRST):\n'
    + 'FIELD:vault_date_last_seen:RECORDDATE(LAST):\n'
    + '\n'
    + 'INGESTMODE:NONCONTIGUOUS(vault_date_first_seen,vault_date_last_seen)\n'
    + '\n'
    + 'FIELD:vault_uid_hash:TYPE(INTEGER8):0,0\n'
    + 'FIELD:transaction_id:TYPE(STRING20):0,0\n'
    + 'FIELD:sequence:TYPE(STRING4):0,0\n'
    + 'FIELD:status:TYPE(STRING1):0,0\n'
    + 'FIELD:state:TYPE(STRING2):0,0\n'
    + 'FIELD:am_best:TYPE(STRING6):0,0\n'
    + 'FIELD:policy_number:TYPE(STRING20):0,0\n'
    + 'FIELD:policy_type:TYPE(STRING2):0,0\n'
    + 'FIELD:policy_inception_date:TYPE(STRING10):0,0\n'
    + 'FIELD:policy_begin_date:TYPE(STRING10):0,0\n'
    + 'FIELD:policy_cancel_date:TYPE(STRING10):0,0\n'
    + 'FIELD:policy_end_date:TYPE(STRING10):0,0\n'
    + 'FIELD:last_cancel_reason:TYPE(STRING4):0,0\n'
    + 'FIELD:insurance_type:TYPE(STRING2):0,0\n'
    + 'FIELD:suppressed:TYPE(STRING1):0,0\n'
    + 'FIELD:naic:TYPE(STRING5):0,0\n'
    + 'FIELD:risk_type:TYPE(STRING1):0,0\n'
    + 'FIELD:carrier_name:TYPE(STRING30):0,0\n'
    + 'FIELD:date_added:TYPE(STRING20):0,0\n'
    + '// CONCEPT statements should be used to group together interellated fields; such as address\n'
    + '// RELATIONSHIP is used to find non-obvious relationships between the clusters\n'
    + '// SOURCEFIELD is used if a field of the file denotes a source of the records in that file\n'
    + '// LINKPATH is used to define access paths for external linking\n'
    + '\n'
    + '\n'
    ;

  EXPORT linkpaths := DATASET([
    ],{STRING linkpath;STRING compulsory;STRING optional;STRING bonus;STRING required;STRING search});

END;
