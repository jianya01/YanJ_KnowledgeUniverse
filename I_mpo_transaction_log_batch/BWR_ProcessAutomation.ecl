#workunit('name', 'BWR_ProcessAutomation-  I_mpo_transaction_log_batch');
   
   IMPORT STD,I_mpo_transaction_log_batch, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_mpo_transaction_log_batch, //module name
   														  'Vault Ingest - MPO Transaction Log Batch ');	