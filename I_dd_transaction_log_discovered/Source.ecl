 EXPORT Source :=  project(Constants.Sourcefile, transform(Layout_Vault, 
																													 SELF.vault_date_first_seen := (UNSIGNED4)WORKUNIT[2..9];
																													 SELF.vault_date_last_seen := 	0;
																													 SELF.vault_rid := 	0;
																													 SELF.vault_UID_Hash := HASHMD5(LEFT.transaction_id,LEFT.date_added,LEFT.account_number,
																																													LEFT.dd_lexid,LEFT.dd_inqstate,LEFT.dd_datelastreported,LEFT.product_id,
																																													LEFT.dd_last_name,LEFT.dd_first_name,LEFT.dd_dob,LEFT.dd_dln,
																																													LEFT.dd_dln_state,LEFT.dd_ssn);
																													 SELF := LEFT;
																													 SELF:=[];
																													 ));
																																