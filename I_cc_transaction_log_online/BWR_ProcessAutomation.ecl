#workunit('name', 'BWR_ProcessAutomation-  I_cc_transaction_log_online');
   
   IMPORT STD,I_cc_transaction_log_online, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_cc_transaction_log_online, //module name
   														  'Vault Ingest - Current Carrier Transaction log online ');	