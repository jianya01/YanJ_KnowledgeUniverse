#OPTION('multiplePersistInstances', FALSE);

#workunit('name', 'BWR_ProcessAutomation- I_infutorcid_fcra_did_qa');
   
IMPORT STD,I_infutorcid_fcra_did_qa, VaultIngest, Vault_layout;
   
VaultIngest.ProcessAutomation_V2(I_infutorcid_fcra_did_qa, //module name
   														  'Vault Ingest - I_infutorcid_fcra_did_qa','','');	
														  
														  
