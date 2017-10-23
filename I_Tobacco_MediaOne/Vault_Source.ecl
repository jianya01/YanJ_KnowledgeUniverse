EXPORT Vault_Source := project(I_Tobacco_MediaOne.Constants.Sourcefile, transform(I_Tobacco_MediaOne.Layout_Vault, 
   																																								SELF.vault_date_first_seen := (UNSIGNED4)WORKUNIT[2..9];
																																									// SELF.vault_date_first_seen := 20170929;
   																																								SELF.vault_date_last_seen := 	0;
   																																								SELF.vault_rid := 	0;
																																									SELF.vault_UID_Hash := HASHMD5(left.lexid,left.receive_date,left.recordid,left.email,left.first_name,left.last_name,left.suffix,left.delivery_address,left.delivery_address2,left.city_address,left.state,left.zip_code,left.plus4,left.phone,left.cell_phone,left.dob,left.gender,left.use,left.cigbrand,left.ciglength,left.purchasecigs,left.usual_brand,left.amtbrandpurchase,left.brandunavailable,left.second_brand,left.smokeless_brand,left.smokeless_style,left.smokeless_flavor,left.cigar_brand,left.ip,left.cigtype,left.source,left.estimated_income,left.net_worth,left.ownership_rent,left.clean_fname,left.clean_lname,left.clean_sname,left.address_id,left.prim_range,left.predir,left.prim_name,left.addr_suffix,left.postdir,left.unit_desig,left.sec_range,left.city,left.st,left.zip,left.zip4,left.cart,left.cr_sort_sz,left.lot,left.lot_order,left.dbpc,left.chk_digit,left.rec_type,left.fips_state,left.fips_county,left.geo_lat,left.geo_long,left.msa,left.geo_blk,left.geo_match,left.error_code
);
   																																								SELF := LEFT;
   																																								SELF:=[];
   																																								));
																																									