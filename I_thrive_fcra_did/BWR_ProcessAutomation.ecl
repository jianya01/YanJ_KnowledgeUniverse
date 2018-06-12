#OPTION('multiplePersistInstances', FALSE);

#workunit('name', 'BWR_ProcessAutomation- I_thrive_fcra_did');
   
IMPORT STD,I_thrive_fcra_did, VaultIngest, Vault_layout;
   
VaultIngest.ProcessAutomation_V2(I_thrive_fcra_did, //module name
   														  'Vault Ingest - I_thrive_fcra_did','','');	
