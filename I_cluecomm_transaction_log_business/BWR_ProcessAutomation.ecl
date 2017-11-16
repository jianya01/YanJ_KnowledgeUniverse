#workunit('name', 'BWR_ProcessAutomation-  I_cluecomm_transaction_log_business');
   
   IMPORT STD,I_cluecomm_transaction_log_business, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_cluecomm_transaction_log_business, //module name
   														  'Vault Ingest - CLUE Commercial Transaction log business');	
														  
										
										
														  
														  