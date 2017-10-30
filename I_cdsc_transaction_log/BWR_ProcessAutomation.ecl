#workunit('name', 'BWR_ProcessAutomation-  I_CDSC_transaction_log');
   
   IMPORT STD,I_CDSC_transaction_log, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_CDSC_transaction_log, //module name
   														  'Vault Ingest - Claims Discovery Auto Transaction log ');	