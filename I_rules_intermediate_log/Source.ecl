 EXPORT Source :=  project(Constants.Sourcefile, transform(Layout_Vault, 
																																SELF.vault_date_first_seen := (UNSIGNED4)WORKUNIT[2..9];
																																SELF.vault_date_last_seen := 	0;
																																SELF.vault_rid := 	0;
																																SELF.vault_UID_Hash := HASHMD5(LEFT.transaction_id, LEFT.product_id,LEFT.date_added,LEFT.process_type,LEFT.processing_time,LEFT.source_code,LEFT.content_type, LEFT.version,LEFT.reference_number,left.content_data,LEFT.processing_status);
																																SELF := LEFT;
																																SELF:=[];
																																));
																																
																																
																																