#workunit('name', 'BWR_ProcessAutomation-  I_cc_transaction_log');
   
   IMPORT STD,I_cc_transaction_log, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_cc_transaction_log, //module name
   														  'Vault Ingest - Current Carrier Transaction log ');	