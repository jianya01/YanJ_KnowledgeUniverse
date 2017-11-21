 EXPORT Source :=  project(Constants.Sourcefile, transform(Layout_Vault, 
																													 SELF.vault_date_first_seen := (UNSIGNED4)WORKUNIT[2..9];
																													 SELF.vault_date_last_seen := 	0;
																													 SELF.vault_rid := 	0;
																													 SELF.vault_UID_Hash := HASHMD5(LEFT.transaction_id,LEFT.date_added,LEFT.inq_last_name,
																																													LEFT.inq_first_name,LEFT.inq_middle_name,LEFT.inq_suffix,
																																													LEFT.inq_license_num,LEFT.inq_license_state,LEFT.inq_dob,
																																													LEFT.inq_gender,LEFT.inq_ssn,LEFT.inq_idl);
																													 SELF := LEFT;
																													 SELF:=[];
																													 ));
																																