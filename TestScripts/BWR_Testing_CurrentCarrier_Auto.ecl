#workunit('name', 'Testing_CurrentCarrier_Auto');
#option('expandSelectCreateRow', true); // Added to improve overall compile time

IMPORT KELBlackBox, KELGlobal, SALT35, SALTRoutines, UT;

MaxResults := 250; // The maximum number of records to show in the workunit

TransactionIDs := DATASET([{2951}], {UNSIGNED TransactionID});

// Main SHELLs
OUTPUT(CHOOSEN(KELGlobal.S_Current_Carrier_Auto.Result(UID = TransactionIDs[1].TransactionID), MaxResults), NAMED('CurrentCarrierAuto'));

/* Debugging Queries - Raw File Results */
OUTPUT(CHOOSEN(KELBlackBox.FileCurrentCarrierAutoNormalized.FileCCAutoRoot(RecordIdentifier = TransactionIDs[1].TransactionID), MaxResults), NAMED('RawAuto'));
OUTPUT(CHOOSEN(KELBlackBox.FileCurrentCarrierAutoNormalized.FileCCAutoSubIDSets(RecordIdentifier = TransactionIDs[1].TransactionID), MaxResults), NAMED('RawSubject'));
OUTPUT(CHOOSEN(KELBlackBox.FileCurrentCarrierAutoNormalized.FileCCAutoSubjectRecap(RecordIdentifier = TransactionIDs[1].TransactionID), MaxResults), NAMED('RawRecap'));
OUTPUT(CHOOSEN(KELBlackBox.FileCurrentCarrierAutoNormalized.FileCCAutoAttachmentSect(RecordIdentifier = TransactionIDs[1].TransactionID), MaxResults), NAMED('RawAttachment'));

/* Debugging Queries - KEL Results (NOTE: You must set #OPTION(persist, 0) in ClaimsAuto.kel before uncommenting these to run all at once, otherwise pick one and run) */
OUTPUT(CHOOSEN(KELGlobal.Q_Current_Carrier_Auto_Subject(TransactionIDs[1].TransactionID).Res0, MaxResults), NAMED('Subject'));
OUTPUT(CHOOSEN(KELGlobal.Q_Current_Carrier_Auto_Recap(TransactionIDs[1].TransactionID).Res0, MaxResults), NAMED('Recap'));
OUTPUT(CHOOSEN(KELGlobal.Q_Current_Carrier_Auto_Attachment(TransactionIDs[1].TransactionID).Res0, MaxResults), NAMED('Attachment')); 