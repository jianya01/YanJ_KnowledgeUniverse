#workunit('name', 'BWR_ProcessAutomation-  I_cc_transaction_log_policy_coverage');
   
   IMPORT STD,I_cc_transaction_log_policy_coverage, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_cc_transaction_log_policy_coverage, //module name
   														  'Vault Ingest - Current Carrier Transaction log policy coverage ');	