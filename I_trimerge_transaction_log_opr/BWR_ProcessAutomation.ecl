#workunit('name', 'BWR_ProcessAutomation-  I_trimerge_transaction_log_opr');
   
   IMPORT STD,I_trimerge_transaction_log_opr, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_trimerge_transaction_log_opr, //module name
   														  'Vault Ingest - Government Credit trimerge Transaction log opr');	
														  
										
										
														  
														  