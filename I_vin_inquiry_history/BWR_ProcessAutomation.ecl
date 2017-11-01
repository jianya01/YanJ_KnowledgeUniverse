#workunit('name', 'BWR_ProcessAutomation-  I_vin_inquiry_history');
   
   IMPORT STD,I_vin_inquiry_history, VaultIngest, Vault_layout;
   
   VaultIngest.ProcessAutomation(I_vin_inquiry_history, //module name
   														  'Vault Ingest - VIN inquiry history ');	