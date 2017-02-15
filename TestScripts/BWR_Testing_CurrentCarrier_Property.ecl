#workunit('name', 'Testing_CurrentCarrier_Property');
#option('expandSelectCreateRow', true); // Added to improve overall compile time

IMPORT KELBlackBox, KELGlobal, SALT35, SALTRoutines, UT;

MaxResults := 250; // The maximum number of records to show in the workunit

TransactionIDs := DATASET([{2951}], {UNSIGNED TransactionID});

// Main SHELLs
OUTPUT(CHOOSEN(KELGlobal.S_Current_Carrier_Property.Result(UID = TransactionIDs[1].TransactionID), MaxResults), NAMED('CurrentCarrierProperty'));

/* Debugging Queries - Raw File Results */
OUTPUT(CHOOSEN(KELBlackBox.FileCurrentCarrierPropNormalized.FileCCPropertyRoot(RecordIdentifier = TransactionIDs[1].TransactionID), MaxResults), NAMED('RawProperty'));
OUTPUT(CHOOSEN(KELBlackBox.FileCurrentCarrierPropNormalized.FileCCPropSubIDSets(RecordIdentifier = TransactionIDs[1].TransactionID), MaxResults), NAMED('RawSubject'));
OUTPUT(CHOOSEN(KELBlackBox.FileCurrentCarrierPropNormalized.FileCCPropSubjectRecap(RecordIdentifier = TransactionIDs[1].TransactionID), MaxResults), NAMED('RawRecap'));
OUTPUT(CHOOSEN(KELBlackBox.FileCurrentCarrierPropNormalized.FileCCPropAttachmentSect(RecordIdentifier = TransactionIDs[1].TransactionID), MaxResults), NAMED('RawAttachment'));

/* Debugging Queries - KEL Results (NOTE: You must set #OPTION(persist, 0) in ClaimsAuto.kel before uncommenting these to run all at once, otherwise pick one and run) */
// OUTPUT(CHOOSEN(KELGlobal.Q_Current_Carrier_Property_Subject(TransactionIDs[1].TransactionID).Res0, MaxResults), NAMED('Subject'));
// OUTPUT(CHOOSEN(KELGlobal.Q_Current_Carrier_Property_Recap(TransactionIDs[1].TransactionID).Res0, MaxResults), NAMED('Recap'));
// OUTPUT(CHOOSEN(KELGlobal.Q_Current_Carrier_Property_Attachment(TransactionIDs[1].TransactionID).Res0, MaxResults), NAMED('Attachment')); 