
 set of string ids := ['0F07E5ACC0X10136','0F07E5ACC0X10464','0F07E5ACC0X12211','0F07E5ACC0X10521','10369655R834596','0F07E5ACC0X15621','0F07E5ACC0X17362','0F07E5ACC0X18082'];//
 EXPORT Source :=  project(CCtlogPol.Constants.Sourcefile(transaction_id in ids), transform(CCtlogPol.Layout_Vault, 
   																																								SELF.vault_date_first_seen := (UNSIGNED4)WORKUNIT[2..9];
   																																								SELF.vault_date_last_seen := 	0;
   																																								SELF.vault_rid := 	0;
																																									SELF.vault_UID_Hash := HASH64(LEFT.transaction_id,LEFT.sequence,LEFT.date_added);
   																																								SELF := LEFT;
   																																								SELF:=[];
   																																								));
																																									
