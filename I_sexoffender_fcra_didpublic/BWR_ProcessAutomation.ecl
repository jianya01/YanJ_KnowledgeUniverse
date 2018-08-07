#OPTION('multiplePersistInstances', FALSE);

#workunit('name', 'BWR_ProcessAutomation- I_sexoffender_fcra_didpublic');
   
IMPORT STD,I_sexoffender_fcra_didpublic, VaultIngest, Vault_layout;
   
VaultIngest.ProcessAutomation_V2(I_sexoffender_fcra_didpublic, //module name
   														  'Vault Ingest - I_sexoffender_fcra_didpublic','','');	
