 EXPORT Source :=  project(Constants.Sourcefile, transform(Layout_Vault, 
																																SELF.vault_date_first_seen := (UNSIGNED4)WORKUNIT[2..9];
																																SELF.vault_date_last_seen := 	0;
																																SELF.vault_rid := 	0;
																																SELF.vault_UID_Hash := HASHMD5(LEFT.transaction_id,LEFT.product_id,LEFT.reference_number,LEFT.date_added,LEFT.process_type,LEFT.processing_time,LEFT.source_code,LEFT.content_type,LEFT.Content_data);
																																SELF := LEFT;
																																SELF:=[];
																																));
																																
																																
																																
																																