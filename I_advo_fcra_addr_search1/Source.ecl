 EXPORT Source :=  project(Constants.Sourcefile, transform(Layout_Vault, 
																																SELF.vault_date_first_seen := (UNSIGNED4)WORKUNIT[2..9];
																																SELF.vault_date_last_seen := 	0;
																																SELF.vault_rid := 	0;
																																SELF.vault_UID_Hash := HASHMD5(LEFT.zip_5, LEFT.prim_range, LEFT.prim_name, LEFT.sec_range,LEFT.advo_key,LEFT.route_num);
																																SELF := LEFT;
																																SELF:=[];
																																));
																																
																																