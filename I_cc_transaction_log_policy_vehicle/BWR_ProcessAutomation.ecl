#workunit('name', 'BWR_ProcessAutomation-  I_cc_transaction_log_policy_vehicle');
   
   IMPORT STD,I_cc_transaction_log_policy_vehicle, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_cc_transaction_log_policy_vehicle, //module name
   														  'Vault Ingest - Current Carrier Transaction log policy vehicle ');	