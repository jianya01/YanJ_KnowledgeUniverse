#workunit('name', 'BWR_ProcessAutomation-  I_mbsi_transaction_log_batch');
   
   IMPORT STD,I_mbsi_transaction_log_batch, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_mbsi_transaction_log_batch, //module name
   														  'Vault Ingest - MBSI NONFCRA Transaction Log Batch');	