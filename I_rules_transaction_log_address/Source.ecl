﻿ EXPORT Source :=  project(Constants.Sourcefile, transform(Layout_Vault, 
																																SELF.vault_date_first_seen := (UNSIGNED4)WORKUNIT[2..9];
																																SELF.vault_date_last_seen := 	0;
																																SELF.vault_rid := 	0;
																																SELF.vault_UID_Hash := HASHMD5(LEFT.transaction_id,LEFT.person_seq,LEFT.business_seq,LEFT.address_seq,LEFT.date_added);
																																SELF := LEFT;
																																SELF:=[];
																																));
																																