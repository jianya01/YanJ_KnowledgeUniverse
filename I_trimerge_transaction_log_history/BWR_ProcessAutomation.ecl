#workunit('name', 'BWR_ProcessAutomation-  I_trimerge_transaction_log_history');
   
   IMPORT STD,I_trimerge_transaction_log_history, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_trimerge_transaction_log_history, //module name
   														  'Vault Ingest - Government Credit trimerge Transaction log history');	
														  
										
										
														  
														  