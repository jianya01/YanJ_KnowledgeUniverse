#OPTION('multiplePersistInstances', FALSE);

#workunit('name', 'BWR_ProcessAutomation-  I_Insurance_Prescreen');
   
IMPORT STD,I_Insurance_Prescreen, VaultIngest, Vault_layout;
   
VaultIngest.ProcessAutomation_V2(I_Insurance_Prescreen, //module name
   														  'Vault Ingest - I_Insurance_Prescreen','','');	
