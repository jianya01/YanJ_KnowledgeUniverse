EXPORT Constants := MODULE

EXPORT lDaliIP			:=	'10.194.90.202';
EXPORT lDaliAuditPath	:=	'/var/log/HPCCSystems/dali/audit';
// EXPORT lDaliServerPath	:=	'/var/log/HPCCSystems/dali/server';//serverlogs - WE DO NOT USE THESE
EXPORT Baseprefix 	:=	'~Vault::thor::dashboard';
EXPORT FBaseSuffix	:=	'Filelist';
EXPORT LBaseSuffix	:=	'Logfiles';
EXPORT dsThorFiles	:=	DATASET(Baseprefix+'::prod::'+FBaseSuffix,Layouts.FileStats, thor);
EXPORT dsVaultLogs	:=	DATASET(Baseprefix+'::prod::'+LBaseSuffix,Layouts.rTokens, thor);
EXPORT FileTypes := ['consumercredit' //1
										 ,'translogs'//2
										 ,'temp::kel'//3
										 ,'tobbacco'//4
										 ,'cdw'//5
										 ,'ar'//6
										 ,'insurance::prescreen'//7
										 ,'marketmagnifier'//8
										 ,'bankruptcy'//9
										 ,'publicrecord'//10
										 ,'clue_auto_batch'//11
										 ,'clueauto_poc'//12
										 ,'prospectsurvival'
										 ,'temp::i_'];//13
EXPORT EmailGroup := 'sheetal.garud@lexisnexisrisk.com';// Vault.Logistics@risk.lexisnexis.com';

EXPORT VaultThorSize := 500;
EXPORT ActualUsedSpaceThr := 450; //threshold
EXPORT uncompressedSpaceThr := 10; //threshold
					
END;