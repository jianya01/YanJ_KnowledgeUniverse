#workunit('name', 'BWR_ProcessAutomation-  I_vin_transaction_log_extension');
   
   IMPORT STD,I_vin_transaction_log_extension, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_vin_transaction_log_extension, //module name
   														  'Vault Ingest - VIN transaction log extension ');	