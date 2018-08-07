#OPTION('multiplePersistInstances', FALSE);

#workunit('name', 'BWR_ProcessAutomation- I_criminal_offenses_fcra_offender_key');
   
IMPORT STD,I_criminal_offenses_fcra_offender_key, VaultIngest, Vault_layout;
   
VaultIngest.ProcessAutomation_V2(I_criminal_offenses_fcra_offender_key, //module name
   														  'Vault Ingest - I_criminal_offenses_fcra_offender_key','','');	
														  
														  
