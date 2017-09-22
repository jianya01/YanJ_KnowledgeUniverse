#workunit('name', 'BWR_ProcessAutomation-  I_ncf_transaction_log_billing_reporting');
   
   IMPORT STD,I_ncf_transaction_log_billing_reporting, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_ncf_transaction_log_billing_reporting, //module name
   														  'Vault Ingest - NCF Transaction log billing reporting ');	