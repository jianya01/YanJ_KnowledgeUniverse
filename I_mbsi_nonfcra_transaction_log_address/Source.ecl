 EXPORT Source :=  project(Constants.Sourcefile, transform(Layout_Vault, 
																																SELF.vault_date_first_seen := (UNSIGNED4)WORKUNIT[2..9];
																																SELF.vault_date_last_seen := 	0;
																																SELF.vault_rid := 	0;
																																SELF.vault_UID_Hash := HASHMD5(LEFT.TRANSACTION_ID,LEFT.PERSON_SEQ,
																																															 LEFT.BUSINESS_SEQ,LEFT.ADDRESS_SEQ,
																																															 LEFT.DATE_ADDED);
																																SELF := LEFT;
																																SELF:=[];
																																));
																																