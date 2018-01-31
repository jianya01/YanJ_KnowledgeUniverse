#workunit('name', 'BWR_ProcessAutomation- I_Tobacco_Vente');

IMPORT VaultIngest,Vault_layout,UT,STD;

Catchup_Date := '';

VaultIngest.ProcessAutomation_V2(I_Tobacco_Vente,'I_Tobacco_Vente Build','','',Catchup_Date);

