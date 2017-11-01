#workunit('name', 'BWR_ProcessAutomation-  I_vin_transaction_log_online');
   
   IMPORT STD,I_vin_transaction_log_online, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_vin_transaction_log_online, //module name
   														  'Vault Ingest - VIN transaction log online ');	