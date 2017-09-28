#workunit('name', 'BWR_ProcessAutomation-  I_Criminal_Offender');
   
IMPORT STD,I_Criminal_Offender, VaultIngest, Vault_layout;
   
VaultIngest.ProcessAutomation_V2(I_Criminal_Offender, //module name
   														  'Vault Ingest - I_Criminal_Offender',I_Criminal_Offender.Constants.pkgvar,VaultIngest.Constants.Dops_RoxieIP);	
