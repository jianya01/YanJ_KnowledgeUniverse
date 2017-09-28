#workunit('name', 'BWR_ProcessAutomation-  I_ncf_transaction_log_text_data');
   
   IMPORT STD,I_ncf_transaction_log_text_data, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_ncf_transaction_log_text_data, //module name
   														  'Vault Ingest - NCF Transaction log text data ');	