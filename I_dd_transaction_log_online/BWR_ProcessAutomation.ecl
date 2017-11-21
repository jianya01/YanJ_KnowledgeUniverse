#workunit('name', 'BWR_ProcessAutomation-  I_dd_transaction_log_online');
   
   IMPORT STD,I_dd_transaction_log_online, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_dd_transaction_log_online, //module name
   														  'Vault Ingest - DD Transaction Log Online ');	