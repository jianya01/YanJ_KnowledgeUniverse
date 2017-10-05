#workunit('name', 'BWR_ProcessAutomation-  I_rules_transaction_log_detail');
   
   IMPORT STD,I_rules_transaction_log_detail, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_rules_transaction_log_detail, //module name
   														  'Vault Ingest - Rules Framework nonFCRA transaction_log_detail');	
														  
										
										
														  
														  