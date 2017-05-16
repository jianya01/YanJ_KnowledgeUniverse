EXPORT File_FCRA_Inquiry_BaseSource := distribute((fnAddSource(inquiry_acclogs.File_FCRA_Riskwise_Logs_Common, 'RISKWISE') +
													fnAddSource(PROJECT(Inquiry_AccLogs.File_FCRA_Batch_Logs_Common, TRANSFORM(RECORDOF(LEFT), SELF.search_info.transaction_id := TRIM(LEFT.search_info.transaction_id) + TRIM(LEFT.search_info.sequence_number); SELF := LEFT)), 'BATCH') + 
													fnAddSource(PROJECT(Inquiry_AccLogs.File_FCRA_ProdR3_Logs_Common, TRANSFORM(RECORDOF(LEFT), SELF.search_info.transaction_id := TRIM(LEFT.search_info.transaction_id) + TRIM(LEFT.search_info.sequence_number); SELF := LEFT)), 'PROD R3') + 
													fnAddSource(Inquiry_AccLogs.File_FCRA_Banko_Logs_Common, 'BANKO')),
													hash(source, search_info.transaction_id,search_info.login_history_id,search_info.datetime,search_info.sequence_number,search_info.function_description));		//BankoBatch file was not brought into the Vault because it contained 0 records on the Logs THOR
													
// EXPORT output(File_FCRA_Inquiry_BaseSource,,'test',thor);