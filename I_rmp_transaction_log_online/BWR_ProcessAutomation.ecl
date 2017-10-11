#workunit('name', 'BWR_ProcessAutomation-  I_rmp_transaction_log_online');
   
   IMPORT STD,I_rmp_transaction_log_online, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_rmp_transaction_log_online, //module name
   														  'Vault Ingest - RMP Transaction log online ');	