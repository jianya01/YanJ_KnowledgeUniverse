#workunit('name', 'BWR_ProcessAutomation-  I_trimerge_transaction_log_extension');
   
   IMPORT STD,I_trimerge_transaction_log_extension, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_trimerge_transaction_log_extension, //module name
   														  'Vault Ingest - Government Credit trimerge Transaction log extension');	
														  
										
										
														  
														  