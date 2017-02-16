#workunit('name', 'Testing_CarrierDiscovery_Auto');
#option('expandSelectCreateRow', true); // Added to improve overall compile time

IMPORT KELBlackBox, KELGlobal, SALT35, SALTRoutines, UT;

MaxResults := 250; // The maximum number of records to show in the workunit

TransactionIDs := DATASET([{2951}], {UNSIGNED TransactionID});

// Main SHELLs
OUTPUT(CHOOSEN(KELGlobal.S_Carrier_Discovery_Auto.Result(UID = TransactionIDs[1].TransactionID), MaxResults), NAMED('CarrierDiscoveryAuto'));

/* Debugging Queries - Raw File Results */
OUTPUT(CHOOSEN(KELBlackBox.FileCarrierDiscoveryAutoNormalized.FileCDiscAutoRoot(RecordIdentifier = TransactionIDs[1].TransactionID), MaxResults), NAMED('RawAuto'));
OUTPUT(CHOOSEN(KELBlackBox.FileCarrierDiscoveryAutoNormalized.FileCDiscAutoGenMessages(RecordIdentifier = TransactionIDs[1].TransactionID), MaxResults), NAMED('RawGeneralMessages'));
OUTPUT(CHOOSEN(KELBlackBox.FileCarrierDiscoveryAutoNormalized.FileCDiscAutoAddInfo(RecordIdentifier = TransactionIDs[1].TransactionID), MaxResults), NAMED('RawAdditionalInfo'));

/* Debugging Queries - KEL Results (NOTE: You must set #OPTION(persist, 0) in ClaimsAuto.kel before uncommenting these to run all at once, otherwise pick one and run) */
// OUTPUT(CHOOSEN(KELGlobal.Q_Carrier_Discovery_Auto_Subject(TransactionIDs[1].TransactionID).Res0, MaxResults), NAMED('Subject'));
// OUTPUT(CHOOSEN(KELGlobal.Q_Carrier_Discovery_Auto_Recap(TransactionIDs[1].TransactionID).Res0, MaxResults), NAMED('Recap'));
// OUTPUT(CHOOSEN(KELGlobal.Q_Carrier_Discovery_Auto_Attachment(TransactionIDs[1].TransactionID).Res0, MaxResults), NAMED('Attachment')); 