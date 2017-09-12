#workunit('name', 'BWR_ProcessAutomation-  I_clue_transaction_log_claim');
   
   IMPORT STD,I_clue_transaction_log_claim, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_clue_transaction_log_claim, //module name
   														  'Vault Ingest - CLUE Transaction log claim ');	