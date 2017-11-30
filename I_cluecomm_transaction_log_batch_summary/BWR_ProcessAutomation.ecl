#workunit('name', 'BWR_ProcessAutomation-  I_cluecomm_transaction_log_batch_summary');
   
   IMPORT STD,I_cluecomm_transaction_log_batch_summary, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_cluecomm_transaction_log_batch_summary, //module name
   														  'Vault Ingest - CLUE Commercial Transaction log batch summary');	
														  
														  
														  
														  
														  
										
										
														  
														  