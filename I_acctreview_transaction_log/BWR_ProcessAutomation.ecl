#workunit('name', 'BWR_ProcessAutomation-  I_acctreview_transaction_log');
   
   IMPORT STD,I_acctreview_transaction_log, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_acctreview_transaction_log, //module name
   														  'Vault Ingest - Analytics Book Scores Transaction log ');	