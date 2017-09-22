#workunit('name', 'BWR_ProcessAutomation-  I_ncf_transaction_log_smd');
   
   IMPORT STD,I_ncf_transaction_log_smd, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_ncf_transaction_log_smd, //module name
   														  'Vault Ingest - NCF Transaction log smd ');	