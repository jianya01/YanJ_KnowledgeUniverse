#workunit('name', 'BWR_ProcessAutomation-  I_ncf_inquiry_history');
   
   IMPORT STD,I_ncf_inquiry_history, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_ncf_inquiry_history, //module name
   														  'Vault Ingest - NCF Inquiry History ');	