#workunit('name', 'BWR_ProcessAutomation-  I_rules_transaction_log_addon');
   
   IMPORT STD,I_rules_transaction_log_addon, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_rules_transaction_log_addon, //module name
   														  'Vault Ingest - Rules Framework nonFCRA Transaction log addon');	
														  
														  