#workunit('name', 'BWR_ProcessAutomation-  I_cc_transaction_log_policy');
   
   IMPORT STD,I_cc_transaction_log_policy, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_cc_transaction_log_policy, //module name
   														  'Vault Ingest - Current Carrier Transaction log Policy ');	