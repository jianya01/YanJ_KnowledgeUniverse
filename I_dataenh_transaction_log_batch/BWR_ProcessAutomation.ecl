#workunit('name', 'BWR_ProcessAutomation-  I_dataenh_transaction_log_batch');
   
   IMPORT STD,I_dataenh_transaction_log_batch, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_dataenh_transaction_log_batch, //module name
   														  'Vault Ingest - Data Enhancement transaction_log_batch ');	