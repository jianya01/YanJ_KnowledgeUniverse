#workunit('name', 'Testing_ClaimsDiscovery_Property');
#option('expandSelectCreateRow', true); // Added to improve overall compile time

IMPORT KELBlackBox, KELGlobal, SALT35, SALTRoutines, UT;

MaxResults := 250; // The maximum number of records to show in the workunit

TransactionIDs := DATASET([{568349}], {UNSIGNED TransactionID});

// Main SHELLs
OUTPUT(CHOOSEN(KELGlobal.S_Claims_Discovery_Property.Result(UID = TransactionIDs[1].TransactionID), MaxResults), NAMED('ClaimsDiscoveryProperty'));

/* Debugging Queries - Raw File Results */
OUTPUT(CHOOSEN(KELBlackBox.FileCLDPCleaned.FileCDPropertyCleaned(RecordIdentifier = TransactionIDs[1].TransactionID), MaxResults), NAMED('RawProperty'));
OUTPUT(CHOOSEN(KELBlackBox.FileCLDPCleaned.FileCDPropertySubjectID(RecordIdentifier = TransactionIDs[1].TransactionID), MaxResults), NAMED('RawSubjectID'));
OUTPUT(CHOOSEN(KELBlackBox.FileCLDPCleaned.FileCDPropertyRiskClaim(RecordIdentifier = TransactionIDs[1].TransactionID), MaxResults), NAMED('RawRiskClaims'));
OUTPUT(CHOOSEN(KELBlackBox.FileCLDPCleaned.FileCDPropertyRiskClaimPayments(RecordIdentifier = TransactionIDs[1].TransactionID), MaxResults), NAMED('RawRiskClaimsPayments'));
OUTPUT(CHOOSEN(KELBlackBox.FileCLDPCleaned.FileCDPropertyInsuredClaim(RecordIdentifier = TransactionIDs[1].TransactionID), MaxResults), NAMED('RawInsuredClaims'));
OUTPUT(CHOOSEN(KELBlackBox.FileCLDPCleaned.FileCDPropertyInsuredClaimPayments(RecordIdentifier = TransactionIDs[1].TransactionID), MaxResults), NAMED('RawInsuredClaimsPayments'));

/* Debugging Queries - KEL Results (NOTE: You must set #OPTION(persist, 0) in ClaimsAuto.kel before uncommenting these to run all at once, otherwise pick one and run) */
// OUTPUT(CHOOSEN(KELGlobal.Q_Claims_Discovery_Property_Search_Information(TransactionIDs[1].TransactionID).Res0, MaxResults), NAMED('SearchInformation'));
// OUTPUT(CHOOSEN(KELGlobal.Q_Claims_Discovery_Property_Risk_Claims(TransactionIDs[1].TransactionID).Res0, MaxResults), NAMED('RiskClaims'));
// OUTPUT(CHOOSEN(KELGlobal.Q_Claims_Discovery_Property_Insured_Claims(TransactionIDs[1].TransactionID).Res0, MaxResults), NAMED('InsuredClaims'));