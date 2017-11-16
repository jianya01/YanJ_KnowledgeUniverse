#workunit('name', 'BWR_ProcessAutomation-  I_cluecomm_transaction_log_quoteback');
   
   IMPORT STD,I_cluecomm_transaction_log_quoteback, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_cluecomm_transaction_log_quoteback, //module name
   														  'Vault Ingest - CLUE Commercial Transaction log quoteback');	
														  
										
										
														  
														  