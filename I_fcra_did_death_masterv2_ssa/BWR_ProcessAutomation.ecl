#OPTION('multiplePersistInstances', FALSE);

#workunit('name', 'BWR_ProcessAutomation- I_fcra_did_death_masterv2_ssa');
   
IMPORT STD,I_fcra_did_death_masterv2_ssa, VaultIngest, Vault_layout;
   
VaultIngest.ProcessAutomation_V2(I_fcra_did_death_masterv2_ssa, //module name
   														  'Vault Ingest - I_fcra_did_death_masterv2_ssa','','');	
