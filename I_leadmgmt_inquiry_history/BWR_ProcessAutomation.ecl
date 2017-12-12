#workunit('name', 'BWR_ProcessAutomation-  I_leadmgmt_inquiry_history');
   
   IMPORT STD,I_leadmgmt_inquiry_history, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_leadmgmt_inquiry_history, //module name
   														  'Vault Ingest - Leadmgmt inquiry history ');	