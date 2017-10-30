#workunit('name', 'BWR_ProcessAutomation-  I_CDSC_transaction_log_online');
   
   IMPORT STD,I_CDSC_transaction_log_online, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_CDSC_transaction_log_online, //module name
   														  'Vault Ingest - Claims Discovery Auto transaction log online ');	