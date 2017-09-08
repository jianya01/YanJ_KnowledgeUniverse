#workunit('name', 'BWR_ProcessAutomation-  I_cc_transaction_log_person');
   
   IMPORT STD,I_cc_transaction_log_person, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_cc_transaction_log_person, //module name
   														  'Vault Ingest - Current Carrier Transaction log Person ');	