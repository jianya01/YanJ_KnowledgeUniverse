#workunit('name', 'BWR_ProcessAutomation-  I_NCF_transaction_log');
   
   IMPORT STD,I_NCF_transaction_log, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_NCF_transaction_log, //module name
   														  'Vault Ingest - NCF Transaction log ');	