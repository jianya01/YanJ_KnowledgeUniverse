#workunit('name', 'BWR_ProcessAutomation-  I_clue_transaction_log');
   
   IMPORT STD,I_clue_transaction_log, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_clue_transaction_log, //module name
   														  'Vault Ingest - CLUE Transaction log ');	