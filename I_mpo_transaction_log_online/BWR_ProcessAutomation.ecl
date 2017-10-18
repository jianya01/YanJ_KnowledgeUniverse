#workunit('name', 'BWR_ProcessAutomation-  I_mpo_transaction_log_online');
   
   IMPORT STD,I_mpo_transaction_log_online, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_mpo_transaction_log_online, //module name
   														  'Vault Ingest - MPO Transaction Log Online ');	