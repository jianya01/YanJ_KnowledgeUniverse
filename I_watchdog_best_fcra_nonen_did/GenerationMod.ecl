// Machine-readable versions of the spec file and subsets thereof
IMPORT SALT311;
EXPORT GenerationMod := MODULE(SALT311.iGenerationMod)
 
  // SALT Version info
  EXPORT salt_VERSION := 'V3.11.2';
  EXPORT salt_MODULE := 'SALT311'; // Optional override by HACK:SALTMODULE
  EXPORT salt_TOOLSMODULE := 'SALTTOOLS30'; // Optional override by HACK:SALTTOOLSMODULE
 
  // Core module configuration values
  EXPORT spc_MODULE := 'I_watchdog_best_fcra_nonen_did';
  EXPORT spc_NAMESCOPE := '';
  EXPORT spc_PROCESS := '';
  EXPORT spc_PROCLAYOUTS := 'Process__Layouts';
  EXPORT spc_IDNAME := ''; // cluster id (input)
  EXPORT spc_IDFIELD := ''; // cluster id (output)
  EXPORT spc_RIDFIELD := 'vault_rid'; // record id
  EXPORT spc_CONFIG := 'Config';
  EXPORT spc_CONFIGPARAM := FALSE;
  EXPORT spc_SOURCEFIELD := '';
  EXPORT spc_FILEPREFIX := 'In_';
  EXPORT spc_FILENAME := 'Vault';
  EXPORT spc_INGESTSTATUS := '';
  EXPORT spc_EXTERNAL_MAPPING := 'UniqueID:vault_rid';
  EXPORT spc_EXTERNAL_BATCH_PARAM := ',/* MY_ */,vault_date_first_seen,vault_date_last_seen,vault_uid_hash,did,phone,ssn,dob,title,fname,mname,lname,name_suffix,prim_range,predir,prim_name,suffix,postdir,unit_desig,sec_range,city_name,st,zip,zip4,addr_dt_last_seen,dod,prpty_deed_id,vehicle_vehnum,bkrupt_crtcode_caseno,main_count,search_count,dl_number,bdid,run_date,total_records,rawaid,addr_dt_first_seen,adl_ind,valid_ssn,__internal_fpos__';
  EXPORT spc_HAS_TWOSTEP := FALSE;
  EXPORT spc_HAS_PARTITION := FALSE;
  EXPORT spc_HAS_FIELDTYPES := FALSE;
  EXPORT spc_HAS_INCREMENTAL := FALSE;
  EXPORT spc_HAS_ASOF := FALSE;
  EXPORT spc_HAS_NONCONTIGUOUS := TRUE;
  EXPORT spc_HAS_SUPERFILES := FALSE;
  EXPORT spc_HAS_CONSISTENT := FALSE;
  EXPORT spc_HAS_EXTERNAL := FALSE;
  EXPORT spc_HAS_PARENTS := FALSE;
  EXPORT spc_HAS_FORCE := FALSE;
  EXPORT spc_HAS_BLOCKLINK := FALSE;
 
  // The entire spec file
  EXPORT spcString :=
    'OPTIONS:-gn\n'
    + 'MODULE:I_watchdog_best_fcra_nonen_did\n'
    + 'FILENAME:Vault\n'
    + 'INGESTFILE:OFPU:NAMED(Source)\n'
    + 'RIDFIELD:vault_rid\n'
    + 'SOURCERIDFIELD:vault_uid_hash\n'
    + 'FIELD:vault_date_first_seen:RECORDDATE(FIRST):\n'
    + 'FIELD:vault_date_last_seen:RECORDDATE(LAST):\n'
    + 'INGESTMODE:NONCONTIGUOUS(vault_date_first_seen,vault_date_last_seen)\n'
    + '\n'
    + 'FIELD:vault_uid_hash:TYPE(DATA16):0,0\n'
    + 'FIELD:did:TYPE(UNSIGNED6):0,0\n'
    + 'FIELD:phone:TYPE(QSTRING8):0,0\n'
    + 'FIELD:ssn:TYPE(QSTRING7):0,0\n'
    + 'FIELD:dob:TYPE(INTEGER4):0,0\n'
    + 'FIELD:title:TYPE(QSTRING4):0,0\n'
    + 'FIELD:fname:TYPE(QSTRING15):0,0\n'
    + 'FIELD:mname:TYPE(QSTRING15):0,0\n'
    + 'FIELD:lname:TYPE(QSTRING15):0,0\n'
    + 'FIELD:name_suffix:TYPE(QSTRING4):0,0\n'
    + 'FIELD:prim_range:TYPE(QSTRING8):0,0\n'
    + 'FIELD:predir:TYPE(STRING2):0,0\n'
    + 'FIELD:prim_name:TYPE(QSTRING21):0,0\n'
    + 'FIELD:suffix:TYPE(QSTRING3):0,0\n'
    + 'FIELD:postdir:TYPE(STRING2):0,0\n'
    + 'FIELD:unit_desig:TYPE(QSTRING8):0,0\n'
    + 'FIELD:sec_range:TYPE(QSTRING6):0,0\n'
    + 'FIELD:city_name:TYPE(QSTRING19):0,0\n'
    + 'FIELD:st:TYPE(STRING2):0,0\n'
    + 'FIELD:zip:TYPE(QSTRING4):0,0\n'
    + 'FIELD:zip4:TYPE(QSTRING3):0,0\n'
    + 'FIELD:addr_dt_last_seen:TYPE(UNSIGNED3):0,0\n'
    + 'FIELD:dod:TYPE(QSTRING6):0,0\n'
    + 'FIELD:prpty_deed_id:TYPE(QSTRING13):0,0\n'
    + 'FIELD:vehicle_vehnum:TYPE(QSTRING17):0,0\n'
    + 'FIELD:bkrupt_crtcode_caseno:TYPE(QSTRING17):0,0\n'
    + 'FIELD:main_count:TYPE(INTEGER4):0,0\n'
    + 'FIELD:search_count:TYPE(INTEGER4):0,0\n'
    + 'FIELD:dl_number:TYPE(QSTRING12):0,0\n'
    + 'FIELD:bdid:TYPE(QSTRING9):0,0\n'
    + 'FIELD:run_date:TYPE(INTEGER4):0,0\n'
    + 'FIELD:total_records:TYPE(INTEGER4):0,0\n'
    + 'FIELD:rawaid:TYPE(UNSIGNED8):0,0\n'
    + 'FIELD:addr_dt_first_seen:TYPE(UNSIGNED3):0,0\n'
    + 'FIELD:adl_ind:TYPE(STRING10):0,0\n'
    + 'FIELD:valid_ssn:TYPE(STRING1):0,0\n'
    + 'FIELD:__internal_fpos__:TYPE(UNSIGNED8):0,0\n'
    ;
 
  // Structured values
  EXPORT linkpaths := DATASET([
    ],{STRING linkpath;STRING compulsory;STRING optional;STRING bonus;STRING required;STRING search});
 
END;

