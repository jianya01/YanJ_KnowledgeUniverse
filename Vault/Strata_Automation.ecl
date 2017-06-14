IMPORT STRATA, OrbitSOA, Vault_Layout;

EXPORT Strata_Automation(pVaultFile, pCurrent_Date, pYesterday, pBaseSuffix, pStrataBase, pStrataFrequency) := FUNCTIONMACRO

	Filedate := WORKUNIT[2..9] + WORKUNIT[11..16];
	
	InputDate := (STRING8)pCurrent_Date;
	
	Strata_Log := DATASET([{InputDate[1..4] + '-' + InputDate[5..6] + '-' + InputDate[7..8],
						/*totalcount*/  COUNT(pVaultFile),
						/*currentbuild*/COUNT(pVaultFile(Vault_Active_Flag = 'Y')),
						/*expired*/			COUNT(pVaultFile(Vault_Active_Flag = 'N' AND vault_date_last_seen = pYesterday)), 
						/*new*/					COUNT(pVaultFile(Vault_Active_Flag = 'Y' AND vault_date_first_seen = pCurrent_Date AND vault_date_last_seen = pCurrent_Date)),
						/*updated*/			COUNT(pVaultFile(Vault_Active_Flag = 'Y' AND vault_date_first_seen <> pCurrent_Date AND vault_date_last_seen = pCurrent_Date))}],
													Vault_Layout.Layout_Strata_Automation);
													
  tStrataStats := CHOOSEN(Strata_Log, 1);
	
  STRATA.createXMLStats(tStrataStats, pStrataBase, pBaseSuffix, Filedate, Vault.EmailAddresses.Vault_EmailAddresses, zStats, 'View', pStrataFrequency, 'StrataI');
  
	zOrbit := OUTPUT(OrbitSOA.StrataSubmitStat(OrbitSOA.GetToken('Insurance')[1..36], pStrataBase, pBaseSuffix, pStrataFrequency, 'View', WORKUNIT, Filedate, 'Insurance'));
															
	RETURN SEQUENTIAL(zStats, zOrbit);
										
ENDMACRO;                                                                                