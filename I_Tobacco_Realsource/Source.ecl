EXPORT Source := project(I_Tobacco_Realsource.Constants.Sourcefile, transform(I_Tobacco_Realsource.Layout_Vault, 
   																																								SELF.vault_date_first_seen := (UNSIGNED4)WORKUNIT[2..9];
																																									// SELF.vault_date_first_seen := 20170829;
   																																								SELF.vault_date_last_seen := 	0;
   																																								SELF.vault_rid := 	0;
																																									SELF.vault_UID_Hash := HASHMD5(left.lexid,left.receive_date,left.uid,left.prefix_code,left.first_name,left.middle_initial,left.last_name,left.suffix_code,left.company_secondary_name,left.address_1,left.address_2,left.city_address,left.state,left.zip_code,left.zip_code4,left.phone_number,left.dob,left.id,left.areyouasmoker,left.legalsmokerage,left.certifyme,left.month,left.day,left.year,left.gender,left.optinemail,left.use,left.sgbrand,left.ciglength,left.cigtype,left.purchaseage,left.usualbrand,left.amtbrandpurchase,left.brandunavailable,left.secondbrand,left.smokelessbrand,left.smokelesstype,left.smokelessflavor,left.cigarbrand,left.dt,left.ip,left.pkid,left.fed,left.agecaptureid,left.sourcerid,left.name_id,left.clean_title,left.clean_fname,left.clean_mname,left.clean_lname,left.clean_sname,left.address_id,left.prim_range,left.predir,left.prim_name,left.addr_suffix,left.postdir,left.unit_desig,left.sec_range,left.city,left.st,left.zip,left.zip4,left.cart,left.cr_sort_sz,left.lot,left.lot_order,left.dbpc,left.chk_digit,left.rec_type,left.fips_state,left.fips_county,left.geo_lat,left.geo_long,left.msa,left.geo_blk,left.geo_match,left.error_code
);
   																																								SELF := LEFT;
   																																								SELF:=[];
   																																								));
																																									