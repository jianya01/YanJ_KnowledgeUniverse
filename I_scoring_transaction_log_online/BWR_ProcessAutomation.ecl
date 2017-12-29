#workunit('name', 'BWR_ProcessAutomation-  I_scoring_transaction_log_online');
   
   IMPORT STD,I_scoring_transaction_log_online, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_scoring_transaction_log_online, //module name
   														  'Vault Ingest - Scoring Transaction log online');	
														  
										
										
														  
														  