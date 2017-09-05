#workunit('name', 'BWR_ProcessAutomation-  I_cc_transaction_log_batch');
   
   IMPORT STD,I_cc_transaction_log_batch, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_cc_transaction_log_batch, //module name
   														  'Vault Ingest - Current Carrier Transaction log batch ');	