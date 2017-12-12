#workunit('name', 'BWR_ProcessAutomation-  I_ivs_transaction_log');
   
   IMPORT STD,I_ivs_transaction_log, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_ivs_transaction_log, //module name
   														  'Vault Ingest - Insurance Verification transaction_log ');	