#OPTION('multiplePersistInstances', FALSE);

#workunit('name', 'BWR_ProcessAutomation- I_fcra_datecorrect_hval');
   
IMPORT STD,I_fcra_datecorrect_hval, VaultIngest, Vault_layout;
   
VaultIngest.ProcessAutomation_V2(I_fcra_datecorrect_hval, //module name
   														  'Vault Ingest - I_fcra_datecorrect_hval','','');	
