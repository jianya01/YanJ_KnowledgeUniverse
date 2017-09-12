#workunit('name', 'BWR_ProcessAutomation-  I_cc_inquiry_history');
   
   IMPORT STD,I_cc_inquiry_history, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_cc_inquiry_history, //module name
   														  'Vault Ingest - Current Carrier Inquiry history ');	