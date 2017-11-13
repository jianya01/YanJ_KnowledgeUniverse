#workunit('name', 'BWR_ProcessAutomation-  I_mbsi_transaction_log');
   
   IMPORT STD,I_mbsi_transaction_log, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_mbsi_transaction_log, //module name
   														  'Vault Ingest - MBSI NONFCRA Transaction log ');	