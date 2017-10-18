#workunit('name', 'BWR_ProcessAutomation-  I_mbsi_nonfcra_transaction_log_address');
   
   IMPORT STD,I_mbsi_nonfcra_transaction_log_address, VaultIngest, Vault_layout;
 
 
   VaultIngest.ProcessAutomation(I_mbsi_nonfcra_transaction_log_address, //module name
   														  'Vault Ingest - MBSI NONFCRA Transaction Log Address');	