#workunit('name', 'BWR_ProcessAutomation-  I_ncf_transaction_log_online');
   
   IMPORT STD,I_ncf_transaction_log_online, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_ncf_transaction_log_online, //module name
   														  'Vault Ingest - NCF Transaction log online ');	