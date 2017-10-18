#workunit('name', 'BWR_ProcessAutomation-  I_mpo_transaction_log');
   
   IMPORT STD,I_mpo_transaction_log, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_mpo_transaction_log, //module name
   														  'Vault Ingest - MPO Transaction Log ');	