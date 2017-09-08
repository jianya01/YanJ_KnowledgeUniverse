IMPORT Vault, Vault_layout, UT, STD;
EXPORT Final := MODULE

EXPORT Bankruptcy_Main := 
												 Vault.Process_Automation(Vault.Files('Bankruptcy','main_v3').Bankruptcy_Main_Vault, //Vault File
												 Vault.Files().Bankruptcy_Main, //Source File 
												 Vault.Files().Bankruptcy_Main_File, //Source File Name
												 Vault_Layout.Layout_Bankruptcy_Main_Vault,  //Current Vault Layout																			
												 Vault.getJoinCondition(Vault.Files().Bankruptcy_Main,[]), //Pass Source File & Exclusion Fields for join condition
												 Vault.GetCompareCondition(Vault.Files().Bankruptcy_Main,Vault_Layout.Layout_Bankruptcy_Main_Vault,[]), //Pass Source File, Child Rec location if any & Exclusion Fields
												 STD.Str.FindReplace(Vault.GetCompareCondition(Vault.Files().Bankruptcy_Main,Vault_Layout.Layout_Bankruptcy_Main_Vault,[]), 'vault_le.','vault_ri.'), //Pass Source File, Child Rec location if any & Exclusion Fields
												 Vault.Files('Bankruptcy').base_prefix, //Vault base Prefix
												 'main_v3', //Vault base Suffix
												 (STRING)std.date.today(), //Current Date if building for today's date (or) Any previous date for catch up builds																			
												 'Bankruptcy', //Source Vertical
												 'Bankruptcy Main', // Email Address Subject
												 Vault.Constants.PublicRecord_Bankruptcy_Daily_pkg_Var, // Package Variable
												 Vault.Constants.Dops_RoxieIP //Roxie IP
												 );
												 
EXPORT Key_Offenders_did := 
												 Vault.Process_Automation(Vault.Files('corrections_offenders_risk','did_public_qa').Key_Offenders_Vault, //Vault File
												 Vault.Files().Key_Offenders, //Source File 
												 Vault.Files().Key_Offenders_File, //Source File Name
												 Vault_Layout.Layout_Key_Offenders_Vault_Projected,  //Current Vault Layout																			
												 Vault.getJoinCondition(Vault.Files().Key_Offenders,[]), //Pass Source File & Exclusion Fields for join condition
												 Vault.GetCompareCondition(Vault.Files().Key_Offenders,Vault_Layout.Layout_Key_Offenders_Vault_Projected,[]), //Pass Source File, Child Rec location if any & Exclusion Fields
												 STD.Str.FindReplace(Vault.GetCompareCondition(Vault.Files().Key_Offenders,Vault_Layout.Layout_Key_Offenders_Vault_Projected,[]), 'vault_le.','vault_ri.'), //Pass Source File, Child Rec location if any & Exclusion Fields
												 Vault.Files('corrections_offenders_risk').base_prefix, //Vault base Prefix
												 'did_public_qa', //Vault base Suffix
												 (STRING)std.date.today(), //Current Date if building for today's date (or) Any previous date for catch up builds																			
												 'corrections_offenders_risk', //Source Vertical
												 'Offenders_Key_Build', // Email Address Subject
												 Vault.Constants.Key_Offenders_Risk, // Package Variable
												 Vault.Constants.Dops_RoxieIP //Roxie IP
												 );

END;
