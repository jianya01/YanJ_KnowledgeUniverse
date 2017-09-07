#workunit('name', 'BWR_ProcessAutomation-  I_Bankruptcy_Search');

IMPORT VaultIngest,Vault_layout,UT,STD;

VaultIngest.ProcessAutomation_V2(I_Bankruptcy_Search,'Bankruptcy_Search Build',I_Bankruptcy_Search.Constants.pkgvar,VaultIngest.Constants.Dops_RoxieIP);

