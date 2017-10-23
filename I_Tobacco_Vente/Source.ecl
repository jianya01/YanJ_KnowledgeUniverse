EXPORT Source := project(I_Tobacco_Vente.Constants.Sourcefile, transform(I_Tobacco_Vente.Layout_Vault, 
   																																								SELF.vault_date_first_seen := (UNSIGNED4)WORKUNIT[2..9];
																																									// SELF.vault_date_first_seen := 20170829;
   																																								SELF.vault_date_last_seen := 	0;
   																																								SELF.vault_rid := 	0;
																																									SELF.vault_UID_Hash := HASHMD5(left.lexid,left.receive_date,left.member_id,left.fname,left.lname,left.street,left.city_address,left.state,left.zip_code,left.zip_code4,left.dob,left.last_reg_date,left.isasmoker,left.sourcerid,left.name_id,left.clean_fname,left.clean_lname,left.clean_sname,left.address_id,left.prim_range,left.predir,left.prim_name,left.addr_suffix,left.postdir,left.unit_desig,left.sec_range,left.city,left.st,left.zip,left.zip4,left.cart,left.cr_sort_sz,left.lot,left.lot_order,left.dbpc,left.chk_digit,left.rec_type,left.fips_state,left.fips_county,left.geo_lat,left.geo_long,left.msa,left.geo_blk,left.geo_match,left.error_code
);
   																																								SELF := LEFT;
   																																								SELF:=[];
   																																								));
																																									