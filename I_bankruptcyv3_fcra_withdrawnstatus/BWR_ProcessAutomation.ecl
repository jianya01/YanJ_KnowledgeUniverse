#OPTION('multiplePersistInstances', FALSE);

#workunit('name', 'BWR_ProcessAutomation- I_bankruptcyv3_fcra_withdrawnstatus');
   
IMPORT STD,I_bankruptcyv3_fcra_withdrawnstatus, VaultIngest, Vault_layout;
   
VaultIngest.ProcessAutomation_V2(I_bankruptcyv3_fcra_withdrawnstatus, //module name
   														  'Vault Ingest - I_bankruptcyv3_fcra_withdrawnstatus','','');
														  
