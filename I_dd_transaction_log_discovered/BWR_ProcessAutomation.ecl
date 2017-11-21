#workunit('name', 'BWR_ProcessAutomation-  I_dd_transaction_log_discovered');
   
   IMPORT STD,I_dd_transaction_log_discovered, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_dd_transaction_log_discovered, //module name
   														  'Vault Ingest - DD Transaction Log Discovered ');	