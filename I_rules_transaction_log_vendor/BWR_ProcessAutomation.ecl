#workunit('name', 'BWR_ProcessAutomation-  I_rules_transaction_log_vendor');
   
   IMPORT STD,I_rules_transaction_log_vendor, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_rules_transaction_log_vendor, //module name
   														  'Vault Ingest - Rules Framework nonFCRA transaction_log_vendor');	
														  
										
										
														  
														  