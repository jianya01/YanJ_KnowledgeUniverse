#OPTION('multiplePersistInstances', FALSE);

#workunit('name', 'BWR_ProcessAutomation- I_fcra_aid_rawaid_to_acecahe');
   
IMPORT STD,I_fcra_aid_rawaid_to_acecahe, VaultIngest, Vault_layout;
   
VaultIngest.ProcessAutomation_V2(I_fcra_aid_rawaid_to_acecahe, //module name
   														  'Vault Ingest - I_fcra_aid_rawaid_to_acecahe','','');	
