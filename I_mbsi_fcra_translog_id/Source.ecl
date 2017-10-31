 EXPORT Source :=  project(Constants.Sourcefile, transform(Layout_Vault, 
																																SELF.vault_date_first_seen := (UNSIGNED4)WORKUNIT[2..9];
																																// SELF.vault_date_first_seen := 20171010;
																																SELF.vault_date_last_seen := 	0;
																																SELF.vault_rid := 	0;
																																SELF.vault_UID_Hash := HASHMD5(left.transaction_id,left.product_id,left.date_added,left.login_id,left.billing_code,left.function_name,left.report_code,left.account_base,left.account_suffix,left.account_id,left.customer_number,left.customer_reference_code,left.i_date_ordered,left.i_person_ssn,left.i_person_name_prefix,left.i_person_last_name,left.i_person_first_name,left.i_person_middle_name,left.i_person_name_suffix,left.i_person_dob,left.count_person_in,left.i_dl1_number,left.i_dl1_state,left.i_dl1_type,left.count_dl_in,left.i_addr_line,left.i_addr_street_type,left.i_addr_state,left.i_addr_zip,left.i_addr_city,left.i_addr_county,left.i_addr_country,left.i_addr_type,left.count_addr_in,left.i_vehicle_vin,left.i_vehicle_year,left.i_vehicle_make,left.i_vehicle_model,left.i_vehicle_plate_data,left.i_vehicle_state,left.count_vehicle_in,left.i_unique_id,left.i_unique_id_type,left.record_version,left.reference_number,left.processing_status,left.billing_type_id,left.price,left.currency,left.pricing_error_code,left.free,left.record_count_1,left.record_count_1_type,left.record_count_2,left.record_count_2_type,left.result_format,left.report_options,left.transaction_code,left.return_node_id,left.request_node_id,left.order_status_code,left.product_line,left.login_history_id,left.ip_address,left.response_time,left.esp_method,left.batch_job_id,left.batch_seq_number,left.user_added,left.user_changed,left.date_changed
);
																																SELF := LEFT;
																																SELF:=[];
																																));
																																