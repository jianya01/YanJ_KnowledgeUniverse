#workunit('name', 'BWR_ProcessAutomation-  I_rules_transaction_log_online');
   
   IMPORT STD,I_rules_transaction_log_online, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_rules_transaction_log_online, //module name
   														  'Vault Ingest - Rules Framework nonFCRA transaction_log_online');	
														  
										
										
														  
														  