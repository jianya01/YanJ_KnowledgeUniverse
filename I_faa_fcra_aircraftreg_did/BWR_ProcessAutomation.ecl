#OPTION('multiplePersistInstances', FALSE);

#workunit('name', 'BWR_ProcessAutomation- I_faa_fcra_aircraftreg_did');
   
IMPORT STD,I_faa_fcra_aircraftreg_did, VaultIngest, Vault_layout;
   
VaultIngest.ProcessAutomation_V2(I_faa_fcra_aircraftreg_did, //module name
   														  'Vault Ingest - I_faa_fcra_aircraftreg_did','','');	
