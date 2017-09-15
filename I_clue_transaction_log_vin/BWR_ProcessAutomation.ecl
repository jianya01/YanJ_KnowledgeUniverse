#workunit('name', 'BWR_ProcessAutomation-  I_clue_transaction_log_vin');
   
   IMPORT STD,I_clue_transaction_log_vin, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_clue_transaction_log_vin, //module name
   														  'Vault Ingest - CLUE Transaction log vin ');	