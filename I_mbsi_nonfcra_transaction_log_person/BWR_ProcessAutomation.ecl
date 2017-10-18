#workunit('name', 'BWR_ProcessAutomation-  I_mbsi_nonfcra_transaction_log_person');
   
   IMPORT STD,I_mbsi_nonfcra_transaction_log_person, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_mbsi_nonfcra_transaction_log_person, //module name
   														  'Vault Ingest - MBSI NONFCRA Transaction Log Person');	