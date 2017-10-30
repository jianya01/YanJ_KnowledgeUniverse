#workunit('name', 'BWR_ProcessAutomation-  I_CDSC_transaction_log_batch');
   
   IMPORT STD,I_CDSC_transaction_log_batch, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_CDSC_transaction_log_batch, //module name
   														  'Vault Ingest - Claims Discovery Auto transaction log batch ');	