#workunit('name', 'BWR_ProcessAutomation-  I_mvr_transaction_report_view_log');
   
   IMPORT STD,I_mvr_transaction_report_view_log, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_mvr_transaction_report_view_log, //module name
   														  'Vault Ingest - MVR Transaction report view log ');	