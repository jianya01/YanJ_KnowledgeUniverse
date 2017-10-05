#workunit('name', 'BWR_ProcessAutomation-  I_rules_transaction_log_business');
   
   IMPORT STD,I_rules_transaction_log_business, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_rules_transaction_log_business, //module name
   														  'Vault Ingest - Rules Framework nonFCRA transaction_log_business');	
														  
										
										
														  
														  