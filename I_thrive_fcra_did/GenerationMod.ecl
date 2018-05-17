﻿// Machine-readable versions of the spec file and subsets thereof
IMPORT SALT311;
EXPORT GenerationMod := MODULE(SALT311.iGenerationMod)
 
  // SALT Version info
  EXPORT salt_VERSION := 'V3.11.2';
  EXPORT salt_MODULE := 'SALT311'; // Optional override by HACK:SALTMODULE
  EXPORT salt_TOOLSMODULE := 'SALTTOOLS30'; // Optional override by HACK:SALTTOOLSMODULE
 
  // Core module configuration values
  EXPORT spc_MODULE := 'I_thrive_fcra_did';
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
  EXPORT spc_EXTERNAL_BATCH_PARAM := ',/* MY_ */,vault_date_first_seen,vault_date_last_seen,vault_uid_hash,did,persistent_record_id,src,dt_first_seen,dt_last_seen,dt_vendor_first_reported,dt_vendor_last_reported,bdid,bdid_score,did_score,orig_fname,orig_mname,orig_lname,orig_addr,orig_city,orig_state,orig_zip5,orig_zip4,email,employer,income,pay_frequency,phone_work,phone_home,phone_cell,dob,monthsemployed,own_home,is_military,drvlic_state,monthsatbank,ip,yrsthere,besttime,credit,loanamt,loantype,ratetype,mortrate,ltv,propertytype,datecollected,title,fname,mname,lname,name_suffix,nid,prim_range,predir,prim_name,addr_suffix,postdir,unit_desig,sec_range,p_city_name,v_city_name,st,zip,zip4,cart,cr_sort_sz,lot,lot_order,dbpc,chk_digit,rec_type,fips_st,fips_county,geo_lat,geo_long,msa,geo_blk,geo_match,err_stat,rawaid,aceaid,clean_phone_work,clean_phone_home,clean_phone_cell,clean_dob,__internal_fpos__';
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
    + 'MODULE:I_thrive_fcra_did\n'
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
    + 'FIELD:persistent_record_id:TYPE(STRING20):0,0\n'
    + 'FIELD:src:TYPE(STRING2):0,0\n'
    + 'FIELD:dt_first_seen:TYPE(UNSIGNED6):0,0\n'
    + 'FIELD:dt_last_seen:TYPE(UNSIGNED6):0,0\n'
    + 'FIELD:dt_vendor_first_reported:TYPE(UNSIGNED6):0,0\n'
    + 'FIELD:dt_vendor_last_reported:TYPE(UNSIGNED6):0,0\n'
    + 'FIELD:bdid:TYPE(UNSIGNED6):0,0\n'
    + 'FIELD:bdid_score:TYPE(UNSIGNED1):0,0\n'
    + 'FIELD:did_score:TYPE(UNSIGNED1):0,0\n'
    + 'FIELD:orig_fname:TYPE(STRING40):0,0\n'
    + 'FIELD:orig_mname:TYPE(STRING40):0,0\n'
    + 'FIELD:orig_lname:TYPE(STRING60):0,0\n'
    + 'FIELD:orig_addr:TYPE(STRING75):0,0\n'
    + 'FIELD:orig_city:TYPE(STRING40):0,0\n'
    + 'FIELD:orig_state:TYPE(STRING2):0,0\n'
    + 'FIELD:orig_zip5:TYPE(STRING5):0,0\n'
    + 'FIELD:orig_zip4:TYPE(STRING4):0,0\n'
    + 'FIELD:email:TYPE(STRING90):0,0\n'
    + 'FIELD:employer:TYPE(STRING50):0,0\n'
    + 'FIELD:income:TYPE(STRING10):0,0\n'
    + 'FIELD:pay_frequency:TYPE(STRING20):0,0\n'
    + 'FIELD:phone_work:TYPE(STRING20):0,0\n'
    + 'FIELD:phone_home:TYPE(STRING20):0,0\n'
    + 'FIELD:phone_cell:TYPE(STRING20):0,0\n'
    + 'FIELD:dob:TYPE(STRING8):0,0\n'
    + 'FIELD:monthsemployed:TYPE(STRING4):0,0\n'
    + 'FIELD:own_home:TYPE(STRING1):0,0\n'
    + 'FIELD:is_military:TYPE(STRING1):0,0\n'
    + 'FIELD:drvlic_state:TYPE(STRING2):0,0\n'
    + 'FIELD:monthsatbank:TYPE(STRING4):0,0\n'
    + 'FIELD:ip:TYPE(STRING25):0,0\n'
    + 'FIELD:yrsthere:TYPE(STRING25):0,0\n'
    + 'FIELD:besttime:TYPE(STRING20):0,0\n'
    + 'FIELD:credit:TYPE(STRING20):0,0\n'
    + 'FIELD:loanamt:TYPE(STRING15):0,0\n'
    + 'FIELD:loantype:TYPE(STRING25):0,0\n'
    + 'FIELD:ratetype:TYPE(STRING15):0,0\n'
    + 'FIELD:mortrate:TYPE(STRING15):0,0\n'
    + 'FIELD:ltv:TYPE(STRING10):0,0\n'
    + 'FIELD:propertytype:TYPE(STRING25):0,0\n'
    + 'FIELD:datecollected:TYPE(STRING20):0,0\n'
    + 'FIELD:title:TYPE(STRING5):0,0\n'
    + 'FIELD:fname:TYPE(STRING20):0,0\n'
    + 'FIELD:mname:TYPE(STRING20):0,0\n'
    + 'FIELD:lname:TYPE(STRING20):0,0\n'
    + 'FIELD:name_suffix:TYPE(STRING5):0,0\n'
    + 'FIELD:nid:TYPE(UNSIGNED8):0,0\n'
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
    + 'FIELD:fips_st:TYPE(STRING2):0,0\n'
    + 'FIELD:fips_county:TYPE(STRING3):0,0\n'
    + 'FIELD:geo_lat:TYPE(STRING10):0,0\n'
    + 'FIELD:geo_long:TYPE(STRING11):0,0\n'
    + 'FIELD:msa:TYPE(STRING4):0,0\n'
    + 'FIELD:geo_blk:TYPE(STRING7):0,0\n'
    + 'FIELD:geo_match:TYPE(STRING1):0,0\n'
    + 'FIELD:err_stat:TYPE(STRING4):0,0\n'
    + 'FIELD:rawaid:TYPE(UNSIGNED8):0,0\n'
    + 'FIELD:aceaid:TYPE(UNSIGNED8):0,0\n'
    + 'FIELD:clean_phone_work:TYPE(STRING10):0,0\n'
    + 'FIELD:clean_phone_home:TYPE(STRING10):0,0\n'
    + 'FIELD:clean_phone_cell:TYPE(STRING10):0,0\n'
    + 'FIELD:clean_dob:TYPE(STRING8):0,0\n'
    + 'FIELD:__internal_fpos__:TYPE(UNSIGNED8):0,0\n'
    ;
 
  // Structured values
  EXPORT linkpaths := DATASET([
    ],{STRING linkpath;STRING compulsory;STRING optional;STRING bonus;STRING required;STRING search});
 
END;
