#workunit('name', 'BWR_ProcessAutomation-  I_ivs_intermediate_log');
   
   IMPORT STD,I_ivs_intermediate_log, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_ivs_intermediate_log, //module name
   														  'Vault Ingest - Insurance Verification intermediate_log ');	