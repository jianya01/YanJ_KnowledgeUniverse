#workunit('name', 'BWR_ProcessAutomation-  I_rules_transaction_log_report_code');
   
   IMPORT STD,I_rules_transaction_log_report_code, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_rules_transaction_log_report_code, //module name
   														  'Vault Ingest - Rules Framework nonFCRA transaction_log_report_code');	
														  
										
										
														  
														  