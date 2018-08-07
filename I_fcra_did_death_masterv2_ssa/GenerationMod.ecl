// Machine-readable versions of the spec file and subsets thereof
IMPORT SALT311;
EXPORT GenerationMod := MODULE(SALT311.iGenerationMod)
 
  // SALT Version info
  EXPORT salt_VERSION := 'V3.11.2';
  EXPORT salt_MODULE := 'SALT311'; // Optional override by HACK:SALTMODULE
  EXPORT salt_TOOLSMODULE := 'SALTTOOLS30'; // Optional override by HACK:SALTTOOLSMODULE
 
  // Core module configuration values
  EXPORT spc_MODULE := 'I_fcra_did_death_masterv2_ssa';
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
  EXPORT spc_EXTERNAL_BATCH_PARAM := ',/* MY_ */,vault_date_first_seen,vault_date_last_seen,vault_uid_hash,l_did,did,did_score,filedate,rec_type,rec_type_orig,ssn,lname,name_suffix,fname,mname,vorp_code,dod8,dob8,st_country_code,zip_lastres,zip_lastpayment,state,fipscounty,crlf,state_death_flag,death_rec_src,state_death_id,src,glb_flag,county_name,__internal_fpos__';
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
    + 'MODULE:I_fcra_did_death_masterv2_ssa\n'
    + 'FILENAME:Vault\n'
    + 'INGESTFILE:OFPU:NAMED(Source)\n'
    + 'RIDFIELD:vault_rid\n'
    + 'SOURCERIDFIELD:vault_uid_hash\n'
    + 'FIELD:vault_date_first_seen:RECORDDATE(FIRST):\n'
    + 'FIELD:vault_date_last_seen:RECORDDATE(LAST):\n'
    + 'INGESTMODE:NONCONTIGUOUS(vault_date_first_seen,vault_date_last_seen)\n'
    + '\n'
    + 'FIELD:vault_uid_hash:TYPE(DATA16):0,0\n'
    + 'FIELD:l_did:TYPE(UNSIGNED6):0,0\n'
    + 'FIELD:did:TYPE(STRING12):0,0\n'
    + 'FIELD:did_score:TYPE(UNSIGNED1):0,0\n'
    + 'FIELD:filedate:TYPE(STRING8):0,0\n'
    + 'FIELD:rec_type:TYPE(STRING1):0,0\n'
    + 'FIELD:rec_type_orig:TYPE(STRING1):0,0\n'
    + 'FIELD:ssn:TYPE(STRING9):0,0\n'
    + 'FIELD:lname:TYPE(STRING20):0,0\n'
    + 'FIELD:name_suffix:TYPE(STRING4):0,0\n'
    + 'FIELD:fname:TYPE(STRING15):0,0\n'
    + 'FIELD:mname:TYPE(STRING15):0,0\n'
    + 'FIELD:vorp_code:TYPE(STRING1):0,0\n'
    + 'FIELD:dod8:TYPE(STRING8):0,0\n'
    + 'FIELD:dob8:TYPE(STRING8):0,0\n'
    + 'FIELD:st_country_code:TYPE(STRING2):0,0\n'
    + 'FIELD:zip_lastres:TYPE(STRING5):0,0\n'
    + 'FIELD:zip_lastpayment:TYPE(STRING5):0,0\n'
    + 'FIELD:state:TYPE(STRING2):0,0\n'
    + 'FIELD:fipscounty:TYPE(STRING3):0,0\n'
    + 'FIELD:crlf:TYPE(STRING2):0,0\n'
    + 'FIELD:state_death_flag:TYPE(STRING1):0,0\n'
    + 'FIELD:death_rec_src:TYPE(STRING3):0,0\n'
    + 'FIELD:state_death_id:TYPE(STRING16):0,0\n'
    + 'FIELD:src:TYPE(STRING2):0,0\n'
    + 'FIELD:glb_flag:TYPE(STRING1):0,0\n'
    + 'FIELD:county_name:TYPE(STRING18):0,0\n'
    + 'FIELD:__internal_fpos__:TYPE(UNSIGNED8):0,0\n'
    ;
 
  // Structured values
  EXPORT linkpaths := DATASET([
    ],{STRING linkpath;STRING compulsory;STRING optional;STRING bonus;STRING required;STRING search});
 
END;

