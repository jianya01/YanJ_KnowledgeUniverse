#workunit('name', 'BWR_ProcessAutomation-  I_dd_transaction_log');
   
   IMPORT STD,I_dd_transaction_log, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_dd_transaction_log, //module name
   														  'Vault Ingest - DD Transaction log ');	