 // sourceFile:=DATASET('~foreign::10.194.12.1::base::dataenh::inquiry_history::qa::id' , DEInqHist.Layout_Source, thor);

 EXPORT Source :=  project(DEtranOL.Constants.Sourcefile, transform(DEtranOL.Layout_Vault, 
   																																								SELF.vault_date_first_seen := (UNSIGNED4)WORKUNIT[2..9];
   																																								SELF.vault_date_last_seen := 	0;
   																																								SELF.vault_rid := 	0;
   																																								SELF.vault_UID_Hash := HASH64(LEFT.transaction_id,LEFT.transaction_type,LEFT.date_added);
   																																								SELF := LEFT;
   																																								SELF:=[];
   																																								));
																																									
