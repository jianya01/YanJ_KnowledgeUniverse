#workunit('name', 'BWR_ProcessAutomation-  I_trimerge_transaction_log');
   
   IMPORT STD,I_trimerge_transaction_log, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_trimerge_transaction_log, //module name
   														  'Vault Ingest - Government Credit trimerge Transaction log');	
														  
										
										
														  
														  