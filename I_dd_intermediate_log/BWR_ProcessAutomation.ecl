#workunit('name', 'BWR_ProcessAutomation-  I_dd_intermediate_log');
   
   IMPORT STD,I_dd_intermediate_log, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_dd_intermediate_log, //module name
   														  'Vault Ingest - DD Internediate log ');	