
 EXPORT Source :=  project(I_Criminal_Offender.Constants.Sourcefile, transform(I_Criminal_Offender.Layout_Vault, 
   																																								SELF.vault_date_first_seen := (UNSIGNED4)WORKUNIT[2..9];
   																																								SELF.vault_date_last_seen := 	0;
   																																								SELF.vault_rid := 	0;
																																									SELF.vault_UID_Hash := HASHMD5(left.process_date,left.file_date,left.offender_key,left.vendor,left.source_file,left.record_type,left.orig_state,left.id_num,left.pty_nm,
left.pty_nm_fmt,left.orig_lname,left.orig_fname,left.orig_mname,left.orig_name_suffix,left.lname,left.fname,left.mname,left.name_suffix,
left.pty_typ,left.nid,left.ntype,left.nindicator,left.nitro_flag,left.ssn,left.case_num,left.case_court,left.case_date,left.case_type,
left.case_type_desc,left.county_of_origin,left.dle_num,left.fbi_num,left.doc_num,left.ins_num,left.dl_num,left.dl_state,left.citizenship,
left.dob,left.dob_alias,left.county_of_birth,left.place_of_birth,left.street_address_1,left.street_address_2,left.street_address_3,
left.street_address_4,left.street_address_5,left.current_residence_county,left.legal_residence_county,left.race,left.race_desc,left.sex,
left.hair_color,left.hair_color_desc,left.eye_color,left.eye_color_desc,left.skin_color,left.skin_color_desc,left.scars_marks_tattoos_1,
left.scars_marks_tattoos_2,left.scars_marks_tattoos_3,left.scars_marks_tattoos_4,left.scars_marks_tattoos_5,left.height,left.weight,
left.party_status,left.party_status_desc,left._3g_offender,left.violent_offender,left.sex_offender,left.vop_offender,left.data_type,
left.record_setup_date,left.datasource,left.prim_range,left.predir,left.prim_name,left.addr_suffix,left.postdir,left.unit_desig,
left.sec_range,left.p_city_name,left.v_city_name,left.st,left.zip5,left.zip4,left.cart,left.cr_sort_sz,left.lot,left.lot_order,left.dpbc,
left.chk_digit,left.rec_type,left.ace_fips_st,left.ace_fips_county,left.geo_lat,left.geo_long,left.msa,left.geo_blk,left.geo_match,
left.err_stat,left.clean_errors,left.county_name,left.did,left.score,left.ssn_appended,left.curr_incar_flag,left.curr_parole_flag,
left.curr_probation_flag,left.src_upload_date,left.age,left.image_link,left.fcra_conviction_flag,left.fcra_traffic_flag,left.fcra_date,
left.fcra_date_type,left.conviction_override_date,left.conviction_override_date_type,left.offense_score,left.offender_persistent_id
);
   																																								SELF := LEFT;
   																																								SELF:=[];
   																																								));
																																									
