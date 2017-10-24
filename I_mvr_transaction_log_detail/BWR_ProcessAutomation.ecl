#workunit('name', 'BWR_ProcessAutomation-  I_mvr_transaction_log_detail');
   
   IMPORT STD,I_mvr_transaction_log_detail, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_mvr_transaction_log_detail, //module name
   														  'Vault Ingest - MVR transaction log detail ');	