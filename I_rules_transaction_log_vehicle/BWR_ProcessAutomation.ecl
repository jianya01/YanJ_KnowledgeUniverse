#workunit('name', 'BWR_ProcessAutomation-  I_rules_transaction_log_vehicle');
   
   IMPORT STD,I_rules_transaction_log_vehicle, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_rules_transaction_log_vehicle, //module name
   														  'Vault Ingest - Rules Framework nonFCRA transaction_log_vehicle');	
														  
										
										
														  
														  