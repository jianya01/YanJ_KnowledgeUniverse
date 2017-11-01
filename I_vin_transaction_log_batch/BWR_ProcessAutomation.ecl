#workunit('name', 'BWR_ProcessAutomation-  I_VIN_transaction_log_batch');
   
   IMPORT STD,I_VIN_transaction_log_batch, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_VIN_transaction_log_batch, //module name
   														  'Vault Ingest - VIN transaction log batch ');	