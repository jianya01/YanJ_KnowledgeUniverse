#workunit('name', 'BWR_ProcessAutomation-  I_CCFC_transaction_log_billing');
   
   IMPORT STD,I_CCFC_transaction_log_billing, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_CCFC_transaction_log_billing, //module name
   														  'Vault Ingest - Carrier Discovery Transaction log billing ');	