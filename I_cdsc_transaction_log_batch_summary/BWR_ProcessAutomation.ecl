#workunit('name', 'BWR_ProcessAutomation-  I_CDSC_transaction_log_batch_summary');
   
   IMPORT STD,I_CDSC_transaction_log_batch_summary, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_CDSC_transaction_log_batch_summary, //module name
   														  'Vault Ingest - Claims Discovery Auto transaction log batch summary ');	