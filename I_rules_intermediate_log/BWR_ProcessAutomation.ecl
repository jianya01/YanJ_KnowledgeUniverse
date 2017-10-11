#workunit('name', 'BWR_ProcessAutomation-  I_rules_intermediate_log');
   
   IMPORT STD,I_rules_intermediate_log, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_rules_intermediate_log, //module name
   														  'Vault Ingest - Rules Framework nonFCRA intermediate_log');	
														  
										
										
														  
														  