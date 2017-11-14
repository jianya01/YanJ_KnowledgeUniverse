#workunit('name', 'BWR_ProcessAutomation-  I_CCFC_inquiry_history');
   
   IMPORT STD,I_CCFC_inquiry_history, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_CCFC_inquiry_history, //module name
   														  'Vault Ingest - Carrier Discovery Inquiry History ');	