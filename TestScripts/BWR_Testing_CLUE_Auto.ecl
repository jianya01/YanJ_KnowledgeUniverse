#workunit('name', 'Testing_CLUE_Auto');
#option('expandSelectCreateRow', true); // Added to improve overall compile time

IMPORT KELBlackBox, KELGlobal, SALT35, SALTRoutines, UT;

MaxResults := 250; // The maximum number of records to show in the workunit

TransactionIDs := DATASET([{2951}], {UNSIGNED TransactionID}); // 2 unit recaps  1 inquiry recap

// Main SHELLs (NOTE: You must set #OPTION(persist, 0) in ClaimsAuto.kel before uncommenting these to run all at once, otherwise pick one and run)
OUTPUT(CHOOSEN(KELGlobal.S_C_L_U_E_Auto.Result(UID = TransactionIDs[1].TransactionID), MaxResults), NAMED('CLUEAuto'));

// OUTPUT(CHOOSEN(KELGlobal.S_C_L_U_E_Auto_State_Farm.Result(UID = TransactionIDs[1].TransactionID), MaxResults), NAMED('CLUEAutoStateFarm'));

/* Debugging Queries - Raw File Results */
OUTPUT(CHOOSEN(KELBlackBox.FileCLUECleaned.FileCLUEAutoCleaned(RecordIdentifier = TransactionIDs[1].TransactionID), MaxResults), NAMED('RawAuto'));
OUTPUT(CHOOSEN(KELBlackBox.FileCLUECleaned.FileCLUEAutoSubjectID(RecordIdentifier = TransactionIDs[1].TransactionID), MaxResults), NAMED('RawAutoSubjectID'));
OUTPUT(CHOOSEN(KELBlackBox.FileCLUECleaned.FileCLUEAutoClaim(RecordIdentifier = TransactionIDs[1].TransactionID), MaxResults), NAMED('RawAutoClaims'));
OUTPUT(CHOOSEN(KELBlackBox.FileCLUECleaned.FileCLUEAutoPayments(RecordIdentifier = TransactionIDs[1].TransactionID), MaxResults), NAMED('RawAutoClaimsPayments'));
OUTPUT(CHOOSEN(KELBlackBox.FileCLUECleaned.FileCLUEAutoUnitRecap(RecordIdentifier = TransactionIDs[1].TransactionID), MaxResults), NAMED('RawAutoUnitRecap'));

/* Debugging Queries - KEL Results (NOTE: You must set #OPTION(persist, 0) in ClaimsAuto.kel before uncommenting these to run all at once, otherwise pick one and run) */
// OUTPUT(CHOOSEN(KELGlobal.Q_C_L_U_E_Auto_Subject_I_D(TransactionIDs[1].TransactionID).Res0, MaxResults), NAMED('SubjectID'));
// OUTPUT(CHOOSEN(KELGlobal.Q_C_L_U_E_Auto_Claim(TransactionIDs[1].TransactionID).Res0, MaxResults), NAMED('Claim'));
// OUTPUT(CHOOSEN(KELGlobal.Q_C_L_U_E_Auto_Recap(TransactionIDs[1].TransactionID).Res0, MaxResults), NAMED('Recap'));