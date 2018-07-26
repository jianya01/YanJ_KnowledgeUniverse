IMPORT STD,SALT311;
EXPORT Ingest(BOOLEAN CloseOlds = FALSE, STRING EndDate='',DATASET(Layout_Vault) dsBase = In_Vault // Change IN_Vault to change input to ingest process
, DATASET(RECORDOF(Source))  infile = Source
) := MODULE
  SHARED NullFile := DATASET([],Layout_Vault); // Use to replace files you wish to remove
 
  SHARED FilesToIngest := infile;
  // Now need to discover which records are old / new / updated
  EXPORT RecordType := ENUM(UNSIGNED1,Unknown,Ancient,Old,Unchanged,Updated,New);
  EXPORT RTToText(unsigned1 c) := CHOOSE(c,'UNKNOWN','Ancient','Old','Unchanged','Updated','New','UNKNOWN');
  SHARED WithRT := RECORD
    Layout_Vault;
    __Tpe := RecordType.Unknown;
  END;
 
  // Base recs start out Old, Ingest recs start out New -- matched records will become Unchanged or Updated below
  SHARED FilesToIngest0 := PROJECT(FilesToIngest,TRANSFORM(WithRT,SELF.__Tpe:=RecordType.New,SELF:=LEFT));
  SHARED Base0 := PROJECT(dsBase,TRANSFORM(WithRT,SELF.__Tpe:=RecordType.Old,SELF:=LEFT));
 
  WithRT MergeData(WithRT le, WithRT ri) := TRANSFORM // Old,Unchanged,New
    SELF.__Tpe := MAP (le.__Tpe = 0 => ri.__Tpe,ri.__Tpe = 0 => le.__Tpe,RecordType.Unchanged);
    SELF := IF( le.__Tpe=0,ri,le);
  END;
 
  // Ingest0: Merge Base with IngestFiles to get old, new and unchanged
  Ingest0 := JOIN( Base0,FilesToIngest0,LEFT.vault_uid_hash=RIGHT.vault_uid_hash AND LEFT.s_did=RIGHT.s_did AND LEFT.mari_rid=RIGHT.mari_rid AND LEFT.primary_key=RIGHT.primary_key AND LEFT.create_dte=RIGHT.create_dte AND LEFT.last_upd_dte=RIGHT.last_upd_dte AND LEFT.stamp_dte=RIGHT.stamp_dte
              AND LEFT.date_first_seen=RIGHT.date_first_seen AND LEFT.date_last_seen=RIGHT.date_last_seen AND LEFT.date_vendor_first_reported=RIGHT.date_vendor_first_reported AND LEFT.date_vendor_last_reported=RIGHT.date_vendor_last_reported AND LEFT.process_date=RIGHT.process_date AND LEFT.gen_nbr=RIGHT.gen_nbr AND LEFT.std_prof_cd=RIGHT.std_prof_cd AND LEFT.std_prof_desc=RIGHT.std_prof_desc AND LEFT.std_source_upd=RIGHT.std_source_upd AND LEFT.std_source_desc=RIGHT.std_source_desc
              AND LEFT.type_cd=RIGHT.type_cd AND LEFT.name_org_prefx=RIGHT.name_org_prefx AND LEFT.name_org=RIGHT.name_org AND LEFT.name_org_sufx=RIGHT.name_org_sufx AND LEFT.store_nbr=RIGHT.store_nbr AND LEFT.name_dba_prefx=RIGHT.name_dba_prefx AND LEFT.name_dba=RIGHT.name_dba AND LEFT.name_dba_sufx=RIGHT.name_dba_sufx AND LEFT.store_nbr_dba=RIGHT.store_nbr_dba AND LEFT.dba_flag=RIGHT.dba_flag
              AND LEFT.name_office=RIGHT.name_office AND LEFT.office_parse=RIGHT.office_parse AND LEFT.name_prefx=RIGHT.name_prefx AND LEFT.name_first=RIGHT.name_first AND LEFT.name_mid=RIGHT.name_mid AND LEFT.name_last=RIGHT.name_last AND LEFT.name_sufx=RIGHT.name_sufx AND LEFT.name_nick=RIGHT.name_nick AND LEFT.birth_dte=RIGHT.birth_dte AND LEFT.gender=RIGHT.gender
              AND LEFT.prov_stat=RIGHT.prov_stat AND LEFT.credential=RIGHT.credential AND LEFT.license_nbr=RIGHT.license_nbr AND LEFT.off_license_nbr=RIGHT.off_license_nbr AND LEFT.off_license_nbr_type=RIGHT.off_license_nbr_type AND LEFT.brkr_license_nbr=RIGHT.brkr_license_nbr AND LEFT.brkr_license_nbr_type=RIGHT.brkr_license_nbr_type AND LEFT.license_state=RIGHT.license_state AND LEFT.raw_license_type=RIGHT.raw_license_type AND LEFT.std_license_type=RIGHT.std_license_type
              AND LEFT.std_license_desc=RIGHT.std_license_desc AND LEFT.raw_license_status=RIGHT.raw_license_status AND LEFT.std_license_status=RIGHT.std_license_status AND LEFT.std_status_desc=RIGHT.std_status_desc AND LEFT.curr_issue_dte=RIGHT.curr_issue_dte AND LEFT.orig_issue_dte=RIGHT.orig_issue_dte AND LEFT.expire_dte=RIGHT.expire_dte AND LEFT.renewal_dte=RIGHT.renewal_dte AND LEFT.active_flag=RIGHT.active_flag AND LEFT.ssn_taxid_1=RIGHT.ssn_taxid_1
              AND LEFT.tax_type_1=RIGHT.tax_type_1 AND LEFT.ssn_taxid_2=RIGHT.ssn_taxid_2 AND LEFT.tax_type_2=RIGHT.tax_type_2 AND LEFT.fed_rssd=RIGHT.fed_rssd AND LEFT.addr_bus_ind=RIGHT.addr_bus_ind AND LEFT.name_format=RIGHT.name_format AND LEFT.name_org_orig=RIGHT.name_org_orig AND LEFT.name_dba_orig=RIGHT.name_dba_orig AND LEFT.name_mari_org=RIGHT.name_mari_org AND LEFT.name_mari_dba=RIGHT.name_mari_dba
              AND LEFT.phn_mari_1=RIGHT.phn_mari_1 AND LEFT.phn_mari_fax_1=RIGHT.phn_mari_fax_1 AND LEFT.phn_mari_2=RIGHT.phn_mari_2 AND LEFT.phn_mari_fax_2=RIGHT.phn_mari_fax_2 AND LEFT.addr_id_1=RIGHT.addr_id_1 AND LEFT.addr_addr1_1=RIGHT.addr_addr1_1 AND LEFT.addr_addr2_1=RIGHT.addr_addr2_1 AND LEFT.addr_city_1=RIGHT.addr_city_1 AND LEFT.addr_state_1=RIGHT.addr_state_1 AND LEFT.addr_zip5_1=RIGHT.addr_zip5_1
              AND LEFT.addr_zip4_1=RIGHT.addr_zip4_1 AND LEFT.phn_phone_1=RIGHT.phn_phone_1 AND LEFT.phn_fax_1=RIGHT.phn_fax_1 AND LEFT.addr_cnty_1=RIGHT.addr_cnty_1 AND LEFT.addr_cntry_1=RIGHT.addr_cntry_1 AND LEFT.sud_key_1=RIGHT.sud_key_1 AND LEFT.ooc_ind_1=RIGHT.ooc_ind_1 AND LEFT.result_cd_1=RIGHT.result_cd_1 AND LEFT.addr_carrier_rte_1=RIGHT.addr_carrier_rte_1 AND LEFT.addr_delivery_pt_1=RIGHT.addr_delivery_pt_1
              AND LEFT.addr_mail_ind=RIGHT.addr_mail_ind AND LEFT.addr_id_2=RIGHT.addr_id_2 AND LEFT.addr_addr1_2=RIGHT.addr_addr1_2 AND LEFT.addr_addr2_2=RIGHT.addr_addr2_2 AND LEFT.addr_city_2=RIGHT.addr_city_2 AND LEFT.addr_state_2=RIGHT.addr_state_2 AND LEFT.addr_zip5_2=RIGHT.addr_zip5_2 AND LEFT.addr_zip4_2=RIGHT.addr_zip4_2 AND LEFT.addr_cnty_2=RIGHT.addr_cnty_2 AND LEFT.addr_cntry_2=RIGHT.addr_cntry_2
              AND LEFT.phn_phone_2=RIGHT.phn_phone_2 AND LEFT.phn_fax_2=RIGHT.phn_fax_2 AND LEFT.sud_key_2=RIGHT.sud_key_2 AND LEFT.ooc_ind_2=RIGHT.ooc_ind_2 AND LEFT.result_cd_2=RIGHT.result_cd_2 AND LEFT.addr_carrier_rte_2=RIGHT.addr_carrier_rte_2 AND LEFT.addr_delivery_pt_2=RIGHT.addr_delivery_pt_2 AND LEFT.license_nbr_contact=RIGHT.license_nbr_contact AND LEFT.name_contact_prefx=RIGHT.name_contact_prefx AND LEFT.name_contact_first=RIGHT.name_contact_first
              AND LEFT.name_contact_mid=RIGHT.name_contact_mid AND LEFT.name_contact_last=RIGHT.name_contact_last AND LEFT.name_contact_sufx=RIGHT.name_contact_sufx AND LEFT.name_contact_nick=RIGHT.name_contact_nick AND LEFT.name_contact_ttl=RIGHT.name_contact_ttl AND LEFT.phn_contact=RIGHT.phn_contact AND LEFT.phn_contact_ext=RIGHT.phn_contact_ext AND LEFT.phn_contact_fax=RIGHT.phn_contact_fax AND LEFT.email=RIGHT.email AND LEFT.url=RIGHT.url
              AND LEFT.bk_class=RIGHT.bk_class AND LEFT.bk_class_desc=RIGHT.bk_class_desc AND LEFT.charter=RIGHT.charter AND LEFT.inst_beg_dte=RIGHT.inst_beg_dte AND LEFT.origin_cd=RIGHT.origin_cd AND LEFT.origin_cd_desc=RIGHT.origin_cd_desc AND LEFT.disp_type_cd=RIGHT.disp_type_cd AND LEFT.disp_type_desc=RIGHT.disp_type_desc AND LEFT.reg_agent=RIGHT.reg_agent AND LEFT.regulator=RIGHT.regulator
              AND LEFT.hqtr_city=RIGHT.hqtr_city AND LEFT.hqtr_name=RIGHT.hqtr_name AND LEFT.domestic_off_nbr=RIGHT.domestic_off_nbr AND LEFT.foreign_off_nbr=RIGHT.foreign_off_nbr AND LEFT.hcr_rssd=RIGHT.hcr_rssd AND LEFT.hcr_location=RIGHT.hcr_location AND LEFT.affil_type_cd=RIGHT.affil_type_cd AND LEFT.genlink=RIGHT.genlink AND LEFT.research_ind=RIGHT.research_ind AND LEFT.docket_id=RIGHT.docket_id
              AND LEFT.rec_key=RIGHT.rec_key AND LEFT.mltreckey=RIGHT.mltreckey AND LEFT.old_cmc_slpk=RIGHT.old_cmc_slpk AND LEFT.cmc_slpk=RIGHT.cmc_slpk AND LEFT.pcmc_slpk=RIGHT.pcmc_slpk AND LEFT.affil_key=RIGHT.affil_key AND LEFT.match_id=RIGHT.match_id AND LEFT.provnote_1=RIGHT.provnote_1 AND LEFT.provnote_2=RIGHT.provnote_2 AND LEFT.provnote_3=RIGHT.provnote_3
              AND LEFT.prev_primary_key=RIGHT.prev_primary_key AND LEFT.prev_mltreckey=RIGHT.prev_mltreckey AND LEFT.prev_cmc_slpk=RIGHT.prev_cmc_slpk AND LEFT.prev_pcmc_slpk=RIGHT.prev_pcmc_slpk AND LEFT.persistent_record_id=RIGHT.persistent_record_id AND LEFT.addl_license_spec=RIGHT.addl_license_spec AND LEFT.cont_education_ernd=RIGHT.cont_education_ernd AND LEFT.cont_education_req=RIGHT.cont_education_req AND LEFT.cont_education_term=RIGHT.cont_education_term AND LEFT.agency_id=RIGHT.agency_id
              AND LEFT.site_location=RIGHT.site_location AND LEFT.business_type=RIGHT.business_type AND LEFT.displinary_action=RIGHT.displinary_action AND LEFT.violation_dte=RIGHT.violation_dte AND LEFT.violation_case_nbr=RIGHT.violation_case_nbr AND LEFT.violation_desc=RIGHT.violation_desc AND LEFT.license_id=RIGHT.license_id AND LEFT.nmls_id=RIGHT.nmls_id AND LEFT.foreign_nmls_id=RIGHT.foreign_nmls_id AND LEFT.location_type=RIGHT.location_type
              AND LEFT.name_type=RIGHT.name_type AND LEFT.start_dte=RIGHT.start_dte AND LEFT.agency_status=RIGHT.agency_status AND LEFT.is_authorized_license=RIGHT.is_authorized_license AND LEFT.is_authorized_conduct=RIGHT.is_authorized_conduct AND LEFT.federal_regulator=RIGHT.federal_regulator AND LEFT.dotid=RIGHT.dotid AND LEFT.dotscore=RIGHT.dotscore AND LEFT.dotweight=RIGHT.dotweight AND LEFT.empid=RIGHT.empid
              AND LEFT.empscore=RIGHT.empscore AND LEFT.empweight=RIGHT.empweight AND LEFT.powid=RIGHT.powid AND LEFT.powscore=RIGHT.powscore AND LEFT.powweight=RIGHT.powweight AND LEFT.proxid=RIGHT.proxid AND LEFT.proxscore=RIGHT.proxscore AND LEFT.proxweight=RIGHT.proxweight AND LEFT.seleid=RIGHT.seleid AND LEFT.selescore=RIGHT.selescore
              AND LEFT.seleweight=RIGHT.seleweight AND LEFT.orgid=RIGHT.orgid AND LEFT.orgscore=RIGHT.orgscore AND LEFT.orgweight=RIGHT.orgweight AND LEFT.ultid=RIGHT.ultid AND LEFT.ultscore=RIGHT.ultscore AND LEFT.ultweight=RIGHT.ultweight AND LEFT.did=RIGHT.did AND LEFT.bdid=RIGHT.bdid AND LEFT.title=RIGHT.title
              AND LEFT.fname=RIGHT.fname AND LEFT.mname=RIGHT.mname AND LEFT.lname=RIGHT.lname AND LEFT.name_suffix=RIGHT.name_suffix AND LEFT.name_company=RIGHT.name_company AND LEFT.name_company_dba=RIGHT.name_company_dba AND LEFT.append_busaddrfirst=RIGHT.append_busaddrfirst AND LEFT.append_busaddrlast=RIGHT.append_busaddrlast AND LEFT.append_busrawaid=RIGHT.append_busrawaid AND LEFT.append_busaceaid=RIGHT.append_busaceaid
              AND LEFT.append_mailaddrfirst=RIGHT.append_mailaddrfirst AND LEFT.append_mailaddrlast=RIGHT.append_mailaddrlast AND LEFT.append_mailrawaid=RIGHT.append_mailrawaid AND LEFT.append_mailaceaid=RIGHT.append_mailaceaid AND LEFT.bus_prim_range=RIGHT.bus_prim_range AND LEFT.bus_predir=RIGHT.bus_predir AND LEFT.bus_prim_name=RIGHT.bus_prim_name AND LEFT.bus_addr_suffix=RIGHT.bus_addr_suffix AND LEFT.bus_postdir=RIGHT.bus_postdir AND LEFT.bus_unit_desig=RIGHT.bus_unit_desig
              AND LEFT.bus_sec_range=RIGHT.bus_sec_range AND LEFT.bus_p_city_name=RIGHT.bus_p_city_name AND LEFT.bus_v_city_name=RIGHT.bus_v_city_name AND LEFT.bus_state=RIGHT.bus_state AND LEFT.bus_zip5=RIGHT.bus_zip5 AND LEFT.bus_zip4=RIGHT.bus_zip4 AND LEFT.bus_cart=RIGHT.bus_cart AND LEFT.bus_cr_sort_sz=RIGHT.bus_cr_sort_sz AND LEFT.bus_lot=RIGHT.bus_lot AND LEFT.bus_lot_order=RIGHT.bus_lot_order
              AND LEFT.bus_dpbc=RIGHT.bus_dpbc AND LEFT.bus_chk_digit=RIGHT.bus_chk_digit AND LEFT.bus_rec_type=RIGHT.bus_rec_type AND LEFT.bus_ace_fips_st=RIGHT.bus_ace_fips_st AND LEFT.bus_county=RIGHT.bus_county AND LEFT.bus_geo_lat=RIGHT.bus_geo_lat AND LEFT.bus_geo_long=RIGHT.bus_geo_long AND LEFT.bus_msa=RIGHT.bus_msa AND LEFT.bus_geo_blk=RIGHT.bus_geo_blk AND LEFT.bus_geo_match=RIGHT.bus_geo_match
              AND LEFT.bus_err_stat=RIGHT.bus_err_stat AND LEFT.mail_prim_range=RIGHT.mail_prim_range AND LEFT.mail_predir=RIGHT.mail_predir AND LEFT.mail_prim_name=RIGHT.mail_prim_name AND LEFT.mail_addr_suffix=RIGHT.mail_addr_suffix AND LEFT.mail_postdir=RIGHT.mail_postdir AND LEFT.mail_unit_desig=RIGHT.mail_unit_desig AND LEFT.mail_sec_range=RIGHT.mail_sec_range AND LEFT.mail_p_city_name=RIGHT.mail_p_city_name AND LEFT.mail_v_city_name=RIGHT.mail_v_city_name
              AND LEFT.mail_state=RIGHT.mail_state AND LEFT.mail_zip5=RIGHT.mail_zip5 AND LEFT.mail_zip4=RIGHT.mail_zip4 AND LEFT.mail_cart=RIGHT.mail_cart AND LEFT.mail_cr_sort_sz=RIGHT.mail_cr_sort_sz AND LEFT.mail_lot=RIGHT.mail_lot AND LEFT.mail_lot_order=RIGHT.mail_lot_order AND LEFT.mail_dpbc=RIGHT.mail_dpbc AND LEFT.mail_chk_digit=RIGHT.mail_chk_digit AND LEFT.mail_rec_type=RIGHT.mail_rec_type
              AND LEFT.mail_ace_fips_st=RIGHT.mail_ace_fips_st AND LEFT.mail_county=RIGHT.mail_county AND LEFT.mail_geo_lat=RIGHT.mail_geo_lat AND LEFT.mail_geo_long=RIGHT.mail_geo_long AND LEFT.mail_msa=RIGHT.mail_msa AND LEFT.mail_geo_blk=RIGHT.mail_geo_blk AND LEFT.mail_geo_match=RIGHT.mail_geo_match AND LEFT.mail_err_stat=RIGHT.mail_err_stat AND LEFT.cln_license_nbr=RIGHT.cln_license_nbr AND LEFT.__internal_fpos__=RIGHT.__internal_fpos__ AND LEFT.vault_date_first_seen=RIGHT.vault_date_first_seen AND LEFT.vault_date_last_seen=RIGHT.vault_date_last_seen,MergeData(LEFT,RIGHT),FULL OUTER,HASH);
  WithRT MergeData1(WithRT le, WithRT ri) := TRANSFORM // old, updated, new
    SELF.vault_date_first_seen := MAP (le.__Tpe = 0 => ri.vault_date_first_seen,ri.__Tpe = 0 => le.vault_date_first_seen,le.vault_date_first_seen<ri.vault_date_first_seen => le.vault_date_first_seen,ri.vault_date_first_seen);
    SELF.__Tpe := MAP (le.__Tpe = 0 => ri.__Tpe,ri.__Tpe = 0 => le.__Tpe,RecordType.Updated);
    SELF := IF( le.__Tpe=0,ri,le);
  END;
 
  // Ingest1: Merge Open Old with Open New to get old, updated, new
  Ingest1 := JOIN( Ingest0(__Tpe=RecordType.Old),Ingest0(__Tpe=RecordType.New),LEFT.vault_uid_hash=RIGHT.vault_uid_hash AND LEFT.s_did=RIGHT.s_did AND LEFT.mari_rid=RIGHT.mari_rid AND LEFT.primary_key=RIGHT.primary_key AND LEFT.create_dte=RIGHT.create_dte AND LEFT.last_upd_dte=RIGHT.last_upd_dte AND LEFT.stamp_dte=RIGHT.stamp_dte
              AND LEFT.date_first_seen=RIGHT.date_first_seen AND LEFT.date_last_seen=RIGHT.date_last_seen AND LEFT.date_vendor_first_reported=RIGHT.date_vendor_first_reported AND LEFT.date_vendor_last_reported=RIGHT.date_vendor_last_reported AND LEFT.process_date=RIGHT.process_date AND LEFT.gen_nbr=RIGHT.gen_nbr AND LEFT.std_prof_cd=RIGHT.std_prof_cd AND LEFT.std_prof_desc=RIGHT.std_prof_desc AND LEFT.std_source_upd=RIGHT.std_source_upd AND LEFT.std_source_desc=RIGHT.std_source_desc
              AND LEFT.type_cd=RIGHT.type_cd AND LEFT.name_org_prefx=RIGHT.name_org_prefx AND LEFT.name_org=RIGHT.name_org AND LEFT.name_org_sufx=RIGHT.name_org_sufx AND LEFT.store_nbr=RIGHT.store_nbr AND LEFT.name_dba_prefx=RIGHT.name_dba_prefx AND LEFT.name_dba=RIGHT.name_dba AND LEFT.name_dba_sufx=RIGHT.name_dba_sufx AND LEFT.store_nbr_dba=RIGHT.store_nbr_dba AND LEFT.dba_flag=RIGHT.dba_flag
              AND LEFT.name_office=RIGHT.name_office AND LEFT.office_parse=RIGHT.office_parse AND LEFT.name_prefx=RIGHT.name_prefx AND LEFT.name_first=RIGHT.name_first AND LEFT.name_mid=RIGHT.name_mid AND LEFT.name_last=RIGHT.name_last AND LEFT.name_sufx=RIGHT.name_sufx AND LEFT.name_nick=RIGHT.name_nick AND LEFT.birth_dte=RIGHT.birth_dte AND LEFT.gender=RIGHT.gender
              AND LEFT.prov_stat=RIGHT.prov_stat AND LEFT.credential=RIGHT.credential AND LEFT.license_nbr=RIGHT.license_nbr AND LEFT.off_license_nbr=RIGHT.off_license_nbr AND LEFT.off_license_nbr_type=RIGHT.off_license_nbr_type AND LEFT.brkr_license_nbr=RIGHT.brkr_license_nbr AND LEFT.brkr_license_nbr_type=RIGHT.brkr_license_nbr_type AND LEFT.license_state=RIGHT.license_state AND LEFT.raw_license_type=RIGHT.raw_license_type AND LEFT.std_license_type=RIGHT.std_license_type
              AND LEFT.std_license_desc=RIGHT.std_license_desc AND LEFT.raw_license_status=RIGHT.raw_license_status AND LEFT.std_license_status=RIGHT.std_license_status AND LEFT.std_status_desc=RIGHT.std_status_desc AND LEFT.curr_issue_dte=RIGHT.curr_issue_dte AND LEFT.orig_issue_dte=RIGHT.orig_issue_dte AND LEFT.expire_dte=RIGHT.expire_dte AND LEFT.renewal_dte=RIGHT.renewal_dte AND LEFT.active_flag=RIGHT.active_flag AND LEFT.ssn_taxid_1=RIGHT.ssn_taxid_1
              AND LEFT.tax_type_1=RIGHT.tax_type_1 AND LEFT.ssn_taxid_2=RIGHT.ssn_taxid_2 AND LEFT.tax_type_2=RIGHT.tax_type_2 AND LEFT.fed_rssd=RIGHT.fed_rssd AND LEFT.addr_bus_ind=RIGHT.addr_bus_ind AND LEFT.name_format=RIGHT.name_format AND LEFT.name_org_orig=RIGHT.name_org_orig AND LEFT.name_dba_orig=RIGHT.name_dba_orig AND LEFT.name_mari_org=RIGHT.name_mari_org AND LEFT.name_mari_dba=RIGHT.name_mari_dba
              AND LEFT.phn_mari_1=RIGHT.phn_mari_1 AND LEFT.phn_mari_fax_1=RIGHT.phn_mari_fax_1 AND LEFT.phn_mari_2=RIGHT.phn_mari_2 AND LEFT.phn_mari_fax_2=RIGHT.phn_mari_fax_2 AND LEFT.addr_id_1=RIGHT.addr_id_1 AND LEFT.addr_addr1_1=RIGHT.addr_addr1_1 AND LEFT.addr_addr2_1=RIGHT.addr_addr2_1 AND LEFT.addr_city_1=RIGHT.addr_city_1 AND LEFT.addr_state_1=RIGHT.addr_state_1 AND LEFT.addr_zip5_1=RIGHT.addr_zip5_1
              AND LEFT.addr_zip4_1=RIGHT.addr_zip4_1 AND LEFT.phn_phone_1=RIGHT.phn_phone_1 AND LEFT.phn_fax_1=RIGHT.phn_fax_1 AND LEFT.addr_cnty_1=RIGHT.addr_cnty_1 AND LEFT.addr_cntry_1=RIGHT.addr_cntry_1 AND LEFT.sud_key_1=RIGHT.sud_key_1 AND LEFT.ooc_ind_1=RIGHT.ooc_ind_1 AND LEFT.result_cd_1=RIGHT.result_cd_1 AND LEFT.addr_carrier_rte_1=RIGHT.addr_carrier_rte_1 AND LEFT.addr_delivery_pt_1=RIGHT.addr_delivery_pt_1
              AND LEFT.addr_mail_ind=RIGHT.addr_mail_ind AND LEFT.addr_id_2=RIGHT.addr_id_2 AND LEFT.addr_addr1_2=RIGHT.addr_addr1_2 AND LEFT.addr_addr2_2=RIGHT.addr_addr2_2 AND LEFT.addr_city_2=RIGHT.addr_city_2 AND LEFT.addr_state_2=RIGHT.addr_state_2 AND LEFT.addr_zip5_2=RIGHT.addr_zip5_2 AND LEFT.addr_zip4_2=RIGHT.addr_zip4_2 AND LEFT.addr_cnty_2=RIGHT.addr_cnty_2 AND LEFT.addr_cntry_2=RIGHT.addr_cntry_2
              AND LEFT.phn_phone_2=RIGHT.phn_phone_2 AND LEFT.phn_fax_2=RIGHT.phn_fax_2 AND LEFT.sud_key_2=RIGHT.sud_key_2 AND LEFT.ooc_ind_2=RIGHT.ooc_ind_2 AND LEFT.result_cd_2=RIGHT.result_cd_2 AND LEFT.addr_carrier_rte_2=RIGHT.addr_carrier_rte_2 AND LEFT.addr_delivery_pt_2=RIGHT.addr_delivery_pt_2 AND LEFT.license_nbr_contact=RIGHT.license_nbr_contact AND LEFT.name_contact_prefx=RIGHT.name_contact_prefx AND LEFT.name_contact_first=RIGHT.name_contact_first
              AND LEFT.name_contact_mid=RIGHT.name_contact_mid AND LEFT.name_contact_last=RIGHT.name_contact_last AND LEFT.name_contact_sufx=RIGHT.name_contact_sufx AND LEFT.name_contact_nick=RIGHT.name_contact_nick AND LEFT.name_contact_ttl=RIGHT.name_contact_ttl AND LEFT.phn_contact=RIGHT.phn_contact AND LEFT.phn_contact_ext=RIGHT.phn_contact_ext AND LEFT.phn_contact_fax=RIGHT.phn_contact_fax AND LEFT.email=RIGHT.email AND LEFT.url=RIGHT.url
              AND LEFT.bk_class=RIGHT.bk_class AND LEFT.bk_class_desc=RIGHT.bk_class_desc AND LEFT.charter=RIGHT.charter AND LEFT.inst_beg_dte=RIGHT.inst_beg_dte AND LEFT.origin_cd=RIGHT.origin_cd AND LEFT.origin_cd_desc=RIGHT.origin_cd_desc AND LEFT.disp_type_cd=RIGHT.disp_type_cd AND LEFT.disp_type_desc=RIGHT.disp_type_desc AND LEFT.reg_agent=RIGHT.reg_agent AND LEFT.regulator=RIGHT.regulator
              AND LEFT.hqtr_city=RIGHT.hqtr_city AND LEFT.hqtr_name=RIGHT.hqtr_name AND LEFT.domestic_off_nbr=RIGHT.domestic_off_nbr AND LEFT.foreign_off_nbr=RIGHT.foreign_off_nbr AND LEFT.hcr_rssd=RIGHT.hcr_rssd AND LEFT.hcr_location=RIGHT.hcr_location AND LEFT.affil_type_cd=RIGHT.affil_type_cd AND LEFT.genlink=RIGHT.genlink AND LEFT.research_ind=RIGHT.research_ind AND LEFT.docket_id=RIGHT.docket_id
              AND LEFT.rec_key=RIGHT.rec_key AND LEFT.mltreckey=RIGHT.mltreckey AND LEFT.old_cmc_slpk=RIGHT.old_cmc_slpk AND LEFT.cmc_slpk=RIGHT.cmc_slpk AND LEFT.pcmc_slpk=RIGHT.pcmc_slpk AND LEFT.affil_key=RIGHT.affil_key AND LEFT.match_id=RIGHT.match_id AND LEFT.provnote_1=RIGHT.provnote_1 AND LEFT.provnote_2=RIGHT.provnote_2 AND LEFT.provnote_3=RIGHT.provnote_3
              AND LEFT.prev_primary_key=RIGHT.prev_primary_key AND LEFT.prev_mltreckey=RIGHT.prev_mltreckey AND LEFT.prev_cmc_slpk=RIGHT.prev_cmc_slpk AND LEFT.prev_pcmc_slpk=RIGHT.prev_pcmc_slpk AND LEFT.persistent_record_id=RIGHT.persistent_record_id AND LEFT.addl_license_spec=RIGHT.addl_license_spec AND LEFT.cont_education_ernd=RIGHT.cont_education_ernd AND LEFT.cont_education_req=RIGHT.cont_education_req AND LEFT.cont_education_term=RIGHT.cont_education_term AND LEFT.agency_id=RIGHT.agency_id
              AND LEFT.site_location=RIGHT.site_location AND LEFT.business_type=RIGHT.business_type AND LEFT.displinary_action=RIGHT.displinary_action AND LEFT.violation_dte=RIGHT.violation_dte AND LEFT.violation_case_nbr=RIGHT.violation_case_nbr AND LEFT.violation_desc=RIGHT.violation_desc AND LEFT.license_id=RIGHT.license_id AND LEFT.nmls_id=RIGHT.nmls_id AND LEFT.foreign_nmls_id=RIGHT.foreign_nmls_id AND LEFT.location_type=RIGHT.location_type
              AND LEFT.name_type=RIGHT.name_type AND LEFT.start_dte=RIGHT.start_dte AND LEFT.agency_status=RIGHT.agency_status AND LEFT.is_authorized_license=RIGHT.is_authorized_license AND LEFT.is_authorized_conduct=RIGHT.is_authorized_conduct AND LEFT.federal_regulator=RIGHT.federal_regulator AND LEFT.dotid=RIGHT.dotid AND LEFT.dotscore=RIGHT.dotscore AND LEFT.dotweight=RIGHT.dotweight AND LEFT.empid=RIGHT.empid
              AND LEFT.empscore=RIGHT.empscore AND LEFT.empweight=RIGHT.empweight AND LEFT.powid=RIGHT.powid AND LEFT.powscore=RIGHT.powscore AND LEFT.powweight=RIGHT.powweight AND LEFT.proxid=RIGHT.proxid AND LEFT.proxscore=RIGHT.proxscore AND LEFT.proxweight=RIGHT.proxweight AND LEFT.seleid=RIGHT.seleid AND LEFT.selescore=RIGHT.selescore
              AND LEFT.seleweight=RIGHT.seleweight AND LEFT.orgid=RIGHT.orgid AND LEFT.orgscore=RIGHT.orgscore AND LEFT.orgweight=RIGHT.orgweight AND LEFT.ultid=RIGHT.ultid AND LEFT.ultscore=RIGHT.ultscore AND LEFT.ultweight=RIGHT.ultweight AND LEFT.did=RIGHT.did AND LEFT.bdid=RIGHT.bdid AND LEFT.title=RIGHT.title
              AND LEFT.fname=RIGHT.fname AND LEFT.mname=RIGHT.mname AND LEFT.lname=RIGHT.lname AND LEFT.name_suffix=RIGHT.name_suffix AND LEFT.name_company=RIGHT.name_company AND LEFT.name_company_dba=RIGHT.name_company_dba AND LEFT.append_busaddrfirst=RIGHT.append_busaddrfirst AND LEFT.append_busaddrlast=RIGHT.append_busaddrlast AND LEFT.append_busrawaid=RIGHT.append_busrawaid AND LEFT.append_busaceaid=RIGHT.append_busaceaid
              AND LEFT.append_mailaddrfirst=RIGHT.append_mailaddrfirst AND LEFT.append_mailaddrlast=RIGHT.append_mailaddrlast AND LEFT.append_mailrawaid=RIGHT.append_mailrawaid AND LEFT.append_mailaceaid=RIGHT.append_mailaceaid AND LEFT.bus_prim_range=RIGHT.bus_prim_range AND LEFT.bus_predir=RIGHT.bus_predir AND LEFT.bus_prim_name=RIGHT.bus_prim_name AND LEFT.bus_addr_suffix=RIGHT.bus_addr_suffix AND LEFT.bus_postdir=RIGHT.bus_postdir AND LEFT.bus_unit_desig=RIGHT.bus_unit_desig
              AND LEFT.bus_sec_range=RIGHT.bus_sec_range AND LEFT.bus_p_city_name=RIGHT.bus_p_city_name AND LEFT.bus_v_city_name=RIGHT.bus_v_city_name AND LEFT.bus_state=RIGHT.bus_state AND LEFT.bus_zip5=RIGHT.bus_zip5 AND LEFT.bus_zip4=RIGHT.bus_zip4 AND LEFT.bus_cart=RIGHT.bus_cart AND LEFT.bus_cr_sort_sz=RIGHT.bus_cr_sort_sz AND LEFT.bus_lot=RIGHT.bus_lot AND LEFT.bus_lot_order=RIGHT.bus_lot_order
              AND LEFT.bus_dpbc=RIGHT.bus_dpbc AND LEFT.bus_chk_digit=RIGHT.bus_chk_digit AND LEFT.bus_rec_type=RIGHT.bus_rec_type AND LEFT.bus_ace_fips_st=RIGHT.bus_ace_fips_st AND LEFT.bus_county=RIGHT.bus_county AND LEFT.bus_geo_lat=RIGHT.bus_geo_lat AND LEFT.bus_geo_long=RIGHT.bus_geo_long AND LEFT.bus_msa=RIGHT.bus_msa AND LEFT.bus_geo_blk=RIGHT.bus_geo_blk AND LEFT.bus_geo_match=RIGHT.bus_geo_match
              AND LEFT.bus_err_stat=RIGHT.bus_err_stat AND LEFT.mail_prim_range=RIGHT.mail_prim_range AND LEFT.mail_predir=RIGHT.mail_predir AND LEFT.mail_prim_name=RIGHT.mail_prim_name AND LEFT.mail_addr_suffix=RIGHT.mail_addr_suffix AND LEFT.mail_postdir=RIGHT.mail_postdir AND LEFT.mail_unit_desig=RIGHT.mail_unit_desig AND LEFT.mail_sec_range=RIGHT.mail_sec_range AND LEFT.mail_p_city_name=RIGHT.mail_p_city_name AND LEFT.mail_v_city_name=RIGHT.mail_v_city_name
              AND LEFT.mail_state=RIGHT.mail_state AND LEFT.mail_zip5=RIGHT.mail_zip5 AND LEFT.mail_zip4=RIGHT.mail_zip4 AND LEFT.mail_cart=RIGHT.mail_cart AND LEFT.mail_cr_sort_sz=RIGHT.mail_cr_sort_sz AND LEFT.mail_lot=RIGHT.mail_lot AND LEFT.mail_lot_order=RIGHT.mail_lot_order AND LEFT.mail_dpbc=RIGHT.mail_dpbc AND LEFT.mail_chk_digit=RIGHT.mail_chk_digit AND LEFT.mail_rec_type=RIGHT.mail_rec_type
              AND LEFT.mail_ace_fips_st=RIGHT.mail_ace_fips_st AND LEFT.mail_county=RIGHT.mail_county AND LEFT.mail_geo_lat=RIGHT.mail_geo_lat AND LEFT.mail_geo_long=RIGHT.mail_geo_long AND LEFT.mail_msa=RIGHT.mail_msa AND LEFT.mail_geo_blk=RIGHT.mail_geo_blk AND LEFT.mail_geo_match=RIGHT.mail_geo_match AND LEFT.mail_err_stat=RIGHT.mail_err_stat AND LEFT.cln_license_nbr=RIGHT.cln_license_nbr AND LEFT.__internal_fpos__=RIGHT.__internal_fpos__ AND LEFT.vault_date_last_seen=0 AND RIGHT.vault_date_last_seen=0,MergeData1(LEFT,RIGHT),FULL OUTER,HASH);
  WithRT CloseRecords(WithRT le, WithRT ri) := TRANSFORM
    SELF.vault_date_last_seen := IF(ri.__Tpe=0,le.vault_date_last_seen,(TYPEOF(ri.vault_date_first_seen))SALT311.Fn_DecrementDate(ri.vault_date_first_seen,'YYYYMMDD'));
    SELF.__Tpe := IF(ri.__Tpe=0,le.__Tpe,RecordType.Updated);
    SELF := le;
  END;
  // Ingest2: Close Open Old to get old, updated
  Ingest2 := JOIN( Ingest1(__Tpe=RecordType.Old),Ingest1(__Tpe=RecordType.New), LEFT.vault_uid_hash=RIGHT.vault_uid_hash AND LEFT.vault_date_last_seen=0,CloseRecords(LEFT,RIGHT),LEFT OUTER,HASH);
  TimeStamp0 := SALT311.Fn_DecrementDate((UNSIGNED6)SALT311.Fn_Now('YYYYMMDD'),'YYYYMMDD') : INDEPENDENT;
  TimeStamp := IF(EndDate<>'',EndDate,TimeStamp0);
  WithRT CloseOldRecords(WithRT le) := TRANSFORM
    SELF.vault_date_last_seen := IF(le.vault_date_last_seen>0,le.vault_date_last_seen,(TYPEOF(le.vault_date_last_seen))TimeStamp);
    SELF.__Tpe := IF(le.vault_date_last_seen>0,le.__Tpe,RecordType.Updated);
    SELF := le;
  END;
  // Ingest3: Close Open Old to get old, updated
  Ingest3 := PROJECT( Ingest2(__Tpe=RecordType.Old),CloseOldRecords(LEFT));
  Ingest2_new := Ingest3 & Ingest2(__Tpe=RecordType.Updated);
  AllRecs0 := IF(CloseOlds,Ingest2_New,Ingest2) & Ingest1(__Tpe=RecordType.New OR __Tpe=RecordType.updated) & Ingest0(__Tpe=RecordType.Unchanged);
  //Now need to update 'rid' numbers on new records
  //Base upon SALT311.utMac_Sequence_Records
  // Do not use PROJECT,COUNTER because it is very slow if any of the fields are not fixed length
  NR := AllRecs0(__Tpe=RecordType.New);
  ORe := AllRecs0(__Tpe<>RecordType.New);
  PrevBase := MAX(ORe,vault_rid);
  WithRT AddNewRid(WithRT le, WithRT ri) := TRANSFORM
    SELF.vault_rid := IF ( le.vault_rid=0, PrevBase+1+thorlib.node(), le.vault_rid+thorlib.nodes() );
    SELF := ri;
  END;
  NR1 := ITERATE(NR(vault_rid=0),AddNewRid(LEFT,RIGHT),LOCAL);
  SHARED AllRecs := ORe+NR1+NR(vault_rid<>0) : PERSIST('~temp::I_proflic_mari_fcra_did::Ingest_Cache',EXPIRE(I_proflic_mari_fcra_did.Config.PersistExpire));
  EXPORT UpdateStats := SORT(TABLE(AllRecs, {__Tpe,SALT311.StrType INGESTSTATUS:=RTToText(AllRecs.__Tpe),UNSIGNED Cnt:=COUNT(GROUP)}, __Tpe, FEW),__Tpe, FEW);
  SHARED S0 := OUTPUT(UpdateStats, {{UpdateStats} AND NOT __Tpe}, ALL, NAMED('UpdateStats'));
 
  SHARED NoFlagsRec := WithRT;
  SHARED emptyDS := DATASET([], NoFlagsRec);
  EXPORT NewRecords := PROJECT(AllRecs(__Tpe=RecordType.New), NoFlagsRec);
  EXPORT NewRecords_NoTag := PROJECT(NewRecords,Layout_Vault);
  EXPORT OldRecords :=PROJECT( AllRecs(__Tpe=RecordType.Old), NoFlagsRec);
  EXPORT OldRecords_NoTag := PROJECT(OldRecords,Layout_Vault);
  EXPORT UpdatedRecords := PROJECT(AllRecs(__Tpe=RecordType.Updated), NoFlagsRec);
  EXPORT UpdatedRecords_NoTag := PROJECT(UpdatedRecords,Layout_Vault);
  EXPORT AllRecords := PROJECT(AllRecs, NoFlagsRec);
  EXPORT AllRecords_NoTag := PROJECT(AllRecords,Layout_Vault); // Records in 'pure' format
 
f := TABLE(dsBase,{vault_rid}) : GLOBAL;
rcid_clusters := SALT311.MOD_ClusterStats.Counts(f,vault_rid);
DuplicateRids0 := COUNT(dsBase) - SUM(rcid_clusters,NumberOfClusters); // Should be zero
d := DATASET([{DuplicateRids0}],{UNSIGNED2 DuplicateRids0});
EXPORT ValidityStats := OUTPUT(d,NAMED('ValidityStatistics'));
  EXPORT DoStats := S0;
 
  EXPORT StandardStats(BOOLEAN doInfileOverallCnt = TRUE, BOOLEAN doStatusOverallCnt = TRUE) := FUNCTION
    myTimeStamp := (UNSIGNED6)SALT311.Fn_Now('YYYYMMDDHHMMSS') : INDEPENDENT;
    infileCntOverall := IF(doInfileOverallCnt, SALT311.mod_StandardStatsTransforms.MAC_ingestInfileOverallCount(COUNT(FilesToIngest), 'Infile', myTimeStamp));
    basefileCntOverall := IF(doInfileOverallCnt, SALT311.mod_StandardStatsTransforms.MAC_ingestInfileOverallCount(COUNT(dsBase), 'Basefile', myTimeStamp));
    ingestStatusOverall := IF(doStatusOverallCnt, SALT311.mod_StandardStatsTransforms.MAC_ingestStatus(UpdateStats,, myTimeStamp));
    standardStats := infileCntOverall & basefileCntOverall & ingestStatusOverall;
    RETURN standardStats;
  END;
END;
