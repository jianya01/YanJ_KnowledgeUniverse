// Machine-readable versions of the spec file and subsets thereof
EXPORT GenerationMod := MODULE
 
  // SALT Version info
  EXPORT salt_VERSION := 'V3.8.0';
  EXPORT salt_MODULE := 'SALT38'; // Optional override by HACK:SALTMODULE
  EXPORT salt_TOOLSMODULE := 'SALTTOOLS30'; // Optional override by HACK:SALTTOOLSMODULE
 
  // Core module configuration values
  EXPORT spc_MODULE := 'I_Key_Relatives_V3';
  EXPORT spc_NAMESCOPE := '';
  EXPORT spc_PROCESS := '';
  EXPORT spc_IDNAME := ''; // cluster id (input)
  EXPORT spc_IDFIELD := ''; // cluster id (output)
  EXPORT spc_RIDFIELD := 'vault_rid'; // record id
 
  // The entire spec file
  EXPORT spcString :=
    'OPTIONS:-gn\n'
    + 'MODULE:I_Key_Relatives_V3\n'
    + 'FILENAME:Vault\n'
    + 'INGESTFILE:OFPU:NAMED(Source)\n'
    + 'RIDFIELD:vault_rid\n'
    + 'SOURCERIDFIELD:vault_UID_Hash\n'
    + 'FIELD:vault_date_first_seen:RECORDDATE(FIRST):\n'
    + 'FIELD:vault_date_last_seen:RECORDDATE(LAST):\n'
    + 'INGESTMODE:NONCONTIGUOUS(vault_date_first_seen,vault_date_last_seen)\n'
    + '\n'
    + 'FIELD:vault_uid_hash:TYPE(INTEGER8):0,0\n'
    + 'FIELD:did1:TYPE(UNSIGNED6):0,0\n'
    + 'FIELD:type:TYPE(STRING15):0,0\n'
    + 'FIELD:confidence:TYPE(STRING10):0,0\n'
    + 'FIELD:did2:TYPE(UNSIGNED6):0,0\n'
    + 'FIELD:cohabit_score:TYPE(INTEGER2):0,0\n'
    + 'FIELD:cohabit_cnt:TYPE(INTEGER2):0,0\n'
    + 'FIELD:coapt_score:TYPE(INTEGER2):0,0\n'
    + 'FIELD:coapt_cnt:TYPE(INTEGER2):0,0\n'
    + 'FIELD:copobox_score:TYPE(INTEGER2):0,0\n'
    + 'FIELD:copobox_cnt:TYPE(INTEGER2):0,0\n'
    + 'FIELD:cossn_score:TYPE(INTEGER2):0,0\n'
    + 'FIELD:cossn_cnt:TYPE(INTEGER2):0,0\n'
    + 'FIELD:copolicy_score:TYPE(INTEGER2):0,0\n'
    + 'FIELD:copolicy_cnt:TYPE(INTEGER2):0,0\n'
    + 'FIELD:coclaim_score:TYPE(INTEGER2):0,0\n'
    + 'FIELD:coclaim_cnt:TYPE(INTEGER2):0,0\n'
    + 'FIELD:coproperty_score:TYPE(INTEGER2):0,0\n'
    + 'FIELD:coproperty_cnt:TYPE(INTEGER2):0,0\n'
    + 'FIELD:bcoproperty_score:TYPE(INTEGER2):0,0\n'
    + 'FIELD:bcoproperty_cnt:TYPE(INTEGER2):0,0\n'
    + 'FIELD:coforeclosure_score:TYPE(INTEGER2):0,0\n'
    + 'FIELD:coforeclosure_cnt:TYPE(INTEGER2):0,0\n'
    + 'FIELD:bcoforeclosure_score:TYPE(INTEGER2):0,0\n'
    + 'FIELD:bcoforeclosure_cnt:TYPE(INTEGER2):0,0\n'
    + 'FIELD:colien_score:TYPE(INTEGER2):0,0\n'
    + 'FIELD:colien_cnt:TYPE(INTEGER2):0,0\n'
    + 'FIELD:bcolien_score:TYPE(INTEGER2):0,0\n'
    + 'FIELD:bcolien_cnt:TYPE(INTEGER2):0,0\n'
    + 'FIELD:cobankruptcy_score:TYPE(INTEGER2):0,0\n'
    + 'FIELD:cobankruptcy_cnt:TYPE(INTEGER2):0,0\n'
    + 'FIELD:bcobankruptcy_score:TYPE(INTEGER2):0,0\n'
    + 'FIELD:bcobankruptcy_cnt:TYPE(INTEGER2):0,0\n'
    + 'FIELD:covehicle_score:TYPE(INTEGER2):0,0\n'
    + 'FIELD:covehicle_cnt:TYPE(INTEGER2):0,0\n'
    + 'FIELD:coexperian_score:TYPE(INTEGER2):0,0\n'
    + 'FIELD:coexperian_cnt:TYPE(INTEGER2):0,0\n'
    + 'FIELD:cotransunion_score:TYPE(INTEGER2):0,0\n'
    + 'FIELD:cotransunion_cnt:TYPE(INTEGER2):0,0\n'
    + 'FIELD:coenclarity_score:TYPE(INTEGER2):0,0\n'
    + 'FIELD:coenclarity_cnt:TYPE(INTEGER2):0,0\n'
    + 'FIELD:coecrash_score:TYPE(INTEGER2):0,0\n'
    + 'FIELD:coecrash_cnt:TYPE(INTEGER2):0,0\n'
    + 'FIELD:bcoecrash_score:TYPE(INTEGER2):0,0\n'
    + 'FIELD:bcoecrash_cnt:TYPE(INTEGER2):0,0\n'
    + 'FIELD:cowatercraft_score:TYPE(INTEGER2):0,0\n'
    + 'FIELD:cowatercraft_cnt:TYPE(INTEGER2):0,0\n'
    + 'FIELD:coaircraft_score:TYPE(INTEGER2):0,0\n'
    + 'FIELD:coaircraft_cnt:TYPE(INTEGER2):0,0\n'
    + 'FIELD:comarriagedivorce_score:TYPE(INTEGER2):0,0\n'
    + 'FIELD:comarriagedivorce_cnt:TYPE(INTEGER2):0,0\n'
    + 'FIELD:coucc_score:TYPE(INTEGER2):0,0\n'
    + 'FIELD:coucc_cnt:TYPE(INTEGER2):0,0\n'
    + 'FIELD:lname_score:TYPE(INTEGER2):0,0\n'
    + 'FIELD:phone_score:TYPE(INTEGER2):0,0\n'
    + 'FIELD:dl_nbr_score:TYPE(INTEGER2):0,0\n'
    + 'FIELD:total_cnt:TYPE(UNSIGNED2):0,0\n'
    + 'FIELD:total_score:TYPE(INTEGER2):0,0\n'
    + 'FIELD:cluster:TYPE(STRING10):0,0\n'
    + 'FIELD:generation:TYPE(STRING2):0,0\n'
    + 'FIELD:gender:TYPE(STRING1):0,0\n'
    + 'FIELD:lname_cnt:TYPE(UNSIGNED4):0,0\n'
    + 'FIELD:rel_dt_first_seen:TYPE(UNSIGNED4):0,0\n'
    + 'FIELD:rel_dt_last_seen:TYPE(UNSIGNED4):0,0\n'
    + 'FIELD:overlap_months:TYPE(UNSIGNED2):0,0\n'
    + 'FIELD:hdr_dt_first_seen:TYPE(UNSIGNED4):0,0\n'
    + 'FIELD:hdr_dt_last_seen:TYPE(UNSIGNED4):0,0\n'
    + 'FIELD:age_first_seen:TYPE(UNSIGNED2):0,0\n'
    + 'FIELD:isanylnamematch:TYPE(BOOLEAN1):0,0\n'
    + 'FIELD:isanyphonematch:TYPE(BOOLEAN1):0,0\n'
    + 'FIELD:isearlylnamematch:TYPE(BOOLEAN1):0,0\n'
    + 'FIELD:iscurrlnamematch:TYPE(BOOLEAN1):0,0\n'
    + 'FIELD:ismixedlnamematch:TYPE(BOOLEAN1):0,0\n'
    + 'FIELD:ssn1:TYPE(STRING9):0,0\n'
    + 'FIELD:ssn2:TYPE(STRING9):0,0\n'
    + 'FIELD:dob1:TYPE(UNSIGNED4):0,0\n'
    + 'FIELD:dob2:TYPE(UNSIGNED4):0,0\n'
    + 'FIELD:current_lname1:TYPE(STRING28):0,0\n'
    + 'FIELD:current_lname2:TYPE(STRING28):0,0\n'
    + 'FIELD:early_lname1:TYPE(STRING28):0,0\n'
    + 'FIELD:early_lname2:TYPE(STRING28):0,0\n'
    + 'FIELD:addr_ind1:TYPE(STRING2):0,0\n'
    + 'FIELD:addr_ind2:TYPE(STRING2):0,0\n'
    + 'FIELD:r2rdid:TYPE(UNSIGNED6):0,0\n'
    + 'FIELD:r2cnt:TYPE(UNSIGNED6):0,0\n'
    + 'FIELD:personal:TYPE(BOOLEAN1):0,0\n'
    + 'FIELD:business:TYPE(BOOLEAN1):0,0\n'
    + 'FIELD:other:TYPE(BOOLEAN1):0,0\n'
    + 'FIELD:title:TYPE(UNSIGNED1):0,0\n'
    + '\n'
    ;
 
  // Structured values
  EXPORT linkpaths := DATASET([
    ],{STRING linkpath;STRING compulsory;STRING optional;STRING bonus;STRING required;STRING search});
 
END;
