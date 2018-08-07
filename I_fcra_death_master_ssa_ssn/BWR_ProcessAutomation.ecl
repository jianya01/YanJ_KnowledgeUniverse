#OPTION('multiplePersistInstances', FALSE);

#workunit('name', 'BWR_ProcessAutomation- I_fcra_death_master_ssa_ssn');
   
IMPORT STD,I_fcra_death_master_ssa_ssn, VaultIngest, Vault_layout;
   
VaultIngest.ProcessAutomation_V2(I_fcra_death_master_ssa_ssn, //module name
   														  'Vault Ingest - I_fcra_death_master_ssa_ssn','','');	
