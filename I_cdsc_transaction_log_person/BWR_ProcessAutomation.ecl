#workunit('name', 'BWR_ProcessAutomation-  I_CDSC_transaction_log_person');
   
   IMPORT STD,I_CDSC_transaction_log_person, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_CDSC_transaction_log_person, //module name
   														  'Vault Ingest - Claims Discovery Auto transaction log person ');	