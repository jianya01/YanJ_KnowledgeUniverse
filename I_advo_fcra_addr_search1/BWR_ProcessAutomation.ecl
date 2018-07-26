#OPTION('multiplePersistInstances', FALSE);

#workunit('name', 'BWR_ProcessAutomation- I_advo_fcra_addr_search1');
   
IMPORT STD,I_advo_fcra_addr_search1, VaultIngest, Vault_layout;
   
VaultIngest.ProcessAutomation_V2(I_advo_fcra_addr_search1, //module name
   														  'Vault Ingest - I_advo_fcra_addr_search1','','');	
														  
														  
