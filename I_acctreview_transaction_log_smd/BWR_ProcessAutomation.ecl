#workunit('name', 'BWR_ProcessAutomation-  I_acctreview_transaction_log_smd');
   
   IMPORT STD,I_acctreview_transaction_log_smd, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_acctreview_transaction_log_smd, //module name
   														  'Vault Ingest - Analytics Book Scores Transaction log smd');	