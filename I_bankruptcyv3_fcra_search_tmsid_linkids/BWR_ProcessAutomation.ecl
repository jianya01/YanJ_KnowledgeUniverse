#OPTION('multiplePersistInstances', FALSE);

#workunit('name', 'BWR_ProcessAutomation- I_bankruptcyv3_fcra_search_tmsid_linkids');
   
IMPORT STD,I_bankruptcyv3_fcra_search_tmsid_linkids, VaultIngest, Vault_layout;
   
VaultIngest.ProcessAutomation_V2(I_bankruptcyv3_fcra_search_tmsid_linkids, //module name
   														  'Vault Ingest - I_bankruptcyv3_fcra_search_tmsid_linkids','','');	
