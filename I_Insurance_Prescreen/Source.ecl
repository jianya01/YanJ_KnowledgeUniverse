
 EXPORT Source :=  project(I_Insurance_Prescreen.constants.Sourcefile, transform(I_Insurance_Prescreen.Layout_Vault, 
   																																								SELF.vault_date_first_seen := 20170102;
   																																								SELF.vault_date_last_seen := 	0;
   																																								SELF.vault_rid := 	0;
																																									SELF.vault_UID_Hash := HASH64(LEFT.Lexid,LEFT.encrypted_pin);
   																																								SELF := LEFT;
   																																								SELF:=[];
   																																								));
																																									
