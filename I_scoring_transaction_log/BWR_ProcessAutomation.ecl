#workunit('name', 'BWR_ProcessAutomation-  I_scoring_transaction_log');
   
   IMPORT STD,I_scoring_transaction_log, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_scoring_transaction_log, //module name
   														  'Vault Ingest - Scoring Transaction log');	
														  
										
										
														  
														  