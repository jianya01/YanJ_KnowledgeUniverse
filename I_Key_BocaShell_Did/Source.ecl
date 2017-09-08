
 EXPORT Source :=  project(I_Key_BocaShell_Did.constants.Sourcefile, transform(I_Key_BocaShell_Did.Layout_Vault, 
   																																								SELF.vault_date_first_seen := 20170801;
   																																								SELF.vault_date_last_seen := 	0;
   																																								SELF.vault_rid := 	0;
																																									SELF.vault_UID_Hash := HASHMD5(left.did,left.criminal_count,left.last_criminal_date,left.felony_count,left.last_felony_date,left.criminal_count30,left.criminal_count90,left.criminal_count180,left.criminal_count12,left.criminal_count24,left.criminal_count36,left.criminal_count60,left.crim_case_num,left.arrests_count,left.date_last_arrest,left.arrests_count30,left.arrests_count90,left.arrests_count180,left.arrests_count12,left.arrests_count24,left.arrests_count36,left.arrests_count60
);
   																																								SELF := LEFT;
   																																								SELF:=[];
   																																								));
																																									
