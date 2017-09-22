#workunit('name', 'BWR_ProcessAutomation-  I_NCF_transaction_log_batch');
   
   IMPORT STD,I_NCF_transaction_log_batch, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_NCF_transaction_log_batch, //module name
   														  'Vault Ingest - NCF Transaction log batch ');	