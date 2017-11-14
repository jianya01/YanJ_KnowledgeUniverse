#workunit('name', 'BWR_ProcessAutomation-  I_CCFC_transaction_log_batch');
   
   IMPORT STD,I_CCFC_transaction_log_batch, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_CCFC_transaction_log_batch, //module name
   														  'Vault Ingest - Carrier Discovery Transaction log batch ');	