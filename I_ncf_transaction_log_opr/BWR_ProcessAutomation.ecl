#workunit('name', 'BWR_ProcessAutomation-  I_ncf_transaction_log_opr');
   
   IMPORT STD,I_ncf_transaction_log_opr, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_ncf_transaction_log_opr, //module name
   														  'Vault Ingest - NCF Transaction log opr ');	