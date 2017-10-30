#workunit('name', 'BWR_ProcessAutomation-  I_CDSCAuto_inquiry_history');
   
   IMPORT STD,I_CDSCAuto_inquiry_history, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_CDSCAuto_inquiry_history, //module name
   														  'Vault Ingest - Claims Discovery Auto inquiry history ');	