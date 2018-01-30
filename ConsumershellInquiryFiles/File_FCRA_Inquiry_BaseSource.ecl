EXPORT File_FCRA_Inquiry_BaseSource := distribute((fnAddSource(ConsumershellInquiryfiles.File_FCRA_riskwise_acclogs_common, 'RISKWISE') +
													fnAddSource(PROJECT(ConsumershellInquiryfiles.File_FCRA_batch_acclogs_Common, TRANSFORM(RECORDOF(LEFT), SELF.search_info.transaction_id := TRIM(LEFT.search_info.transaction_id) + TRIM(LEFT.search_info.sequence_number); SELF := LEFT)), 'BATCH') + 
													fnAddSource(PROJECT(ConsumershellInquiryfiles.File_FCRA_prodr3_acclogs_Common, TRANSFORM(RECORDOF(LEFT), SELF.search_info.transaction_id := TRIM(LEFT.search_info.transaction_id) + TRIM(LEFT.search_info.sequence_number); SELF := LEFT)), 'PROD R3') + 
													fnAddSource(ConsumershellInquiryfiles.File_FCRA_banko_acclogs_Common, 'BANKO')),
													hash(source, search_info.transaction_id,search_info.login_history_id,search_info.datetime,search_info.sequence_number,search_info.function_description));		//BankoBatch file was not brought into the Vault because it contained 0 records on the Logs THOR
													
 