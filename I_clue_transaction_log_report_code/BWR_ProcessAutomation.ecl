#workunit('name', 'BWR_ProcessAutomation-  I_clue_transaction_log_report_code');
   
   IMPORT STD,I_clue_transaction_log_report_code, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_clue_transaction_log_report_code, //module name
   														  'Vault Ingest - CLUE Transaction log report code ');	