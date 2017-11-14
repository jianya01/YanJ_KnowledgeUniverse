#workunit('name', 'BWR_ProcessAutomation-  I_CCFC_transaction_log_batch_summary');
   
   IMPORT STD,I_CCFC_transaction_log_batch_summary, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_CCFC_transaction_log_batch_summary, //module name
   														  'Vault Ingest - Carrier Discovery Transaction log batch summary ');	