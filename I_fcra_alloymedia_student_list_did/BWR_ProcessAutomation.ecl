#OPTION('multiplePersistInstances', FALSE);

#workunit('name', 'BWR_ProcessAutomation- I_fcra_alloymedia_student_list_did');
   
IMPORT STD,I_fcra_alloymedia_student_list_did, VaultIngest, Vault_layout;
   
VaultIngest.ProcessAutomation_V2(I_fcra_alloymedia_student_list_did, //module name
   														  'Vault Ingest - I_fcra_alloymedia_student_list_did','','');	
