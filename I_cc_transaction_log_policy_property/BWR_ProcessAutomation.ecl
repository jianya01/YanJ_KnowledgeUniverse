#workunit('name', 'BWR_ProcessAutomation-  I_cc_transaction_log_policy_property');
   
   IMPORT STD,I_cc_transaction_log_policy_property, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_cc_transaction_log_policy_property, //module name
   														  'Vault Ingest - Current Carrier Transaction log policy property ');	