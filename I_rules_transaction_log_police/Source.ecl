 EXPORT Source :=  project(Constants.Sourcefile, transform(Layout_Vault, 
																																SELF.vault_date_first_seen := (UNSIGNED4)WORKUNIT[2..9];
																																SELF.vault_date_last_seen := 	0;
																																SELF.vault_rid := 	0;
																																SELF.vault_UID_Hash := HASHMD5(LEFT.transaction_id,LEFT.agency_type,LEFT.order_id,LEFT.claim_number,LEFT.claim_state,LEFT.date_loss,LEFT.report_type,LEFT.policy_number,LEFT.return_options,LEFT.order_type,LEFT.initial_status,LEFT.date_returned,LEFT.data_elements,LEFT.return,LEFT.report_available,LEFT.date_added,LEFT.agency_name);
																																SELF := LEFT;
																																SELF:=[];
																																));
																																
																																
																																