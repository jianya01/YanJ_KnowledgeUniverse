﻿ EXPORT Source :=  project(Constants.Sourcefile, transform(Layout_Vault, 
																																SELF.vault_date_first_seen := (UNSIGNED4)WORKUNIT[2..9];
																																// SELF.vault_date_first_seen := 20171001;
																																SELF.vault_date_last_seen := 	0;
																																SELF.vault_rid := 	0;
																																SELF.vault_UID_Hash := HASHMD5(LEFT.transaction_id,LEFT.model_sequence,LEFT.attribute_sequence,LEFT.date_added);
																																SELF := LEFT;
																																SELF:=[];
																																));
