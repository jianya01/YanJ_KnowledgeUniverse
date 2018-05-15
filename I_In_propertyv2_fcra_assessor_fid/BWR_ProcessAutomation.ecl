#OPTION('multiplePersistInstances', FALSE);

#workunit('name', 'BWR_ProcessAutomation- I_In_propertyv2_fcra_assessor_fid');
   
IMPORT STD,I_In_propertyv2_fcra_assessor_fid, VaultIngest, Vault_layout;
   
VaultIngest.ProcessAutomation_V2(I_In_propertyv2_fcra_assessor_fid, //module name
   														  'Vault Ingest - I_In_propertyv2_fcra_assessor_fid','','');	
