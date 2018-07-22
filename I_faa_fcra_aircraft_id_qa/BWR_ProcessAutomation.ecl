#OPTION('multiplePersistInstances', FALSE);

#workunit('name', 'BWR_ProcessAutomation- I_faa_fcra_aircraft_id_qa');
   
IMPORT STD,I_faa_fcra_aircraft_id_qa, VaultIngest, Vault_layout;
   
VaultIngest.ProcessAutomation_V2(I_faa_fcra_aircraft_id_qa, //module name
   														  'Vault Ingest - I_faa_fcra_aircraft_id_qa','','');	
														  
