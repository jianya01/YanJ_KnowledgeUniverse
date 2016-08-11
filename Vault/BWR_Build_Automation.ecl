Vault.Build_Automation(Vault.Files('publicrecord', 'automationtest').Automationtest_Vault, //Vault File
											 Vault.Files().Automationtest, //Source File 
											 Vault.Files().Automationtest_File, //Source File Name
											 Vault_Layout.Layout_Automation_Vault,  //Current Vault Layout																			
											 Vault.getJoinCondition(Vault.Files().Automationtest,[]), //Pass Source File & Exclusion Fields for join condition
											 Vault.GetCompareCondition(Vault.Files().Automationtest, 'Vault_Layout.Layout_Automation', []), //Pass Source File, Child Rec location if any & Exclusion Fields
											 STD.Str.FindReplace(Vault.GetCompareCondition(Vault.Files().Automationtest, 'Vault_Layout.Layout_Automation', []), 'vault_le.','vault_ri.'), //Pass Source File, Child Rec location if any & Exclusion Fields
											 Vault.Files('publicrecord').base_prefix, //Vault base Prefix
											 'AutomationTest', //Vault base Suffix
											 ut.getdate, //Current Date if building for today's date (or) Any previous date for catch up builds																			
											 'Vault_PublicRecord', //Strata Base qualifier
											 'Daily', //Strata Frequency 
											 'publicrecord', //Source Vertical
											 'Vault Public Record Automation test' // Email Address Subject
											 );