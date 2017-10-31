 EXPORT Source :=  project(Constants.Sourcefile, transform(Layout_Vault, 
																																SELF.vault_date_first_seen := (UNSIGNED4)WORKUNIT[2..9];
																																// SELF.vault_date_first_seen := 20171010;
																																SELF.vault_date_last_seen := 	0;
																																SELF.vault_rid := 	0;
																																SELF.vault_UID_Hash := HASHMD5(left.transaction_id,left.product_id,left.date_added,left.process_type,left.processing_time,left.vendor_code,left.request_type,left.product_version,left.reference_number,left.content_data,left.process_status
);
																																SELF := LEFT;
																																SELF:=[];
																																));
																																