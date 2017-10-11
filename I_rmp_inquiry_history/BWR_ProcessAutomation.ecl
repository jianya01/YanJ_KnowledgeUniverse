#workunit('name', 'BWR_ProcessAutomation-  I_rmp_inquiry_history');
   
   IMPORT STD,I_rmp_inquiry_history, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_rmp_inquiry_history, //module name
   														  'Vault Ingest - RMP Inquiry History ');	