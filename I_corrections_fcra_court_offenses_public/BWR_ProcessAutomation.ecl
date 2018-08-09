#OPTION('multiplePersistInstances', FALSE);

#workunit('name', 'BWR_ProcessAutomation- I_corrections_fcra_court_offenses_public');
   
IMPORT STD,I_corrections_fcra_court_offenses_public, VaultIngest, Vault_layout;
   
VaultIngest.ProcessAutomation_V2(I_corrections_fcra_court_offenses_public, //module name
   														  'Vault Ingest - I_corrections_fcra_court_offenses_public','','');	
														  
