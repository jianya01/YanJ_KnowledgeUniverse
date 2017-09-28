#workunit('name', 'BWR_ProcessAutomation-  I_clue_transaction_log_batch');
   
   IMPORT STD,I_clue_transaction_log_batch, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_clue_transaction_log_batch, //module name
   														  'Vault Ingest - CLUE Transaction log batch ');	