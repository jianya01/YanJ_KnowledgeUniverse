#workunit('name', 'BWR_ProcessAutomation-  I_CDSC_transaction_log_extension');
   
   IMPORT STD,I_CDSC_transaction_log_extension, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_CDSC_transaction_log_extension, //module name
   														  'Vault Ingest - Claims Discovery Auto transaction log extension ');	