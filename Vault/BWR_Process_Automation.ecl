IMPORT Vault, Vault_layout, UT, STD;

Vault.Process_Automation(Vault.Files('offenders_public').PublicRecord_Offenders_Vault, //Vault File
												 Vault.Files().PublicRecord_Offenders, //Source File 
												 Vault.Files().PublicRecord_Offenders_File, //Source File Name
												 Vault_Layout.Layout_PublicRecord_Offenders_Public_Vault,  //Current Vault Layout																			
												 Vault.getJoinCondition(Vault.Files().PublicRecord_Offenders,[]), //Pass Source File & Exclusion Fields for join condition
												 Vault.GetCompareCondition(Vault.Files().PublicRecord_Offenders,'',[]), //Pass Source File, Child Rec location if any & Exclusion Fields
												 STD.Str.FindReplace(Vault.GetCompareCondition(Vault.Files().PublicRecord_Offenders,'',[]), 'vault_le.','vault_ri.'), //Pass Source File, Child Rec location if any & Exclusion Fields
												 Vault.Files().base_prefix, //Vault base Prefix
												 'offenders_public', //Vault base Suffix
												 ut.getdate, //Current Date if building for today's date (or) Any previous date for catch up builds																			
												 'Vault_PublicRecord', //Strata Base qualifier
												 'Bimonthly', //Strata Frequency 
												 'publicrecord', //Source Vertical
												 'Vault Public Record Offenders Public', // Email Address Subject
												 Vault.Constants.PublicRecord_Offenders_Public_pkg_Var, // Package Variable
												 Vault.Constants.Dops_RoxieIP //Roxie IP
												 );