#OPTION('multiplePersistInstances', FALSE);

#workunit('name', 'BWR_ProcessAutomation- I_infutorcid_fcra_phone_qa');
   
IMPORT STD,I_infutorcid_fcra_phone_qa, VaultIngest, Vault_layout;
   
VaultIngest.ProcessAutomation_V2(I_infutorcid_fcra_phone_qa, //module name
   														  'Vault Ingest - I_infutorcid_fcra_phone_qa','','');
														  
														  
														  
														  
