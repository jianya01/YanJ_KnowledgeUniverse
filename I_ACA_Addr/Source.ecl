
 EXPORT Source :=  project(I_ACA_Addr.constants.Sourcefile, transform(I_ACA_Addr.Layout_Vault, 
   																																								SELF.vault_date_first_seen := 20170801;
   																																								SELF.vault_date_last_seen := 	0;
   																																								SELF.vault_rid := 	0;
																																									SELF.vault_UID_Hash := HASHMD5(left.zip,left.prim_range,left.prim_name,left.sec_range,left.inst_type,left.institution,left.mail_addr,left.mail_city,left.mail_state,left.mail_zip,left.addr1,left.city,left.state,left.notes,left.name,left.title,left.fname,left.mname,left.lname,left.name_suffix,left.addr2,left.predir,left.addr_suffix,left.postdir,left.unit_desig,left.p_city_name,left.v_city_name,left.st,left.z5,left.zip4,left.phone,left.inst_type_exp,left.addr_type,left.__internal_fpos__
);
   																																								SELF := LEFT;
   																																								SELF:=[];
   																																								));
																																									
