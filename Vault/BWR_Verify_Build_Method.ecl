//W20160720-170747

Vault.Verify_Build_Method(Vault.Files_Verify_Build_Method().PublicRecord_Offenders_Public_Father, //Source Father File
												  Vault.Files_Verify_Build_Method().PublicRecord_Offenders_Public, //Source Father File
											    Vault.getJoinCondition(Vault.Files().PublicRecord_Offenders_Public,[]), //Pass Source File & Exclusion Fields for join condition
												  Vault.GetCompareCondition(Vault.Files().PublicRecord_Offenders_Public,'',[]), //Pass Source File, Child Rec location if any & Exclusion Fields
												  STD.Str.FindReplace(Vault.GetCompareCondition(Vault.Files().PublicRecord_Offenders_Public,'',[]), 'vault_le.','vault_ri.'), //Pass Source File, Child Rec location if any & Exclusion Fields
												  'offenders_public');