﻿ EXPORT Source :=  project(Constants.Sourcefile, transform(Layout_Vault, 
																																SELF.vault_date_first_seen := (UNSIGNED4)WORKUNIT[2..9];
																																SELF.vault_date_last_seen := 	0;
																																SELF.vault_rid := 	0;
																																SELF.vault_UID_Hash := HASH64(LEFT.batch_job_id,LEFT.batch_seq_number,LEFT.transaction_type,left.date_added);
																																SELF := LEFT;
																																SELF:=[];
																																));
																																