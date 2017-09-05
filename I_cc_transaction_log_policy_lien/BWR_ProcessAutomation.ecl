#workunit('name', 'BWR_ProcessAutomation-  I_cc_transaction_log_policy_lien');
   
   IMPORT STD,I_cc_transaction_log_policy_lien, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_cc_transaction_log_policy_lien, //module name
   														  'Vault Ingest - Current Carrier Transaction log policy lien ');	