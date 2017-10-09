// Machine-readable versions of the spec file and subsets thereof
IMPORT SALT38;
EXPORT GenerationMod := MODULE(SALT38.iGenerationMod)
 
  // SALT Version info
  EXPORT salt_VERSION := 'V3.8.1';
  EXPORT salt_MODULE := 'SALT38'; // Optional override by HACK:SALTMODULE
  EXPORT salt_TOOLSMODULE := 'SALTTOOLS30'; // Optional override by HACK:SALTTOOLSMODULE
 
  // Core module configuration values
  EXPORT spc_MODULE := 'I_Telematics_translog';
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
    + 'MODULE:I_Telematics_translog\n'
    + 'FILENAME:Vault\n'
    + 'INGESTFILE:OFPU:NAMED(Source)\n'
    + 'RIDFIELD:vault_rid\n'
    + 'SOURCERIDFIELD:vault_uid_hash\n'
    + 'FIELD:vault_date_first_seen:RECORDDATE(FIRST):\n'
    + 'FIELD:vault_date_last_seen:RECORDDATE(LAST):\n'
    + 'INGESTMODE:NONCONTIGUOUS(vault_date_first_seen,vault_date_last_seen)\n'
    + '\n'
    + 'FIELD:vault_uid_hash:TYPE(DATA16):0,0\n'
    + 'FIELD:transaction_id:TYPE(STRING50):0,0\n'
    + 'FIELD:date_added:TYPE(STRING19):0,0\n'
    + 'FIELD:submitter:TYPE(STRING60):0,0\n'
    + 'FIELD:customer_number:TYPE(INTEGER4):0,0\n'
    + 'FIELD:customer_am_best:TYPE(STRING60):0,0\n'
    + 'FIELD:account_base:TYPE(STRING9):0,0\n'
    + 'FIELD:account_suffix:TYPE(STRING3):0,0\n'
    + 'FIELD:reference_number:TYPE(STRING50):0,0\n'
    + 'FIELD:account_id:TYPE(INTEGER4):0,0\n'
    + 'FIELD:policy_number:TYPE(STRING20):0,0\n'
    + 'FIELD:insurance_type:TYPE(STRING10):0,0\n'
    + 'FIELD:policy_type:TYPE(STRING10):0,0\n'
    + 'FIELD:event_type:TYPE(STRING30):0,0\n'
    + 'FIELD:event_status_code:TYPE(STRING5):0,0\n'
    + 'FIELD:sent_to_billing:TYPE(INTEGER4):0,0\n'
    + 'FIELD:billing_report_code:TYPE(STRING5):0,0\n'
    + 'FIELD:quantity:TYPE(INTEGER4):0,0\n'
    + 'FIELD:year_one_end_date:TYPE(STRING19):0,0\n'
    + 'FIELD:vin:TYPE(STRING25):0,0\n'
    + 'FIELD:make:TYPE(STRING30):0,0\n'
    + 'FIELD:model:TYPE(STRING30):0,0\n'
    + 'FIELD:year:TYPE(INTEGER2):0,0\n'
    + 'FIELD:ship_to_address:TYPE(STRING90):0,0\n'
    + 'FIELD:ship_to_city:TYPE(STRING50):0,0\n'
    + 'FIELD:ship_to_state:TYPE(STRING2):0,0\n'
    + 'FIELD:ship_to_zip:TYPE(STRING10):0,0\n'
    + 'FIELD:mail_addr_hse:TYPE(STRING90):0,0\n'
    + 'FIELD:mail_addr_st_name:TYPE(STRING90):0,0\n'
    + 'FIELD:mail_addr_apt_num:TYPE(STRING10):0,0\n'
    + 'FIELD:mail_addr_city:TYPE(STRING50):0,0\n'
    + 'FIELD:mail_addr_state:TYPE(STRING2):0,0\n'
    + 'FIELD:mail_addr_zip5:TYPE(STRING10):0,0\n'
    + 'FIELD:carrier_label_branding:TYPE(STRING30):0,0\n'
    + 'FIELD:vehicle_primary_driver_mobile_num:TYPE(STRING12):0,0\n'
    + 'FIELD:policy_relationship:TYPE(STRING20):0,0\n'
    + 'FIELD:last_name:TYPE(STRING30):0,0\n'
    + 'FIELD:first_name:TYPE(STRING30):0,0\n'
    + 'FIELD:middle_name:TYPE(STRING30):0,0\n'
    + 'FIELD:suffix:TYPE(STRING5):0,0\n'
    + 'FIELD:dob:TYPE(STRING8):0,0\n'
    + 'FIELD:driver_license_num:TYPE(STRING25):0,0\n'
    + 'FIELD:email:TYPE(STRING255):0,0\n'
    + 'FIELD:mobile_num:TYPE(STRING12):0,0\n'
    + 'FIELD:change_effective_date:TYPE(STRING19):0,0\n'
    + 'FIELD:user_added:TYPE(STRING60):0,0\n'
    + 'FIELD:user_changed:TYPE(STRING60):0,0\n'
    + 'FIELD:date_changed:TYPE(STRING19):0,0\n'
    + 'FIELD:product_id:TYPE(STRING10):0,0\n'
    + '\n'
    ;
 
  // Structured values
  EXPORT linkpaths := DATASET([
    ],{STRING linkpath;STRING compulsory;STRING optional;STRING bonus;STRING required;STRING search});
 
END;
