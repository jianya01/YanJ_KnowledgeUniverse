#workunit('name', 'BWR_ProcessAutomation-  I_rmp_transaction_log_extension');
   
   IMPORT STD,I_rmp_transaction_log_extension, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_rmp_transaction_log_extension, //module name
   														  'Vault Ingest - RMP Transaction log extension ');	