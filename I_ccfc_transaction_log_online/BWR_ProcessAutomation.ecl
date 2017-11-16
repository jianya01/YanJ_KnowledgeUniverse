#workunit('name', 'BWR_ProcessAutomation-  I_CCFC_transaction_log_online');
   
   IMPORT STD,I_CCFC_transaction_log_online, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_CCFC_transaction_log_online, //module name
   														  'Vault Ingest - Carrier Discovery Transaction log online ');	