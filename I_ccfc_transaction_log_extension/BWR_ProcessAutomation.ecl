#workunit('name', 'BWR_ProcessAutomation-  I_CCFC_transaction_log_extension');
   
   IMPORT STD,I_CCFC_transaction_log_extension, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_CCFC_transaction_log_extension, //module name
   														  'Vault Ingest - Carrier Discovery Transaction log Extension');	