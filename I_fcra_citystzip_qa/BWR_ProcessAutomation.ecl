#OPTION('multiplePersistInstances', FALSE);

#workunit('name', 'BWR_ProcessAutomation- I_fcra_citystzip_qa');
   
IMPORT STD,I_fcra_citystzip_qa, VaultIngest, Vault_layout;
   
VaultIngest.ProcessAutomation_V2(I_fcra_citystzip_qa, //module name
   														  'Vault Ingest - I_fcra_citystzip_qa','','');	
														  
