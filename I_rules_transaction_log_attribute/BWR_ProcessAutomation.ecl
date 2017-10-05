#workunit('name', 'BWR_ProcessAutomation-  I_rules_transaction_log_attribute');
   
   IMPORT STD,I_rules_transaction_log_attribute, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_rules_transaction_log_attribute, //module name
   														  'Vault Ingest - Rules Framework nonFCRA transaction_log_attribute');	
														  
										
										
														  
														  