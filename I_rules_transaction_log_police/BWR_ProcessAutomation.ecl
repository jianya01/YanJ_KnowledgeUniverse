#workunit('name', 'BWR_ProcessAutomation-  I_rules_transaction_log_police');
   
   IMPORT STD,I_rules_transaction_log_police, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_rules_transaction_log_police, //module name
   														  'Vault Ingest - Rules Framework nonFCRA transaction_log_police');	
														  
										
										
														  
														  