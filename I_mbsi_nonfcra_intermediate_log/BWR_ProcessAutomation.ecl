#workunit('name', 'BWR_ProcessAutomation-  I_mbsi_nonfcra_intermediate_log');
   
   IMPORT STD,I_mbsi_nonfcra_intermediate_log, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_mbsi_nonfcra_intermediate_log, //module name
   														  'Vault Ingest - MBSI NONFCRA Internediate log ');	