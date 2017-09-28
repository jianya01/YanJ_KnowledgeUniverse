#workunit('name', 'BWR_ProcessAutomation-  I_clue_transaction_log_online');
   
   IMPORT STD,I_clue_transaction_log_online, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_clue_transaction_log_online, //module name
   														  'Vault Ingest - CLUE Transaction log online ');	