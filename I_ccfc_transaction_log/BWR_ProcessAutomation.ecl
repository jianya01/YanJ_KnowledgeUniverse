#workunit('name', 'BWR_ProcessAutomation-  I_CCFC_transaction_log');
   
   IMPORT STD,I_CCFC_transaction_log, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_CCFC_transaction_log, //module name
   														  'Vault Ingest - Carrier Discovery Transaction log ');	