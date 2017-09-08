
 EXPORT Source :=  project(I_Addr_Search.constants.Sourcefile, transform(I_Addr_Search.Layout_Vault, 
   																																								SELF.vault_date_first_seen := (UNSIGNED4)WORKUNIT[2..9];
   																																								SELF.vault_date_last_seen := 	0;
   																																								SELF.vault_rid := 	0;
																																									SELF.vault_UID_Hash := HASHMD5(left.zip,left.prim_range,left.prim_name,left.addr_suffix,left.predir,left.postdir,left.sec_range,left.zip_5,left.route_num,left.zip_4,left.walk_sequence,left.street_num,left.street_pre_directional,left.street_name,left.street_post_directional,left.street_suffix,left.secondary_unit_designator,left.secondary_unit_number,left.address_vacancy_indicator,left.throw_back_indicator,left.seasonal_delivery_indicator,left.seasonal_start_suppression_date,left.seasonal_end_suppression_date,left.dnd_indicator,left.college_indicator,left.college_start_suppression_date,left.college_end_suppression_date,left.address_style_flag,left.simplify_address_count,left.drop_indicator,left.residential_or_business_ind,left.dpbc_digit,left.dpbc_check_digit,left.update_date,left.file_release_date,left.override_file_release_date,left.county_num,left.county_name,left.city_name,left.state_code,left.state_num,left.congressional_district_number,left.owgm_indicator,left.record_type_code,left.advo_key,left.address_type,left.mixed_address_usage,left.date_first_seen,left.date_last_seen,left.date_vendor_first_reported,left.date_vendor_last_reported,left.vac_begdt,left.vac_enddt,left.months_vac_curr,left.months_vac_max,left.vac_count,left.unit_desig,left.p_city_name,left.v_city_name,left.st,left.zip4,left.cart,left.cr_sort_sz,left.lot,left.lot_order,left.dbpc,left.chk_digit,left.rec_type,left.fips_county,left.county,left.geo_lat,left.geo_long,left.msa,left.geo_blk,left.geo_match,left.err_stat,left.src,left.__internal_fpos__);

   																																								SELF := LEFT;
   																																								SELF:=[];
   																																								));
																																									
