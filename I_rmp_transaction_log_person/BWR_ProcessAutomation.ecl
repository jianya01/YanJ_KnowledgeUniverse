#workunit('name', 'BWR_ProcessAutomation-  I_rmp_transaction_log_person');
   
   IMPORT STD,I_rmp_transaction_log_person, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_rmp_transaction_log_person, //module name
   														  'Vault Ingest - RMP Transaction log person ');	