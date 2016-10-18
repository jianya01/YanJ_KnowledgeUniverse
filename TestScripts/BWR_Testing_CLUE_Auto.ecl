#workunit('name', 'Testing_CLUE_Auto');
#option('expandSelectCreateRow', true); // Added to improve overall compile time

IMPORT KELBlackBox, KELGlobal, SALT35, SALTRoutines, UT;

MaxResults := 250; // The maximum number of records to show in the workunit


CLUETransactionID := 2951; // 2 unit recaps  1 inquiry recap


RawAuto := KELBlackBox.FileCLUECleaned.FileCLUEAutoCleaned(RecordIdentifier = CLUETransactionID);
AutoEntity := KELGlobal.Q_C_L_U_E_Auto(CLUETransactionID).Res0;
AutoAll := KELGlobal.Q_Dump_C_L_U_E_Auto.Res0;
OUTPUT(CHOOSEN(RawAuto, MaxResults), NAMED('RawAuto'));
OUTPUT(CHOOSEN(AutoEntity, MaxResults), NAMED('AutoEntity'));
OUTPUT(CHOOSEN(AutoAll, MaxResults), NAMED('AutoAll'));

RawAutoSubjectID := KELBlackBox.FileCLUECleaned.FileCLUEAutoSubjectID(RecordIdentifier = CLUETransactionID);
AutoSubjectInfoEntity := KELGlobal.Q_C_L_U_E_Auto_Subject_I_D(CLUETransactionID).Res0;
AutoSubjectInfoAll := KELGlobal.Q_Dump_C_L_U_E_Auto_Subject_I_D.Res0;
OUTPUT(CHOOSEN(RawAutoSubjectID, MaxResults), NAMED('RawAutoSubjectID'));
OUTPUT(CHOOSEN(AutoSubjectInfoEntity, MaxResults), NAMED('AutoSubjectInfoEntity'));
OUTPUT(CHOOSEN(AutoSubjectInfoAll, MaxResults), NAMED('AutoSubjectInfoAll'));


RawAutoClaims := KELBlackBox.FileCLUECleaned.FileCLUEAutoClaim(RecordIdentifier = CLUETransactionID);
RawAutoClaimsPayments := KELBlackBox.FileCLUECleaned.FileCLUEAutoPayments(RecordIdentifier = CLUETransactionID);
AutoClaimsEntity := KELGlobal.Q_C_L_U_E_Auto_Claim(CLUETransactionID).Res0;
AutoClaimsAll := KELGlobal.Q_Dump_C_L_U_E_Auto_Claim.Res0;
OUTPUT(CHOOSEN(RawAutoClaims, MaxResults), NAMED('RawAutoClaims'));
OUTPUT(CHOOSEN(RawAutoClaimsPayments, MaxResults), NAMED('RawAutoClaimsPayments'));
OUTPUT(CHOOSEN(AutoClaimsEntity, MaxResults), NAMED('AutoClaimsEntity'));
OUTPUT(CHOOSEN(AutoClaimsAll, MaxResults), NAMED('AutoClaimsAll'));


RawAutoUnitRecap := KELBlackBox.FileCLUECleaned.FileCLUEAutoUnitRecap(RecordIdentifier = CLUETransactionID);
AutoUnitRecapEntity := KELGlobal.Q_C_L_U_E_Auto_Recap(CLUETransactionID).Res0;
AutoUnitRecapAll := KELGlobal.Q_Dump_C_L_U_E_Auto_Recap.Res0;
OUTPUT(CHOOSEN(RawAutoUnitRecap, MaxResults), NAMED('RawAutoUnitRecap'));
OUTPUT(CHOOSEN(AutoUnitRecapEntity, MaxResults), NAMED('AutoUnitRecapEntity'));
OUTPUT(CHOOSEN(AutoUnitRecapAll, MaxResults), NAMED('AutoUnitRecapAll'));   


