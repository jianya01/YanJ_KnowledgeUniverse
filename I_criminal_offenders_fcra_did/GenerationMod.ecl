// Machine-readable versions of the spec file and subsets thereof
IMPORT SALT311;
EXPORT GenerationMod := MODULE(SALT311.iGenerationMod)
 
  // SALT Version info
  EXPORT salt_VERSION := 'V3.11.2';
  EXPORT salt_MODULE := 'SALT311'; // Optional override by HACK:SALTMODULE
  EXPORT salt_TOOLSMODULE := 'SALTTOOLS30'; // Optional override by HACK:SALTTOOLSMODULE
 
  // Core module configuration values
  EXPORT spc_MODULE := 'I_criminal_offenders_fcra_did';
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
  EXPORT spc_EXTERNAL_BATCH_PARAM := ',/* MY_ */,vault_date_first_seen,vault_date_last_seen,vault_uid_hash,sdid,process_date,file_date,offender_key,vendor,source_file,record_type,orig_state,id_num,pty_nm,pty_nm_fmt,orig_lname,orig_fname,orig_mname,orig_name_suffix,lname,fname,mname,name_suffix,pty_typ,nid,ntype,nindicator,nitro_flag,ssn,case_num,case_court,case_date,case_type,case_type_desc,county_of_origin,dle_num,fbi_num,doc_num,ins_num,dl_num,dl_state,citizenship,dob,dob_alias,county_of_birth,place_of_birth,street_address_1,street_address_2,street_address_3,street_address_4,street_address_5,current_residence_county,legal_residence_county,race,race_desc,sex,hair_color,hair_color_desc,eye_color,eye_color_desc,skin_color,skin_color_desc,scars_marks_tattoos_1,scars_marks_tattoos_2,scars_marks_tattoos_3,scars_marks_tattoos_4,scars_marks_tattoos_5,height,weight,party_status,party_status_desc,_3g_offender,violent_offender,sex_offender,vop_offender,data_type,record_setup_date,datasource,prim_range,predir,prim_name,addr_suffix,postdir,unit_desig,sec_range,p_city_name,v_city_name,st,zip5,zip4,cart,cr_sort_sz,lot,lot_order,dpbc,chk_digit,rec_type,ace_fips_st,ace_fips_county,geo_lat,geo_long,msa,geo_blk,geo_match,err_stat,clean_errors,county_name,did,score,ssn_appended,curr_incar_flag,curr_parole_flag,curr_probation_flag,src_upload_date,age,image_link,fcra_conviction_flag,fcra_traffic_flag,fcra_date,fcra_date_type,conviction_override_date,conviction_override_date_type,offense_score,offender_persistent_id';
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
    + 'MODULE:I_criminal_offenders_fcra_did\n'
    + 'FILENAME:Vault\n'
    + 'INGESTFILE:OFPU:NAMED(Source)\n'
    + 'RIDFIELD:vault_rid\n'
    + 'SOURCERIDFIELD:vault_uid_hash\n'
    + 'FIELD:vault_date_first_seen:RECORDDATE(FIRST):\n'
    + 'FIELD:vault_date_last_seen:RECORDDATE(LAST):\n'
    + 'INGESTMODE:NONCONTIGUOUS(vault_date_first_seen,vault_date_last_seen)\n'
    + '\n'
    + 'FIELD:vault_uid_hash:TYPE(DATA16):0,0\n'
    + 'FIELD:sdid:TYPE(UNSIGNED6):0,0\n'
    + 'FIELD:process_date:TYPE(STRING8):0,0\n'
    + 'FIELD:file_date:TYPE(STRING8):0,0\n'
    + 'FIELD:offender_key:TYPE(STRING60):0,0\n'
    + 'FIELD:vendor:TYPE(STRING5):0,0\n'
    + 'FIELD:source_file:TYPE(STRING20):0,0\n'
    + 'FIELD:record_type:TYPE(STRING2):0,0\n'
    + 'FIELD:orig_state:TYPE(STRING25):0,0\n'
    + 'FIELD:id_num:TYPE(STRING15):0,0\n'
    + 'FIELD:pty_nm:TYPE(STRING56):0,0\n'
    + 'FIELD:pty_nm_fmt:TYPE(STRING1):0,0\n'
    + 'FIELD:orig_lname:TYPE(STRING20):0,0\n'
    + 'FIELD:orig_fname:TYPE(STRING20):0,0\n'
    + 'FIELD:orig_mname:TYPE(STRING20):0,0\n'
    + 'FIELD:orig_name_suffix:TYPE(STRING10):0,0\n'
    + 'FIELD:lname:TYPE(STRING20):0,0\n'
    + 'FIELD:fname:TYPE(STRING20):0,0\n'
    + 'FIELD:mname:TYPE(STRING20):0,0\n'
    + 'FIELD:name_suffix:TYPE(STRING6):0,0\n'
    + 'FIELD:pty_typ:TYPE(STRING1):0,0\n'
    + 'FIELD:nid:TYPE(UNSIGNED8):0,0\n'
    + 'FIELD:ntype:TYPE(STRING1):0,0\n'
    + 'FIELD:nindicator:TYPE(UNSIGNED2):0,0\n'
    + 'FIELD:nitro_flag:TYPE(STRING1):0,0\n'
    + 'FIELD:ssn:TYPE(STRING9):0,0\n'
    + 'FIELD:case_num:TYPE(STRING35):0,0\n'
    + 'FIELD:case_court:TYPE(STRING40):0,0\n'
    + 'FIELD:case_date:TYPE(STRING8):0,0\n'
    + 'FIELD:case_type:TYPE(STRING5):0,0\n'
    + 'FIELD:case_type_desc:TYPE(STRING25):0,0\n'
    + 'FIELD:county_of_origin:TYPE(STRING30):0,0\n'
    + 'FIELD:dle_num:TYPE(STRING10):0,0\n'
    + 'FIELD:fbi_num:TYPE(STRING9):0,0\n'
    + 'FIELD:doc_num:TYPE(STRING10):0,0\n'
    + 'FIELD:ins_num:TYPE(STRING10):0,0\n'
    + 'FIELD:dl_num:TYPE(STRING25):0,0\n'
    + 'FIELD:dl_state:TYPE(STRING2):0,0\n'
    + 'FIELD:citizenship:TYPE(STRING2):0,0\n'
    + 'FIELD:dob:TYPE(STRING8):0,0\n'
    + 'FIELD:dob_alias:TYPE(STRING8):0,0\n'
    + 'FIELD:county_of_birth:TYPE(STRING13):0,0\n'
    + 'FIELD:place_of_birth:TYPE(STRING25):0,0\n'
    + 'FIELD:street_address_1:TYPE(STRING25):0,0\n'
    + 'FIELD:street_address_2:TYPE(STRING25):0,0\n'
    + 'FIELD:street_address_3:TYPE(STRING25):0,0\n'
    + 'FIELD:street_address_4:TYPE(STRING10):0,0\n'
    + 'FIELD:street_address_5:TYPE(STRING10):0,0\n'
    + 'FIELD:current_residence_county:TYPE(STRING13):0,0\n'
    + 'FIELD:legal_residence_county:TYPE(STRING13):0,0\n'
    + 'FIELD:race:TYPE(STRING3):0,0\n'
    + 'FIELD:race_desc:TYPE(STRING30):0,0\n'
    + 'FIELD:sex:TYPE(STRING7):0,0\n'
    + 'FIELD:hair_color:TYPE(STRING3):0,0\n'
    + 'FIELD:hair_color_desc:TYPE(STRING15):0,0\n'
    + 'FIELD:eye_color:TYPE(STRING3):0,0\n'
    + 'FIELD:eye_color_desc:TYPE(STRING15):0,0\n'
    + 'FIELD:skin_color:TYPE(STRING3):0,0\n'
    + 'FIELD:skin_color_desc:TYPE(STRING15):0,0\n'
    + 'FIELD:scars_marks_tattoos_1:TYPE(STRING10):0,0\n'
    + 'FIELD:scars_marks_tattoos_2:TYPE(STRING10):0,0\n'
    + 'FIELD:scars_marks_tattoos_3:TYPE(STRING10):0,0\n'
    + 'FIELD:scars_marks_tattoos_4:TYPE(STRING10):0,0\n'
    + 'FIELD:scars_marks_tattoos_5:TYPE(STRING10):0,0\n'
    + 'FIELD:height:TYPE(STRING3):0,0\n'
    + 'FIELD:weight:TYPE(STRING3):0,0\n'
    + 'FIELD:party_status:TYPE(STRING5):0,0\n'
    + 'FIELD:party_status_desc:TYPE(STRING60):0,0\n'
    + 'FIELD:_3g_offender:TYPE(STRING10):0,0\n'
    + 'FIELD:violent_offender:TYPE(STRING10):0,0\n'
    + 'FIELD:sex_offender:TYPE(STRING10):0,0\n'
    + 'FIELD:vop_offender:TYPE(STRING10):0,0\n'
    + 'FIELD:data_type:TYPE(STRING1):0,0\n'
    + 'FIELD:record_setup_date:TYPE(STRING26):0,0\n'
    + 'FIELD:datasource:TYPE(STRING45):0,0\n'
    + 'FIELD:prim_range:TYPE(QSTRING8):0,0\n'
    + 'FIELD:predir:TYPE(STRING2):0,0\n'
    + 'FIELD:prim_name:TYPE(QSTRING21):0,0\n'
    + 'FIELD:addr_suffix:TYPE(QSTRING3):0,0\n'
    + 'FIELD:postdir:TYPE(STRING2):0,0\n'
    + 'FIELD:unit_desig:TYPE(QSTRING8):0,0\n'
    + 'FIELD:sec_range:TYPE(QSTRING6):0,0\n'
    + 'FIELD:p_city_name:TYPE(QSTRING19):0,0\n'
    + 'FIELD:v_city_name:TYPE(QSTRING19):0,0\n'
    + 'FIELD:st:TYPE(STRING2):0,0\n'
    + 'FIELD:zip5:TYPE(QSTRING4):0,0\n'
    + 'FIELD:zip4:TYPE(QSTRING3):0,0\n'
    + 'FIELD:cart:TYPE(STRING4):0,0\n'
    + 'FIELD:cr_sort_sz:TYPE(STRING1):0,0\n'
    + 'FIELD:lot:TYPE(STRING4):0,0\n'
    + 'FIELD:lot_order:TYPE(STRING1):0,0\n'
    + 'FIELD:dpbc:TYPE(STRING2):0,0\n'
    + 'FIELD:chk_digit:TYPE(STRING1):0,0\n'
    + 'FIELD:rec_type:TYPE(STRING2):0,0\n'
    + 'FIELD:ace_fips_st:TYPE(STRING2):0,0\n'
    + 'FIELD:ace_fips_county:TYPE(STRING3):0,0\n'
    + 'FIELD:geo_lat:TYPE(STRING10):0,0\n'
    + 'FIELD:geo_long:TYPE(STRING11):0,0\n'
    + 'FIELD:msa:TYPE(STRING4):0,0\n'
    + 'FIELD:geo_blk:TYPE(STRING7):0,0\n'
    + 'FIELD:geo_match:TYPE(STRING1):0,0\n'
    + 'FIELD:err_stat:TYPE(STRING4):0,0\n'
    + 'FIELD:clean_errors:TYPE(UNSIGNED1):0,0\n'
    + 'FIELD:county_name:TYPE(STRING18):0,0\n'
    + 'FIELD:did:TYPE(STRING12):0,0\n'
    + 'FIELD:score:TYPE(STRING3):0,0\n'
    + 'FIELD:ssn_appended:TYPE(STRING9):0,0\n'
    + 'FIELD:curr_incar_flag:TYPE(STRING1):0,0\n'
    + 'FIELD:curr_parole_flag:TYPE(STRING1):0,0\n'
    + 'FIELD:curr_probation_flag:TYPE(STRING1):0,0\n'
    + 'FIELD:src_upload_date:TYPE(STRING8):0,0\n'
    + 'FIELD:age:TYPE(STRING3):0,0\n'
    + 'FIELD:image_link:TYPE(STRING150):0,0\n'
    + 'FIELD:fcra_conviction_flag:TYPE(STRING1):0,0\n'
    + 'FIELD:fcra_traffic_flag:TYPE(STRING1):0,0\n'
    + 'FIELD:fcra_date:TYPE(STRING8):0,0\n'
    + 'FIELD:fcra_date_type:TYPE(STRING1):0,0\n'
    + 'FIELD:conviction_override_date:TYPE(STRING8):0,0\n'
    + 'FIELD:conviction_override_date_type:TYPE(STRING1):0,0\n'
    + 'FIELD:offense_score:TYPE(STRING2):0,0\n'
    + 'FIELD:offender_persistent_id:TYPE(UNSIGNED8):0,0\n'
    ;
 
  // Structured values
  EXPORT linkpaths := DATASET([
    ],{STRING linkpath;STRING compulsory;STRING optional;STRING bonus;STRING required;STRING search});
 
END;

