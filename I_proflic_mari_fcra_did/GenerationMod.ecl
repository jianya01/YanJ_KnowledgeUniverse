﻿// Machine-readable versions of the spec file and subsets thereof
IMPORT SALT311;
EXPORT GenerationMod := MODULE(SALT311.iGenerationMod)
 
  // SALT Version info
  EXPORT salt_VERSION := 'V3.11.2';
  EXPORT salt_MODULE := 'SALT311'; // Optional override by HACK:SALTMODULE
  EXPORT salt_TOOLSMODULE := 'SALTTOOLS30'; // Optional override by HACK:SALTTOOLSMODULE
 
  // Core module configuration values
  EXPORT spc_MODULE := 'I_proflic_mari_fcra_did';
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
  EXPORT spc_EXTERNAL_BATCH_PARAM := ',/* MY_ */,vault_date_first_seen,vault_date_last_seen,vault_uid_hash,s_did,mari_rid,primary_key,create_dte,last_upd_dte,stamp_dte,date_first_seen,date_last_seen,date_vendor_first_reported,date_vendor_last_reported,process_date,gen_nbr,std_prof_cd,std_prof_desc,std_source_upd,std_source_desc,type_cd,name_org_prefx,name_org,name_org_sufx,store_nbr,name_dba_prefx,name_dba,name_dba_sufx,store_nbr_dba,dba_flag,name_office,office_parse,name_prefx,name_first,name_mid,name_last,name_sufx,name_nick,birth_dte,gender,prov_stat,credential,license_nbr,off_license_nbr,off_license_nbr_type,brkr_license_nbr,brkr_license_nbr_type,license_state,raw_license_type,std_license_type,std_license_desc,raw_license_status,std_license_status,std_status_desc,curr_issue_dte,orig_issue_dte,expire_dte,renewal_dte,active_flag,ssn_taxid_1,tax_type_1,ssn_taxid_2,tax_type_2,fed_rssd,addr_bus_ind,name_format,name_org_orig,name_dba_orig,name_mari_org,name_mari_dba,phn_mari_1,phn_mari_fax_1,phn_mari_2,phn_mari_fax_2,addr_id_1,addr_addr1_1,addr_addr2_1,addr_city_1,addr_state_1,addr_zip5_1,addr_zip4_1,phn_phone_1,phn_fax_1,addr_cnty_1,addr_cntry_1,sud_key_1,ooc_ind_1,result_cd_1,addr_carrier_rte_1,addr_delivery_pt_1,addr_mail_ind,addr_id_2,addr_addr1_2,addr_addr2_2,addr_city_2,addr_state_2,addr_zip5_2,addr_zip4_2,addr_cnty_2,addr_cntry_2,phn_phone_2,phn_fax_2,sud_key_2,ooc_ind_2,result_cd_2,addr_carrier_rte_2,addr_delivery_pt_2,license_nbr_contact,name_contact_prefx,name_contact_first,name_contact_mid,name_contact_last,name_contact_sufx,name_contact_nick,name_contact_ttl,phn_contact,phn_contact_ext,phn_contact_fax,email,url,bk_class,bk_class_desc,charter,inst_beg_dte,origin_cd,origin_cd_desc,disp_type_cd,disp_type_desc,reg_agent,regulator,hqtr_city,hqtr_name,domestic_off_nbr,foreign_off_nbr,hcr_rssd,hcr_location,affil_type_cd,genlink,research_ind,docket_id,rec_key,mltreckey,old_cmc_slpk,cmc_slpk,pcmc_slpk,affil_key,match_id,provnote_1,provnote_2,provnote_3,prev_primary_key,prev_mltreckey,prev_cmc_slpk,prev_pcmc_slpk,persistent_record_id,addl_license_spec,cont_education_ernd,cont_education_req,cont_education_term,agency_id,site_location,business_type,displinary_action,violation_dte,violation_case_nbr,violation_desc,license_id,nmls_id,foreign_nmls_id,location_type,name_type,start_dte,agency_status,is_authorized_license,is_authorized_conduct,federal_regulator,dotid,dotscore,dotweight,empid,empscore,empweight,powid,powscore,powweight,proxid,proxscore,proxweight,seleid,selescore,seleweight,orgid,orgscore,orgweight,ultid,ultscore,ultweight,did,bdid,title,fname,mname,lname,name_suffix,name_company,name_company_dba,append_busaddrfirst,append_busaddrlast,append_busrawaid,append_busaceaid,append_mailaddrfirst,append_mailaddrlast,append_mailrawaid,append_mailaceaid,bus_prim_range,bus_predir,bus_prim_name,bus_addr_suffix,bus_postdir,bus_unit_desig,bus_sec_range,bus_p_city_name,bus_v_city_name,bus_state,bus_zip5,bus_zip4,bus_cart,bus_cr_sort_sz,bus_lot,bus_lot_order,bus_dpbc,bus_chk_digit,bus_rec_type,bus_ace_fips_st,bus_county,bus_geo_lat,bus_geo_long,bus_msa,bus_geo_blk,bus_geo_match,bus_err_stat,mail_prim_range,mail_predir,mail_prim_name,mail_addr_suffix,mail_postdir,mail_unit_desig,mail_sec_range,mail_p_city_name,mail_v_city_name,mail_state,mail_zip5,mail_zip4,mail_cart,mail_cr_sort_sz,mail_lot,mail_lot_order,mail_dpbc,mail_chk_digit,mail_rec_type,mail_ace_fips_st,mail_county,mail_geo_lat,mail_geo_long,mail_msa,mail_geo_blk,mail_geo_match,mail_err_stat,cln_license_nbr,__internal_fpos__';
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
    + 'MODULE:I_proflic_mari_fcra_did\n'
    + 'FILENAME:Vault\n'
    + 'INGESTFILE:OFPU:NAMED(Source)\n'
    + 'RIDFIELD:vault_rid\n'
    + 'SOURCERIDFIELD:vault_uid_hash\n'
    + 'FIELD:vault_date_first_seen:RECORDDATE(FIRST):\n'
    + 'FIELD:vault_date_last_seen:RECORDDATE(LAST):\n'
    + 'INGESTMODE:NONCONTIGUOUS(vault_date_first_seen,vault_date_last_seen)\n'
    + '\n'
    + 'FIELD:vault_uid_hash:TYPE(DATA16):0,0\n'
    + 'FIELD:s_did:TYPE(UNSIGNED6):0,0\n'
    + 'FIELD:mari_rid:TYPE(UNSIGNED6):0,0\n'
    + 'FIELD:primary_key:TYPE(UNSIGNED8):0,0\n'
    + 'FIELD:create_dte:TYPE(STRING8):0,0\n'
    + 'FIELD:last_upd_dte:TYPE(STRING8):0,0\n'
    + 'FIELD:stamp_dte:TYPE(STRING8):0,0\n'
    + 'FIELD:date_first_seen:TYPE(STRING8):0,0\n'
    + 'FIELD:date_last_seen:TYPE(STRING8):0,0\n'
    + 'FIELD:date_vendor_first_reported:TYPE(STRING8):0,0\n'
    + 'FIELD:date_vendor_last_reported:TYPE(STRING8):0,0\n'
    + 'FIELD:process_date:TYPE(STRING8):0,0\n'
    + 'FIELD:gen_nbr:TYPE(STRING10):0,0\n'
    + 'FIELD:std_prof_cd:TYPE(STRING3):0,0\n'
    + 'FIELD:std_prof_desc:TYPE(STRING40):0,0\n'
    + 'FIELD:std_source_upd:TYPE(STRING5):0,0\n'
    + 'FIELD:std_source_desc:TYPE(STRING80):0,0\n'
    + 'FIELD:type_cd:TYPE(STRING2):0,0\n'
    + 'FIELD:name_org_prefx:TYPE(STRING10):0,0\n'
    + 'FIELD:name_org:TYPE(STRING80):0,0\n'
    + 'FIELD:name_org_sufx:TYPE(STRING15):0,0\n'
    + 'FIELD:store_nbr:TYPE(STRING10):0,0\n'
    + 'FIELD:name_dba_prefx:TYPE(STRING10):0,0\n'
    + 'FIELD:name_dba:TYPE(STRING80):0,0\n'
    + 'FIELD:name_dba_sufx:TYPE(STRING15):0,0\n'
    + 'FIELD:store_nbr_dba:TYPE(STRING10):0,0\n'
    + 'FIELD:dba_flag:TYPE(UNSIGNED1):0,0\n'
    + 'FIELD:name_office:TYPE(STRING80):0,0\n'
    + 'FIELD:office_parse:TYPE(STRING2):0,0\n'
    + 'FIELD:name_prefx:TYPE(STRING8):0,0\n'
    + 'FIELD:name_first:TYPE(STRING30):0,0\n'
    + 'FIELD:name_mid:TYPE(STRING30):0,0\n'
    + 'FIELD:name_last:TYPE(STRING50):0,0\n'
    + 'FIELD:name_sufx:TYPE(STRING5):0,0\n'
    + 'FIELD:name_nick:TYPE(STRING15):0,0\n'
    + 'FIELD:birth_dte:TYPE(STRING8):0,0\n'
    + 'FIELD:gender:TYPE(STRING1):0,0\n'
    + 'FIELD:prov_stat:TYPE(STRING1):0,0\n'
    + 'FIELD:credential:TYPE(STRING14):0,0\n'
    + 'FIELD:license_nbr:TYPE(STRING30):0,0\n'
    + 'FIELD:off_license_nbr:TYPE(STRING30):0,0\n'
    + 'FIELD:off_license_nbr_type:TYPE(STRING50):0,0\n'
    + 'FIELD:brkr_license_nbr:TYPE(STRING30):0,0\n'
    + 'FIELD:brkr_license_nbr_type:TYPE(STRING50):0,0\n'
    + 'FIELD:license_state:TYPE(STRING2):0,0\n'
    + 'FIELD:raw_license_type:TYPE(STRING100):0,0\n'
    + 'FIELD:std_license_type:TYPE(STRING10):0,0\n'
    + 'FIELD:std_license_desc:TYPE(STRING120):0,0\n'
    + 'FIELD:raw_license_status:TYPE(STRING75):0,0\n'
    + 'FIELD:std_license_status:TYPE(STRING3):0,0\n'
    + 'FIELD:std_status_desc:TYPE(STRING120):0,0\n'
    + 'FIELD:curr_issue_dte:TYPE(STRING8):0,0\n'
    + 'FIELD:orig_issue_dte:TYPE(STRING8):0,0\n'
    + 'FIELD:expire_dte:TYPE(STRING8):0,0\n'
    + 'FIELD:renewal_dte:TYPE(STRING8):0,0\n'
    + 'FIELD:active_flag:TYPE(STRING6):0,0\n'
    + 'FIELD:ssn_taxid_1:TYPE(STRING9):0,0\n'
    + 'FIELD:tax_type_1:TYPE(STRING1):0,0\n'
    + 'FIELD:ssn_taxid_2:TYPE(STRING9):0,0\n'
    + 'FIELD:tax_type_2:TYPE(STRING1):0,0\n'
    + 'FIELD:fed_rssd:TYPE(STRING8):0,0\n'
    + 'FIELD:addr_bus_ind:TYPE(STRING1):0,0\n'
    + 'FIELD:name_format:TYPE(STRING1):0,0\n'
    + 'FIELD:name_org_orig:TYPE(STRING254):0,0\n'
    + 'FIELD:name_dba_orig:TYPE(STRING254):0,0\n'
    + 'FIELD:name_mari_org:TYPE(STRING254):0,0\n'
    + 'FIELD:name_mari_dba:TYPE(STRING254):0,0\n'
    + 'FIELD:phn_mari_1:TYPE(STRING15):0,0\n'
    + 'FIELD:phn_mari_fax_1:TYPE(STRING15):0,0\n'
    + 'FIELD:phn_mari_2:TYPE(STRING15):0,0\n'
    + 'FIELD:phn_mari_fax_2:TYPE(STRING15):0,0\n'
    + 'FIELD:addr_id_1:TYPE(STRING10):0,0\n'
    + 'FIELD:addr_addr1_1:TYPE(STRING50):0,0\n'
    + 'FIELD:addr_addr2_1:TYPE(STRING50):0,0\n'
    + 'FIELD:addr_city_1:TYPE(STRING25):0,0\n'
    + 'FIELD:addr_state_1:TYPE(STRING2):0,0\n'
    + 'FIELD:addr_zip5_1:TYPE(STRING5):0,0\n'
    + 'FIELD:addr_zip4_1:TYPE(STRING4):0,0\n'
    + 'FIELD:phn_phone_1:TYPE(STRING10):0,0\n'
    + 'FIELD:phn_fax_1:TYPE(STRING10):0,0\n'
    + 'FIELD:addr_cnty_1:TYPE(STRING35):0,0\n'
    + 'FIELD:addr_cntry_1:TYPE(STRING25):0,0\n'
    + 'FIELD:sud_key_1:TYPE(STRING5):0,0\n'
    + 'FIELD:ooc_ind_1:TYPE(UNSIGNED1):0,0\n'
    + 'FIELD:result_cd_1:TYPE(STRING2):0,0\n'
    + 'FIELD:addr_carrier_rte_1:TYPE(STRING4):0,0\n'
    + 'FIELD:addr_delivery_pt_1:TYPE(STRING3):0,0\n'
    + 'FIELD:addr_mail_ind:TYPE(STRING1):0,0\n'
    + 'FIELD:addr_id_2:TYPE(STRING10):0,0\n'
    + 'FIELD:addr_addr1_2:TYPE(STRING50):0,0\n'
    + 'FIELD:addr_addr2_2:TYPE(STRING50):0,0\n'
    + 'FIELD:addr_city_2:TYPE(STRING25):0,0\n'
    + 'FIELD:addr_state_2:TYPE(STRING2):0,0\n'
    + 'FIELD:addr_zip5_2:TYPE(STRING5):0,0\n'
    + 'FIELD:addr_zip4_2:TYPE(STRING4):0,0\n'
    + 'FIELD:addr_cnty_2:TYPE(STRING35):0,0\n'
    + 'FIELD:addr_cntry_2:TYPE(STRING25):0,0\n'
    + 'FIELD:phn_phone_2:TYPE(STRING10):0,0\n'
    + 'FIELD:phn_fax_2:TYPE(STRING10):0,0\n'
    + 'FIELD:sud_key_2:TYPE(STRING5):0,0\n'
    + 'FIELD:ooc_ind_2:TYPE(UNSIGNED8):0,0\n'
    + 'FIELD:result_cd_2:TYPE(STRING2):0,0\n'
    + 'FIELD:addr_carrier_rte_2:TYPE(STRING5):0,0\n'
    + 'FIELD:addr_delivery_pt_2:TYPE(STRING3):0,0\n'
    + 'FIELD:license_nbr_contact:TYPE(STRING15):0,0\n'
    + 'FIELD:name_contact_prefx:TYPE(STRING8):0,0\n'
    + 'FIELD:name_contact_first:TYPE(STRING15):0,0\n'
    + 'FIELD:name_contact_mid:TYPE(STRING15):0,0\n'
    + 'FIELD:name_contact_last:TYPE(STRING30):0,0\n'
    + 'FIELD:name_contact_sufx:TYPE(STRING3):0,0\n'
    + 'FIELD:name_contact_nick:TYPE(STRING15):0,0\n'
    + 'FIELD:name_contact_ttl:TYPE(STRING40):0,0\n'
    + 'FIELD:phn_contact:TYPE(STRING10):0,0\n'
    + 'FIELD:phn_contact_ext:TYPE(STRING6):0,0\n'
    + 'FIELD:phn_contact_fax:TYPE(STRING10):0,0\n'
    + 'FIELD:email:TYPE(STRING80):0,0\n'
    + 'FIELD:url:TYPE(STRING80):0,0\n'
    + 'FIELD:bk_class:TYPE(STRING7):0,0\n'
    + 'FIELD:bk_class_desc:TYPE(STRING75):0,0\n'
    + 'FIELD:charter:TYPE(STRING7):0,0\n'
    + 'FIELD:inst_beg_dte:TYPE(STRING10):0,0\n'
    + 'FIELD:origin_cd:TYPE(STRING1):0,0\n'
    + 'FIELD:origin_cd_desc:TYPE(STRING35):0,0\n'
    + 'FIELD:disp_type_cd:TYPE(STRING5):0,0\n'
    + 'FIELD:disp_type_desc:TYPE(STRING250):0,0\n'
    + 'FIELD:reg_agent:TYPE(STRING7):0,0\n'
    + 'FIELD:regulator:TYPE(STRING150):0,0\n'
    + 'FIELD:hqtr_city:TYPE(STRING22):0,0\n'
    + 'FIELD:hqtr_name:TYPE(STRING95):0,0\n'
    + 'FIELD:domestic_off_nbr:TYPE(STRING6):0,0\n'
    + 'FIELD:foreign_off_nbr:TYPE(STRING5):0,0\n'
    + 'FIELD:hcr_rssd:TYPE(STRING7):0,0\n'
    + 'FIELD:hcr_location:TYPE(STRING8):0,0\n'
    + 'FIELD:affil_type_cd:TYPE(STRING2):0,0\n'
    + 'FIELD:genlink:TYPE(STRING10):0,0\n'
    + 'FIELD:research_ind:TYPE(UNSIGNED1):0,0\n'
    + 'FIELD:docket_id:TYPE(STRING6):0,0\n'
    + 'FIELD:rec_key:TYPE(UNSIGNED8):0,0\n'
    + 'FIELD:mltreckey:TYPE(UNSIGNED8):0,0\n'
    + 'FIELD:old_cmc_slpk:TYPE(UNSIGNED8):0,0\n'
    + 'FIELD:cmc_slpk:TYPE(UNSIGNED8):0,0\n'
    + 'FIELD:pcmc_slpk:TYPE(UNSIGNED8):0,0\n'
    + 'FIELD:affil_key:TYPE(UNSIGNED8):0,0\n'
    + 'FIELD:match_id:TYPE(STRING15):0,0\n'
    + 'FIELD:provnote_1:TYPE(STRING):0,0\n'
    + 'FIELD:provnote_2:TYPE(STRING):0,0\n'
    + 'FIELD:provnote_3:TYPE(STRING):0,0\n'
    + 'FIELD:prev_primary_key:TYPE(UNSIGNED8):0,0\n'
    + 'FIELD:prev_mltreckey:TYPE(UNSIGNED8):0,0\n'
    + 'FIELD:prev_cmc_slpk:TYPE(UNSIGNED8):0,0\n'
    + 'FIELD:prev_pcmc_slpk:TYPE(UNSIGNED8):0,0\n'
    + 'FIELD:persistent_record_id:TYPE(UNSIGNED8):0,0\n'
    + 'FIELD:addl_license_spec:TYPE(STRING75):0,0\n'
    + 'FIELD:cont_education_ernd:TYPE(STRING50):0,0\n'
    + 'FIELD:cont_education_req:TYPE(STRING60):0,0\n'
    + 'FIELD:cont_education_term:TYPE(STRING10):0,0\n'
    + 'FIELD:agency_id:TYPE(STRING30):0,0\n'
    + 'FIELD:site_location:TYPE(STRING60):0,0\n'
    + 'FIELD:business_type:TYPE(STRING50):0,0\n'
    + 'FIELD:displinary_action:TYPE(STRING500):0,0\n'
    + 'FIELD:violation_dte:TYPE(STRING8):0,0\n'
    + 'FIELD:violation_case_nbr:TYPE(STRING50):0,0\n'
    + 'FIELD:violation_desc:TYPE(STRING200):0,0\n'
    + 'FIELD:license_id:TYPE(UNSIGNED8):0,0\n'
    + 'FIELD:nmls_id:TYPE(UNSIGNED8):0,0\n'
    + 'FIELD:foreign_nmls_id:TYPE(UNSIGNED8):0,0\n'
    + 'FIELD:location_type:TYPE(STRING6):0,0\n'
    + 'FIELD:name_type:TYPE(STRING11):0,0\n'
    + 'FIELD:start_dte:TYPE(STRING8):0,0\n'
    + 'FIELD:agency_status:TYPE(STRING20):0,0\n'
    + 'FIELD:is_authorized_license:TYPE(STRING3):0,0\n'
    + 'FIELD:is_authorized_conduct:TYPE(STRING3):0,0\n'
    + 'FIELD:federal_regulator:TYPE(STRING150):0,0\n'
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
    + 'FIELD:did:TYPE(UNSIGNED6):0,0\n'
    + 'FIELD:bdid:TYPE(UNSIGNED6):0,0\n'
    + 'FIELD:title:TYPE(STRING5):0,0\n'
    + 'FIELD:fname:TYPE(STRING20):0,0\n'
    + 'FIELD:mname:TYPE(STRING20):0,0\n'
    + 'FIELD:lname:TYPE(STRING20):0,0\n'
    + 'FIELD:name_suffix:TYPE(STRING5):0,0\n'
    + 'FIELD:name_company:TYPE(STRING254):0,0\n'
    + 'FIELD:name_company_dba:TYPE(STRING254):0,0\n'
    + 'FIELD:append_busaddrfirst:TYPE(STRING100):0,0\n'
    + 'FIELD:append_busaddrlast:TYPE(STRING50):0,0\n'
    + 'FIELD:append_busrawaid:TYPE(UNSIGNED8):0,0\n'
    + 'FIELD:append_busaceaid:TYPE(UNSIGNED8):0,0\n'
    + 'FIELD:append_mailaddrfirst:TYPE(STRING100):0,0\n'
    + 'FIELD:append_mailaddrlast:TYPE(STRING50):0,0\n'
    + 'FIELD:append_mailrawaid:TYPE(UNSIGNED8):0,0\n'
    + 'FIELD:append_mailaceaid:TYPE(UNSIGNED8):0,0\n'
    + 'FIELD:bus_prim_range:TYPE(STRING10):0,0\n'
    + 'FIELD:bus_predir:TYPE(STRING2):0,0\n'
    + 'FIELD:bus_prim_name:TYPE(STRING28):0,0\n'
    + 'FIELD:bus_addr_suffix:TYPE(STRING4):0,0\n'
    + 'FIELD:bus_postdir:TYPE(STRING2):0,0\n'
    + 'FIELD:bus_unit_desig:TYPE(STRING10):0,0\n'
    + 'FIELD:bus_sec_range:TYPE(STRING8):0,0\n'
    + 'FIELD:bus_p_city_name:TYPE(STRING30):0,0\n'
    + 'FIELD:bus_v_city_name:TYPE(STRING25):0,0\n'
    + 'FIELD:bus_state:TYPE(STRING2):0,0\n'
    + 'FIELD:bus_zip5:TYPE(STRING6):0,0\n'
    + 'FIELD:bus_zip4:TYPE(STRING4):0,0\n'
    + 'FIELD:bus_cart:TYPE(STRING4):0,0\n'
    + 'FIELD:bus_cr_sort_sz:TYPE(STRING1):0,0\n'
    + 'FIELD:bus_lot:TYPE(STRING4):0,0\n'
    + 'FIELD:bus_lot_order:TYPE(STRING1):0,0\n'
    + 'FIELD:bus_dpbc:TYPE(STRING2):0,0\n'
    + 'FIELD:bus_chk_digit:TYPE(STRING1):0,0\n'
    + 'FIELD:bus_rec_type:TYPE(STRING2):0,0\n'
    + 'FIELD:bus_ace_fips_st:TYPE(STRING2):0,0\n'
    + 'FIELD:bus_county:TYPE(STRING3):0,0\n'
    + 'FIELD:bus_geo_lat:TYPE(STRING10):0,0\n'
    + 'FIELD:bus_geo_long:TYPE(STRING11):0,0\n'
    + 'FIELD:bus_msa:TYPE(STRING4):0,0\n'
    + 'FIELD:bus_geo_blk:TYPE(STRING7):0,0\n'
    + 'FIELD:bus_geo_match:TYPE(STRING1):0,0\n'
    + 'FIELD:bus_err_stat:TYPE(STRING5):0,0\n'
    + 'FIELD:mail_prim_range:TYPE(STRING10):0,0\n'
    + 'FIELD:mail_predir:TYPE(STRING2):0,0\n'
    + 'FIELD:mail_prim_name:TYPE(STRING28):0,0\n'
    + 'FIELD:mail_addr_suffix:TYPE(STRING4):0,0\n'
    + 'FIELD:mail_postdir:TYPE(STRING2):0,0\n'
    + 'FIELD:mail_unit_desig:TYPE(STRING10):0,0\n'
    + 'FIELD:mail_sec_range:TYPE(STRING8):0,0\n'
    + 'FIELD:mail_p_city_name:TYPE(STRING30):0,0\n'
    + 'FIELD:mail_v_city_name:TYPE(STRING25):0,0\n'
    + 'FIELD:mail_state:TYPE(STRING2):0,0\n'
    + 'FIELD:mail_zip5:TYPE(STRING6):0,0\n'
    + 'FIELD:mail_zip4:TYPE(STRING4):0,0\n'
    + 'FIELD:mail_cart:TYPE(STRING4):0,0\n'
    + 'FIELD:mail_cr_sort_sz:TYPE(STRING1):0,0\n'
    + 'FIELD:mail_lot:TYPE(STRING4):0,0\n'
    + 'FIELD:mail_lot_order:TYPE(STRING1):0,0\n'
    + 'FIELD:mail_dpbc:TYPE(STRING2):0,0\n'
    + 'FIELD:mail_chk_digit:TYPE(STRING1):0,0\n'
    + 'FIELD:mail_rec_type:TYPE(STRING2):0,0\n'
    + 'FIELD:mail_ace_fips_st:TYPE(STRING2):0,0\n'
    + 'FIELD:mail_county:TYPE(STRING3):0,0\n'
    + 'FIELD:mail_geo_lat:TYPE(STRING10):0,0\n'
    + 'FIELD:mail_geo_long:TYPE(STRING11):0,0\n'
    + 'FIELD:mail_msa:TYPE(STRING4):0,0\n'
    + 'FIELD:mail_geo_blk:TYPE(STRING7):0,0\n'
    + 'FIELD:mail_geo_match:TYPE(STRING1):0,0\n'
    + 'FIELD:mail_err_stat:TYPE(STRING5):0,0\n'
    + 'FIELD:cln_license_nbr:TYPE(STRING30):0,0\n'
    + 'FIELD:__internal_fpos__:TYPE(UNSIGNED8):0,0\n'
    ;
 
  // Structured values
  EXPORT linkpaths := DATASET([
    ],{STRING linkpath;STRING compulsory;STRING optional;STRING bonus;STRING required;STRING search});
 
END;

