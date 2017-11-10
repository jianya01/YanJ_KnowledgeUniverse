#workunit('name', 'BWR_ProcessAutomation-  I_mbsi_transaction_log_vehicle');
   
   IMPORT STD,I_mbsi_transaction_log_vehicle, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_mbsi_transaction_log_vehicle, //module name
   														  'Vault Ingest - MBSI NONFCRA Transaction Log Vehicle');	