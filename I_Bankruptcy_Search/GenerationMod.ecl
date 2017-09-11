﻿// Machine-readable versions of the spec file and subsets thereof
IMPORT SALT38;
EXPORT GenerationMod := MODULE(SALT38.iGenerationMod)
 
  // SALT Version info
  EXPORT salt_VERSION := 'V3.8.1';
  EXPORT salt_MODULE := 'SALT38'; // Optional override by HACK:SALTMODULE
  EXPORT salt_TOOLSMODULE := 'SALTTOOLS30'; // Optional override by HACK:SALTTOOLSMODULE
 
  // Core module configuration values
  EXPORT spc_MODULE := 'I_Bankruptcy_Search';
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
    + 'MODULE:I_Bankruptcy_Search\n'
    + 'FILENAME:Vault\n'
    + 'INGESTFILE:OFPU:NAMED(Source)\n'
    + 'RIDFIELD:vault_rid\n'
    + 'SOURCERIDFIELD:vault_UID_Hash\n'
    + 'FIELD:vault_date_first_seen:RECORDDATE(FIRST):\n'
    + 'FIELD:vault_date_last_seen:RECORDDATE(LAST):\n'
    + '\n'
    + 'INGESTMODE:NONCONTIGUOUS(vault_date_first_seen,vault_date_last_seen)\n'
    + '\n'
    + 'FIELD:vault_uid_hash:TYPE(INTEGER8):0,0\n'
    + 'FIELD:process_date:TYPE(STRING8):0,0\n'
    + 'FIELD:caseid:TYPE(STRING12):0,0\n'
    + 'FIELD:defendantid:TYPE(STRING12):0,0\n'
    + 'FIELD:recid:TYPE(STRING12):0,0\n'
    + 'FIELD:tmsid:TYPE(STRING50):0,0\n'
    + 'FIELD:seq_number:TYPE(STRING10):0,0\n'
    + 'FIELD:court_code:TYPE(STRING5):0,0\n'
    + 'FIELD:case_number:TYPE(STRING7):0,0\n'
    + 'FIELD:orig_case_number:TYPE(STRING25):0,0\n'
    + 'FIELD:chapter:TYPE(STRING3):0,0\n'
    + 'FIELD:filing_type:TYPE(STRING1):0,0\n'
    + 'FIELD:business_flag:TYPE(STRING1):0,0\n'
    + 'FIELD:corp_flag:TYPE(STRING1):0,0\n'
    + 'FIELD:discharged:TYPE(STRING8):0,0\n'
    + 'FIELD:disposition:TYPE(STRING35):0,0\n'
    + 'FIELD:pro_se_ind:TYPE(STRING3):0,0\n'
    + 'FIELD:converted_date:TYPE(STRING8):0,0\n'
    + 'FIELD:orig_county:TYPE(STRING30):0,0\n'
    + 'FIELD:debtor_type:TYPE(STRING2):0,0\n'
    + 'FIELD:debtor_seq:TYPE(STRING3):0,0\n'
    + 'FIELD:ssn:TYPE(STRING9):0,0\n'
    + 'FIELD:ssnsrc:TYPE(STRING1):0,0\n'
    + 'FIELD:ssnmatch:TYPE(STRING9):0,0\n'
    + 'FIELD:ssnmsrc:TYPE(STRING1):0,0\n'
    + 'FIELD:screen:TYPE(STRING1):0,0\n'
    + 'FIELD:dcode:TYPE(STRING2):0,0\n'
    + 'FIELD:disptype:TYPE(STRING3):0,0\n'
    + 'FIELD:dispreason:TYPE(STRING3):0,0\n'
    + 'FIELD:statusdate:TYPE(STRING8):0,0\n'
    + 'FIELD:holdcase:TYPE(STRING8):0,0\n'
    + 'FIELD:datevacated:TYPE(STRING8):0,0\n'
    + 'FIELD:datetransferred:TYPE(STRING8):0,0\n'
    + 'FIELD:activityreceipt:TYPE(STRING12):0,0\n'
    + 'FIELD:tax_id:TYPE(STRING9):0,0\n'
    + 'FIELD:name_type:TYPE(STRING2):0,0\n'
    + 'FIELD:orig_name:TYPE(STRING200):0,0\n'
    + 'FIELD:orig_fname:TYPE(STRING50):0,0\n'
    + 'FIELD:orig_mname:TYPE(STRING30):0,0\n'
    + 'FIELD:orig_lname:TYPE(STRING50):0,0\n'
    + 'FIELD:orig_name_suffix:TYPE(STRING5):0,0\n'
    + 'FIELD:title:TYPE(STRING5):0,0\n'
    + 'FIELD:fname:TYPE(STRING20):0,0\n'
    + 'FIELD:mname:TYPE(STRING20):0,0\n'
    + 'FIELD:lname:TYPE(STRING20):0,0\n'
    + 'FIELD:name_suffix:TYPE(STRING5):0,0\n'
    + 'FIELD:name_score:TYPE(STRING3):0,0\n'
    + 'FIELD:cname:TYPE(STRING150):0,0\n'
    + 'FIELD:orig_company:TYPE(STRING150):0,0\n'
    + 'FIELD:orig_addr1:TYPE(STRING80):0,0\n'
    + 'FIELD:orig_addr2:TYPE(STRING80):0,0\n'
    + 'FIELD:orig_city:TYPE(STRING80):0,0\n'
    + 'FIELD:orig_st:TYPE(STRING2):0,0\n'
    + 'FIELD:orig_zip5:TYPE(STRING5):0,0\n'
    + 'FIELD:orig_zip4:TYPE(STRING4):0,0\n'
    + 'FIELD:orig_email:TYPE(STRING250):0,0\n'
    + 'FIELD:orig_fax:TYPE(STRING10):0,0\n'
    + 'FIELD:prim_range:TYPE(STRING10):0,0\n'
    + 'FIELD:predir:TYPE(STRING2):0,0\n'
    + 'FIELD:prim_name:TYPE(STRING28):0,0\n'
    + 'FIELD:addr_suffix:TYPE(STRING4):0,0\n'
    + 'FIELD:postdir:TYPE(STRING2):0,0\n'
    + 'FIELD:unit_desig:TYPE(STRING10):0,0\n'
    + 'FIELD:sec_range:TYPE(STRING8):0,0\n'
    + 'FIELD:p_city_name:TYPE(STRING25):0,0\n'
    + 'FIELD:v_city_name:TYPE(STRING25):0,0\n'
    + 'FIELD:st:TYPE(STRING2):0,0\n'
    + 'FIELD:zip:TYPE(STRING5):0,0\n'
    + 'FIELD:zip4:TYPE(STRING4):0,0\n'
    + 'FIELD:cart:TYPE(STRING4):0,0\n'
    + 'FIELD:cr_sort_sz:TYPE(STRING1):0,0\n'
    + 'FIELD:lot:TYPE(STRING4):0,0\n'
    + 'FIELD:lot_order:TYPE(STRING1):0,0\n'
    + 'FIELD:dbpc:TYPE(STRING2):0,0\n'
    + 'FIELD:chk_digit:TYPE(STRING1):0,0\n'
    + 'FIELD:rec_type:TYPE(STRING2):0,0\n'
    + 'FIELD:county:TYPE(STRING5):0,0\n'
    + 'FIELD:geo_lat:TYPE(STRING10):0,0\n'
    + 'FIELD:geo_long:TYPE(STRING11):0,0\n'
    + 'FIELD:msa:TYPE(STRING4):0,0\n'
    + 'FIELD:geo_blk:TYPE(STRING7):0,0\n'
    + 'FIELD:geo_match:TYPE(STRING1):0,0\n'
    + 'FIELD:err_stat:TYPE(STRING4):0,0\n'
    + 'FIELD:phone:TYPE(STRING10):0,0\n'
    + 'FIELD:did:TYPE(STRING12):0,0\n'
    + 'FIELD:bdid:TYPE(STRING12):0,0\n'
    + 'FIELD:app_ssn:TYPE(STRING9):0,0\n'
    + 'FIELD:app_tax_id:TYPE(STRING9):0,0\n'
    + 'FIELD:date_first_seen:TYPE(STRING8):0,0\n'
    + 'FIELD:date_last_seen:TYPE(STRING8):0,0\n'
    + 'FIELD:date_vendor_first_reported:TYPE(STRING8):0,0\n'
    + 'FIELD:date_vendor_last_reported:TYPE(STRING8):0,0\n'
    + 'FIELD:disptypedesc:TYPE(STRING35):0,0\n'
    + 'FIELD:srcdesc:TYPE(STRING35):0,0\n'
    + 'FIELD:srcmtchdesc:TYPE(STRING35):0,0\n'
    + 'FIELD:screendesc:TYPE(STRING35):0,0\n'
    + 'FIELD:dcodedesc:TYPE(STRING35):0,0\n'
    + 'FIELD:date_filed:TYPE(STRING8):0,0\n'
    + 'FIELD:record_type:TYPE(STRING128):0,0\n'
    + 'FIELD:delete_flag:TYPE(STRING1):0,0\n'
    + 'FIELD:dotid:TYPE(UNSIGNED6):0,0\n'
    + 'FIELD:dotscore:TYPE(UNSIGNED2):0,0\n'
    + 'FIELD:dotweight:TYPE(UNSIGNED2):0,0\n'
    + 'FIELD:empid:TYPE(UNSIGNED6):0,0\n'
    + 'FIELD:empscore:TYPE(UNSIGNED2):0,0\n'
    + 'FIELD:empweight:TYPE(UNSIGNED2):0,0\n'
    + 'FIELD:powid:TYPE(UNSIGNED6):0,0\n'
    + 'FIELD:powscore:TYPE(UNSIGNED2):0,0\n'
    + 'FIELD:powweight:TYPE(UNSIGNED2):0,0\n'
    + 'FIELD:proxid:TYPE(UNSIGNED6):0,0\n'
    + 'FIELD:proxscore:TYPE(UNSIGNED2):0,0\n'
    + 'FIELD:proxweight:TYPE(UNSIGNED2):0,0\n'
    + 'FIELD:seleid:TYPE(UNSIGNED6):0,0\n'
    + 'FIELD:selescore:TYPE(UNSIGNED2):0,0\n'
    + 'FIELD:seleweight:TYPE(UNSIGNED2):0,0\n'
    + 'FIELD:orgid:TYPE(UNSIGNED6):0,0\n'
    + 'FIELD:orgscore:TYPE(UNSIGNED2):0,0\n'
    + 'FIELD:orgweight:TYPE(UNSIGNED2):0,0\n'
    + 'FIELD:ultid:TYPE(UNSIGNED6):0,0\n'
    + 'FIELD:ultscore:TYPE(UNSIGNED2):0,0\n'
    + 'FIELD:ultweight:TYPE(UNSIGNED2):0,0\n'
    + 'FIELD:source_rec_id:TYPE(UNSIGNED8):0,0\n'
    + 'FIELD:scrubsbits1:TYPE(UNSIGNED8):0,0\n'
    + '\n'
    ;
 
  // Structured values
  EXPORT linkpaths := DATASET([
    ],{STRING linkpath;STRING compulsory;STRING optional;STRING bonus;STRING required;STRING search});
 
END;