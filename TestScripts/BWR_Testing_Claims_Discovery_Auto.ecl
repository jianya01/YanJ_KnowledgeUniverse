#workunit('name', 'Testing_ClaimsDiscovery_Auto');
#option('expandSelectCreateRow', true); // Added to improve overall compile time

IMPORT KELBlackBox, KELGlobal, SALT35, SALTRoutines, UT;

MaxResults := 250; // The maximum number of records to show in the workunit

TransactionIDs := DATASET([{965370}], {UNSIGNED TransactionID}); // 2 unit recaps  1 inquiry recap

// Main SHELL
OUTPUT(CHOOSEN(KELGlobal.S_Claims_Discovery_Auto.Result(UID = TransactionIDs[1].TransactionID), MaxResults), NAMED('ClaimsDiscoveryAuto'));

/* Debugging Queries - Raw File Results */
OUTPUT(CHOOSEN(KELBlackBox.FileCLDACleaned.FileCDAutoCleaned(RecordIdentifier = TransactionIDs[1].TransactionID), MaxResults), NAMED('RawAuto'));
OUTPUT(CHOOSEN(KELBlackBox.FileCLDACleaned.FileCDAutoSubjectID(RecordIdentifier = TransactionIDs[1].TransactionID), MaxResults), NAMED('RawAutoSubjectID'));
OUTPUT(CHOOSEN(KELBlackBox.FileCLDACleaned.FileCDAutoClaim(RecordIdentifier = TransactionIDs[1].TransactionID), MaxResults), NAMED('RawAutoClaims'));
OUTPUT(CHOOSEN(KELBlackBox.FileCLDACleaned.FileCDAutoPayments(RecordIdentifier = TransactionIDs[1].TransactionID), MaxResults), NAMED('RawAutoClaimsPayments'));
OUTPUT(CHOOSEN(KELBlackBox.FileCLDACleaned.FileCDAutoUnitRecap(RecordIdentifier = TransactionIDs[1].TransactionID), MaxResults), NAMED('RawAutoUnitRecap'));

/* Debugging Queries - KEL Results (NOTE: You must set #OPTION(persist, 0) in ClaimsAuto.kel before uncommenting these to run all at once, otherwise pick one and run) */
// OUTPUT(CHOOSEN(KELGlobal.Q_Claims_Discovery_Auto_Subject_I_D(TransactionIDs[1].TransactionID).Res0, MaxResults), NAMED('SubjectID'));
// OUTPUT(CHOOSEN(KELGlobal.Q_Claims_Discovery_Auto_Claim(TransactionIDs[1].TransactionID).Res0, MaxResults), NAMED('Claim'));
// OUTPUT(CHOOSEN(KELGlobal.Q_Claims_Discovery_Auto_Recap(TransactionIDs[1].TransactionID).Res0, MaxResults), NAMED('Recap'));