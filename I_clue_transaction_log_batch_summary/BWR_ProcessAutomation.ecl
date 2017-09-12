#workunit('name', 'BWR_ProcessAutomation-  I_clue_transaction_log_batch_summary');
   
   IMPORT STD,I_clue_transaction_log_batch_summary, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_clue_transaction_log_batch_summary, //module name
   														  'Vault Ingest - CLUE Transaction log batch summary ');	