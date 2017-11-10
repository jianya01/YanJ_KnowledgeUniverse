#workunit('name', 'BWR_ProcessAutomation-  I_mbsi_transaction_log_model');
   
   IMPORT STD,I_mbsi_transaction_log_model, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_mbsi_transaction_log_model, //module name
   														  'Vault Ingest - MBSI NONFCRA Transaction Log Model');	