#OPTION('multiplePersistInstances', FALSE);

#workunit('name', 'BWR_ProcessAutomation- I_watchdog_best_fcra_nonen_did');
   
IMPORT STD,I_watchdog_best_fcra_nonen_did, VaultIngest, Vault_layout;
   
VaultIngest.ProcessAutomation_V2(I_watchdog_best_fcra_nonen_did, //module name
   														  'Vault Ingest - I_watchdog_best_fcra_nonen_did','','');	
														  
