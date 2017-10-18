#workunit('name', 'BWR_ProcessAutomation-  I_mbsi_nonfcra_transaction_log_extension');
   
   IMPORT STD,I_mbsi_nonfcra_transaction_log_extension, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_mbsi_nonfcra_transaction_log_extension, //module name
   														  'Vault Ingest - MBSI NONFCRA Transaction Log Extension');	