#workunit('name', 'BWR_ProcessAutomation-  I_dd_transaction_log_inq_subject');
   
   IMPORT STD,I_dd_transaction_log_inq_subject, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_dd_transaction_log_inq_subject, //module name
   														  'Vault Ingest - DD Transaction Log Inq Subject ');	 