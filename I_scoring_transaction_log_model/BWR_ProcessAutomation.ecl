#workunit('name', 'BWR_ProcessAutomation-  I_scoring_transaction_log_model');
   
   IMPORT STD,I_scoring_transaction_log_model, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_scoring_transaction_log_model, //module name
   														  'Vault Ingest - Scoring Transaction log model');	
														  
										
										
														  
														  