#workunit('name', 'BWR_ProcessAutomation-  I_trimerge_intermediate_log');
   
   IMPORT STD,I_trimerge_intermediate_log, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_trimerge_intermediate_log, //module name
   														  'Vault Ingest - Government Credit trimerge intermediate log');	
														  
										
										
														  
														  