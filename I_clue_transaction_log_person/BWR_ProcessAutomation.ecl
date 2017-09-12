#workunit('name', 'BWR_ProcessAutomation-  I_clue_transaction_log_person');
   
   IMPORT STD,I_clue_transaction_log_person, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_clue_transaction_log_person, //module name
   														  'Vault Ingest - CLUE Transaction log person ');	