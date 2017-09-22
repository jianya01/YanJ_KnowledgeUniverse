#workunit('name', 'BWR_ProcessAutomation-  I_ncf_transaction_log_extension');
   
   IMPORT STD,I_ncf_transaction_log_extension, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_ncf_transaction_log_extension, //module name
   														  'Vault Ingest - NCF Transaction log extension ');	