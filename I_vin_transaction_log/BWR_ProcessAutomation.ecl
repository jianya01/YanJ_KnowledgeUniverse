#workunit('name', 'BWR_ProcessAutomation-  I_VIN_transaction_log');
   
   IMPORT STD,I_VIN_transaction_log, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_VIN_transaction_log, //module name
   														  'Vault Ingest - VIN transaction log ');	