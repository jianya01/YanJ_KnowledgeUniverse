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


  EXPORT Key_ssn_table_qa := 
												  Vault.ProcessAutomation_V2(Vault.Files('key','death_master::fcra::qa::ssn_table_v4_filtered').Death_master_ssn_qa_Vault, //Vault File
												  Vault.Files().Death_master_ssn_qa, //Source File 
												  Vault.Files().Key_death_master_ssn_table_qa_File, //Source File Name
												  Vault_Layout.Layout_SSN_table_qa_vault_projected,  //Current Vault Layout																			
												  Vault.getJoinCondition(Vault.Files().Death_master_ssn_qa,[]), //Pass Source File & Exclusion Fields for join condition
												  Vault.GetCompareCondition(Vault.Files().Death_master_ssn_qa,Vault_Layout.Layout_SSN_table_qa_vault_projected,[]), //Pass Source File, Child Rec location if any & Exclusion Fields
                         	STD.Str.FindReplace(Vault.GetCompareCondition(Vault.Files().Death_master_ssn_qa,Vault_Layout.Layout_SSN_table_qa_vault_projected,[]), 'vault_le.','vault_ri.'), //Pass Source File, Child Rec location if any & Exclusion Fields
												  Vault.Files('key').base_prefix, //Vault base Prefix
												  'death_master::fcra::qa::ssn_table_v4_filtered', //Vault base Suffix
												  (STRING)std.date.today(),  // Current Date if building for today's date (or) Any previous date for catch up builds('20180329'in this format)																		
												  'key', //Source Vertical
												 'death_master::fcra::qa::ssn_table_v4_filtered', // Email Address Subject
											    ' ', // Package Variable
												  ' ' //Roxie IP												 											 
												   );	


 EXPORT Key_adl_risk_table_qa := 
												  Vault.ProcessAutomation_V2(Vault.Files('key','death_master::fcra::qa::adl_risk_table_v4_filtered').Death_master_adl_risk_qa_Vault, //Vault File
												  Vault.Files().Death_master_adl_risk_qa, //Source File 
												  Vault.Files().Key_death_master_adl_risk_table_qa_File, //Source File Name
												  Vault_Layout.Layout_adl_risk_table_qa_vault_projected,  //Current Vault Layout																			
												  Vault.getJoinCondition(Vault.Files().Death_master_adl_risk_qa,[]), //Pass Source File & Exclusion Fields for join condition
												  Vault.GetCompareCondition(Vault.Files().Death_master_adl_risk_qa,Vault_Layout.Layout_adl_risk_table_qa_vault_projected,[]), //Pass Source File, Child Rec location if any & Exclusion Fields
	                        STD.Str.FindReplace(Vault.GetCompareCondition(Vault.Files().Death_master_adl_risk_qa,Vault_Layout.Layout_adl_risk_table_qa_vault_projected,[]), 'vault_le.','vault_ri.'), //Pass Source File, Child Rec location if any & Exclusion Fields
												  Vault.Files('key').base_prefix, //Vault base Prefix
												  'death_master::fcra::qa::adl_risk_table_v4_filtered', //Vault base Suffix
												  (STRING)std.date.today(),  // Current Date if building for today's date (or) Any previous date for catch up builds('20180329'in this format)																		
												  'key', //Source Vertical
												 'death_master::fcra::qa::adl_risk_table_v4_filtered', // Email Address Subject
												 ' ', // Package Variable
											   ' ' //Roxie IP												 										 
												 );	
	


 EXPORT Key_email_data_fcra_did := 
												 Vault.ProcessAutomation_V2(Vault.Files('key','email_data::fcra::qa::did').Key_email_data_Vault, //Vault File
												 Vault.Files().Key_email_data, //Source File 
												 Vault.Files().Key_email_data_did, //Source File Name
												 Vault_Layout.Layout_email_data_fcra_vault_projected,  //Current Vault Layout																			
												 Vault.getJoinCondition(Vault.Files().Key_email_data,[]), //Pass Source File & Exclusion Fields for join condition
												 Vault.GetCompareCondition(Vault.Files().Key_email_data,Vault_Layout.Layout_email_data_fcra_vault_projected,[]), //Pass Source File, Child Rec location if any & Exclusion Fields
												 STD.Str.FindReplace(Vault.GetCompareCondition(Vault.Files().Key_email_data,Vault_Layout.Layout_email_data_fcra_vault_projected,[]), 'vault_le.','vault_ri.'), //Pass Source File, Child Rec location if any & Exclusion Fields
												 Vault.Files('key').base_prefix, //Vault base Prefix
												 'email_data::fcra::qa::did', //Vault base Suffix
												 (STRING)std.date.today(), //Current Date if building for today's date (or) Any previous date for catch up builds																			
												 'key', //Source Vertical
												 'email_data::fcra::qa::did' ,// Email Address Subject
												 ' ', // Package Variable
												 ' ' //Roxie IP
												 );


EXPORT Key_liensv2_main_qa := 
												  Vault.ProcessAutomation_V2(Vault.Files('key','liensv2::main_qa').Liensv2_main_qa_Vault, //Vault File
												  Vault.Files().Liensv2_main_qa_Source, //Source File 
												  Vault.Files().Liensv2_main_qa_File, //Source File Name
												  Vault_Layout.Layout_liensv2_main_qa_vault,  //Current Vault Layout																			
												  Vault.getJoinCondition(Vault.Files().Liensv2_main_qa_Source,[]), //Pass Source File & Exclusion Fields for join condition
												  Vault.GetCompareCondition(Vault.Files().Liensv2_main_qa_Source,Vault_Layout.Layout_liensv2_main_qa_vault,[]), //Pass Source File, Child Rec location if any & Exclusion Fields
												  STD.Str.FindReplace(Vault.GetCompareCondition(Vault.Files().Liensv2_main_qa_Source,Vault_Layout.Layout_liensv2_main_qa_vault,[]), 'vault_le.','vault_ri.'), //Pass Source File, Child Rec location if any & Exclusion Fields
												  Vault.Files('key').base_prefix, //Vault base Prefix
												  'liensv2::main_qa', //Vault base Suffix
												  (STRING)std.date.today(), // Current Date if building for today's date (or) Any previous date for catch up builds																			
												  'key', //Source Vertical
												  'liensv2::main_qa', // Email Address Subject	
												  ' ' , // Package Variable
												  ' ' //Roxie IP				 
												  );				


EXPORT Key_avm_v2_address  := 
												  Vault.ProcessAutomation_V2(Vault.Files('key','avm_v2::fcra::qa::address').Key_avm_v2_address_Vault, //Vault File
												  Vault.Files().Key_avm_v2_address_Source, //Source File 
												  Vault.Files().Key_avm_v2_fcra_address_file, //Source File Name
												  Vault_Layout.Layout_avm_v2_fcra_address_vault,  //Current Vault Layout																			
												  Vault.getJoinCondition(Vault.Files().Key_avm_v2_address_Source,[]), //Pass Source File & Exclusion Fields for join condition
												  Vault.GetCompareCondition(Vault.Files().Key_avm_v2_address_Source,Vault_Layout.Layout_avm_v2_fcra_address_vault,[]), //Pass Source File, Child Rec location if any & Exclusion Fields
												  STD.Str.FindReplace(Vault.GetCompareCondition(Vault.Files().Key_avm_v2_address_Source,Vault_Layout.Layout_avm_v2_fcra_address_vault,[]), 'vault_le.','vault_ri.'), //Pass Source File, Child Rec location if any & Exclusion Fields
												  Vault.Files('key').base_prefix, //Vault base Prefix
												  'avm_v2::fcra::qa::address', //Vault base Suffix
												  (STRING)std.date.today(), // Current Date if building for today's date (or) Any previous date for catch up builds																			
												  'key', //Source Vertical
												  'avm_v2::fcra::qa::address', // Email Address Subject	
												  ' ' , // Package Variable
												  ' ' //Roxie IP				 
												  );				


EXPORT Key_avm_v2_medians  := 
												  Vault.ProcessAutomation_V2(Vault.Files('key','avm_v2::fcra::qa::medians').Key_avm_v2_medians_Vault, //Vault File
												  Vault.Files().Key_avm_v2_medians_Source, //Source File 
												  Vault.Files().Key_avm_v2_fcra_medians_file, //Source File Name
												  Vault_Layout.Layout_avm_v2_fcra_medians_Vault,  //Current Vault Layout																			
												  Vault.getJoinCondition(Vault.Files().Key_avm_v2_medians_Source,[]), //Pass Source File & Exclusion Fields for join condition
												  Vault.GetCompareCondition(Vault.Files().Key_avm_v2_medians_Source,Vault_Layout.Layout_avm_v2_fcra_medians_Vault,[]), //Pass Source File, Child Rec location if any & Exclusion Fields
												  STD.Str.FindReplace(Vault.GetCompareCondition(Vault.Files().Key_avm_v2_medians_Source,Vault_Layout.Layout_avm_v2_fcra_medians_Vault,[]), 'vault_le.','vault_ri.'), //Pass Source File, Child Rec location if any & Exclusion Fields
												  Vault.Files('key').base_prefix, //Vault base Prefix
												  'avm_v2::fcra::qa::medians', //Vault base Suffix
												  (STRING)std.date.today(), // Current Date if building for today's date (or) Any previous date for catch up builds																			
												  'key', //Source Vertical
												  'avm_v2::fcra::qa::medians', // Email Address Subject	
												  ' ' , // Package Variable
												  ' ' //Roxie IP				 
												  );				
	
EXPORT Key_inquiry_table_fcra_did_qa := 
												  Vault.ProcessAutomation_V2(Vault.Files('key','inquiry_table::fcra::did_qa').Key_inquiry_table_did_qa_Vault, //Vault File
												  Vault.Files().Key_inquiry_table_did_qa, //Source File 
												  Vault.Files().Key_inquiry_table_fcra_did_qa_File, //Source File Name
												  Vault_Layout.Layout_inquiry_table_did_qa_Vault_Projected,  //Current Vault Layout																			
												  Vault.getJoinCondition(Vault.Files().Key_inquiry_table_did_qa,[]), //Pass Source File & Exclusion Fields for join condition
												  Vault.GetCompareCondition(Vault.Files().Key_inquiry_table_did_qa,Vault_Layout.Layout_inquiry_table_did_qa_Vault_Projected,[]), //Pass Source File, Child Rec location if any & Exclusion Fields
	                        STD.Str.FindReplace(Vault.GetCompareCondition(Vault.Files().Key_inquiry_table_did_qa,Vault_Layout.Layout_inquiry_table_did_qa_Vault_Projected,[]), 'vault_le.','vault_ri.'), //Pass Source File, Child Rec location if any & Exclusion Fields
												  Vault.Files('key').base_prefix, //Vault base Prefix
												  'inquiry_table::fcra::did_qa', //Vault base Suffix
												  (STRING)std.date.today(),  // Current Date if building for today's date (or) Any previous date for catch up builds('20180329'in this format)																		
												  'key', //Source Vertical
												 'inquiry_table::fcra::did_qa', // Email Address Subject
												 ' ', // Package Variable
											   ' ' //Roxie IP												 										 
												 );	


EXPORT Key_corrections_offenders_fcra_bocashell_did  := 
												  Vault.ProcessAutomation_V2(Vault.Files('key','corrections_offenders_fcra_bocashell_did').Key_corrections_offenders_bocashell_did_Vault, //Vault File
												  Vault.Files().Key_corrections_offenders_bocashell_did_Source, //Source File 
												  Vault.Files().Key_corrections_offenders_fcra_bocashell_did_File, //Source File Name
												  Vault_Layout.Layout_corrections_offenders_bocashell_did_vault,  //Current Vault Layout																			
												  Vault.getJoinCondition(Vault.Files().Key_corrections_offenders_bocashell_did_Source,[]), //Pass Source File & Exclusion Fields for join condition
												  Vault.GetCompareCondition(Vault.Files().Key_corrections_offenders_bocashell_did_Source,Vault_Layout.Layout_corrections_offenders_bocashell_did_vault,[]), //Pass Source File, Child Rec location if any & Exclusion Fields
												  STD.Str.FindReplace(Vault.GetCompareCondition(Vault.Files().Key_corrections_offenders_bocashell_did_Source,Vault_Layout.Layout_corrections_offenders_bocashell_did_vault,[]), 'vault_le.','vault_ri.'), //Pass Source File, Child Rec location if any & Exclusion Fields
												  Vault.Files('key').base_prefix, //Vault base Prefix
												  'corrections_offenders_fcra_bocashell_did', //Vault base Suffix
												  (STRING)std.date.today(), // Current Date if building for today's date (or) Any previous date for catch up builds																			
												  'key', //Source Vertical
												  'corrections_offenders_fcra_bocashell_did', // Email Address Subject	
												  ' ' , // Package Variable
												  ' ' //Roxie IP				 
												  );				
	
	
END;
