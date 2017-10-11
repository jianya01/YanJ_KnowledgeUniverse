#workunit('name', 'BWR_ProcessAutomation-  I_rmp_transaction_log_vin');
   
   IMPORT STD,I_rmp_transaction_log_vin, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_rmp_transaction_log_vin, //module name
   														  'Vault Ingest - RMP Transaction log vin ');	