#workunit('name', 'BWR_ProcessAutomation-  I_mbsi_transaction_log_model_attribute');
   
   IMPORT STD,I_mbsi_transaction_log_model_attribute, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_mbsi_transaction_log_model_attribute, //module name
   														  'Vault Ingest - MBSI NONFCRA Transaction Log Model Attribute');	