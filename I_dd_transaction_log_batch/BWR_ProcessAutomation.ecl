#workunit('name', 'BWR_ProcessAutomation-  I_dd_transaction_log_batch');
   
   IMPORT STD,I_dd_transaction_log_batch, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_dd_transaction_log_batch, //module name
   														  'Vault Ingest - DD Transaction log Batch');	