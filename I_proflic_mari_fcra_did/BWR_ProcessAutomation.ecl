#OPTION('multiplePersistInstances', FALSE);

#workunit('name', 'BWR_ProcessAutomation- I_proflic_mari_fcra_did');
   
IMPORT STD,I_proflic_mari_fcra_did, VaultIngest, Vault_layout;
   
VaultIngest.ProcessAutomation_V2(I_proflic_mari_fcra_did, //module name
   														  'Vault Ingest - I_proflic_mari_fcra_did','','');	
