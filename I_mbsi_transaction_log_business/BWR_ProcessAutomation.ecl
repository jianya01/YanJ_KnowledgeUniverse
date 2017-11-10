#workunit('name', 'BWR_ProcessAutomation-  I_mbsi_transaction_log_business');
   
   IMPORT STD,I_mbsi_transaction_log_business, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_mbsi_transaction_log_business, //module name
   														  'Vault Ingest - MBSI NONFCRA Transaction Log Business');	