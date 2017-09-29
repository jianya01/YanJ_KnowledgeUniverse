#workunit('name', 'BWR_ProcessAutomation-  I_Key_Relatives_V3');
   
IMPORT STD,I_Key_Relatives_V3, VaultIngest, Vault_layout;
   
VaultIngest.ProcessAutomation_V2(I_Key_Relatives_V3, //module name
   														  'Vault Ingest - I_Key_Relatives_V3',I_Key_Relatives_V3.Constants.pkgvar,VaultIngest.Constants.IDops_RoxieIP);	
