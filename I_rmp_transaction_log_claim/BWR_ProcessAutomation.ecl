#workunit('name', 'BWR_ProcessAutomation-  I_rmp_transaction_log_claim');
   
   IMPORT STD,I_rmp_transaction_log_claim, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_rmp_transaction_log_claim, //module name
   														  'Vault Ingest - RMP Transaction log claim ');	