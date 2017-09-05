#workunit('name', 'BWR_ProcessAutomation-  I_cc_transaction_log_policy_subject');
   
   IMPORT STD,I_cc_transaction_log_policy_subject, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_cc_transaction_log_policy_subject, //module name
   														  'Vault Ingest - Current Carrier Transaction log policy subject ');	