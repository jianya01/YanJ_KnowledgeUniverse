IMPORT STD;
EXPORT Build_Alert := FUNCTION

	Vault_Dataenh_Translog_Online := NOTHOR(STD.System.Workunit.WorkunitList('',
														NAMED jobname := 'Vault Dataenh Transaction Log Online*'));
	Vault_Dataenh_Translog := NOTHOR(STD.System.Workunit.WorkunitList('',
														NAMED jobname := 'Vault Dataenh Transaction Log*'));
	Vault_Dataenh_transaction_log_batch := NOTHOR(STD.System.Workunit.WorkunitList('',
														NAMED jobname := 'Vault Dataenh Transaction Log Batch*'));

	Layout := RECORD
	STRING Date;
	STRING Name;
	BOOLEAN Value;
	END;

	WU_Dataset  := DATASET([{std.date.today(),'Vault_Dataenh_Translog_Online',
																	Vault_Dataenh_Translog_Online[1].WUID[2..9] = (STRING)std.date.today() AND Vault_Dataenh_Translog_Online[1].state='completed'},
													{std.date.today(),'Vault_Dataenh_Translog',
																	Vault_Dataenh_Translog[1].WUID[2..9] = (STRING)std.date.today() AND Vault_Dataenh_Translog[1].state='completed'},
													{std.date.today(),'Vault_Dataenh_transaction_log_batch',
																	Vault_Dataenh_transaction_log_batch[1].WUID[2..9] = (STRING)std.date.today() AND Vault_Dataenh_transaction_log_batch[1].state='completed'}
												 ],Layout)(Value = FALSE);
			
	prj_validation := PROJECT(WU_Dataset, 
										TRANSFORM({RECORDOF(WU_Dataset),STRING txt},
										SELF.txt := LEFT.Name;
										SELF:=LEFT));

	RECORDOF(prj_validation) lay_rollup(RECORDOF(prj_validation) L ,RECORDOF(prj_validation) R) := TRANSFORM
							SELF.txt := L.txt+'\n\n'+R.txt+'\n';
							SELF := R;
	END;

	RolledupTestCases := ROLLUP(prj_validation, LEFT.Date = RIGHT.Date, lay_rollup(LEFT,RIGHT)); 

	subject   := 'WorkUnit Alert' ;
	body      := 'The following builds were not found/completed '  +'\n\n'+
							 'Builds : '+'\n'+(STRING)RolledupTestCases[1].txt+'\n\n';
							 
	Email		  := STD.System.Email.SendEmail('Vault.Logistics@risk.lexisnexis.com',subject,body);
	
	RETURN IF(COUNT(WU_Dataset)>0,Email);
	
END;
