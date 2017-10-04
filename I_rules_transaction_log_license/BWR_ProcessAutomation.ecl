#workunit('name', 'BWR_ProcessAutomation-  I_rules_transaction_log_license');
   
   IMPORT STD,I_rules_transaction_log_license, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_rules_transaction_log_license, //module name
   														  'Vault Ingest - Rules Framework nonFCRA transaction_log_license');	
														  
										
										
														  
														  