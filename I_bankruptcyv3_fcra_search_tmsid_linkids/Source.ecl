 EXPORT Source :=  project(Constants.Sourcefile, transform(Layout_Vault, 
																																SELF.vault_date_first_seen := (UNSIGNED4)WORKUNIT[2..9];
																																SELF.vault_date_last_seen := 	0;
																																SELF.vault_rid := 	0;
																																SELF.vault_UID_Hash := HASHMD5(LEFT.tmsid,LEFT.orig_addr1,LEFT.orig_name,LEFT.orig_company,LEFT.debtor_type,LEFT.debtor_seq,LEFT.orig_county,LEFT.name_type,LEFT.seq_number);
																																SELF := LEFT;
																																SELF:=[];
																																));
																																