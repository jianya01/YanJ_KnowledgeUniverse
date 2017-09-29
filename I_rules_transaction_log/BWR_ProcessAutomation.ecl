#workunit('name', 'BWR_ProcessAutomation-  I_rules_transaction_log');
   
   IMPORT STD,I_rules_transaction_log, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_rules_transaction_log, //module name
   														  'Vault Ingest - Rules Framework nonFCRA Transaction log');	
														  
										
										
														  
														  