 EXPORT Source :=  project(Constants.Sourcefile, transform(Layout_Vault, 
																																SELF.vault_date_first_seen := (UNSIGNED4)WORKUNIT[2..9];
																																SELF.vault_date_last_seen := 	0;
																																SELF.vault_rid := 	0;
																																SELF.vault_UID_Hash := HASHMD5(LEFT.transaction_id,LEFT.product_id,LEFT.date_added,LEFT.process_type,LEFT.processing_time,LEFT.vendor_code,LEFT.request_type,LEFT.product_version,LEFT.reference_number,LEFT.content_data,LEFT.date_processed);
																																SELF := LEFT;
																																SELF:=[];
																																));
																																
																																