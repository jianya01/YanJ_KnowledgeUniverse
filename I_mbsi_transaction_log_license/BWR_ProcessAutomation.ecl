#workunit('name', 'BWR_ProcessAutomation-  I_mbsi_transaction_log_license');
   
   IMPORT STD,I_mbsi_transaction_log_license, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_mbsi_transaction_log_license, //module name
   														  'Vault Ingest - MBSI NONFCRA Transaction Log License');	