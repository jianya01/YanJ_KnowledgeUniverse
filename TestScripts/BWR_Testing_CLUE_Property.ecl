#workunit('name', 'Testing_CLUE_Property');
#option('expandSelectCreateRow', true); // Added to improve overall compile time

IMPORT KELBlackBox, KELGlobal, SALT35, SALTRoutines, UT;

MaxResults := 250; // The maximum number of records to show in the workunit

// TransactionIDs := DATASET([{280}], {UNSIGNED TransactionID}); // 3 Risk Claims
TransactionIDs := DATASET([{29490}], {UNSIGNED TransactionID}); // 25 Risk Claims
// TransactionIDs := DATASET([{1115333}], {UNSIGNED TransactionID}); // 1 Risk Claim, 25 Insured Claims

// Main SHELLs
OUTPUT(CHOOSEN(KELGlobal.S_C_L_U_E_Property.Result(UID = TransactionIDs[1].TransactionID), MaxResults), NAMED('CLUEProperty'));

OUTPUT(CHOOSEN(KELGlobal.S_C_L_U_E_Property_State_Farm.Result(UID = TransactionIDs[1].TransactionID), MaxResults), NAMED('CLUEPropertyStateFarm'));

/* Debugging Queries - Raw File Results */
OUTPUT(CHOOSEN(KELBlackBox.FileCLUECleaned.FileCLUEPropertyCleaned(RecordIdentifier = TransactionIDs[1].TransactionID), MaxResults), NAMED('RawProperty'));
OUTPUT(CHOOSEN(KELBlackBox.FileCLUECleaned.FileCLUEPropertySubjectID(RecordIdentifier = TransactionIDs[1].TransactionID), MaxResults), NAMED('RawSubjectID'));
OUTPUT(CHOOSEN(KELBlackBox.FileCLUECleaned.FileCLUEPropertyRiskClaim(RecordIdentifier = TransactionIDs[1].TransactionID), MaxResults), NAMED('RawRiskClaims'));
OUTPUT(CHOOSEN(KELBlackBox.FileCLUECleaned.FileCLUEPropertyRiskClaimPayments(RecordIdentifier = TransactionIDs[1].TransactionID), MaxResults), NAMED('RawRiskClaimsPayments'));
OUTPUT(CHOOSEN(KELBlackBox.FileCLUECleaned.FileCLUEPropertyInsuredClaim(RecordIdentifier = TransactionIDs[1].TransactionID), MaxResults), NAMED('RawInsuredClaims'));
OUTPUT(CHOOSEN(KELBlackBox.FileCLUECleaned.FileCLUEPropertyInsuredClaimPayments(RecordIdentifier = TransactionIDs[1].TransactionID), MaxResults), NAMED('RawInsuredClaimsPayments'));

/* Debugging Queries - KEL Results (NOTE: You must set #OPTION(persist, 0) in ClaimsAuto.kel before uncommenting these to run all at once, otherwise pick one and run) */
OUTPUT(CHOOSEN(KELGlobal.Q_C_L_U_E_Property_Search_Information(TransactionIDs[1].TransactionID).Res0, MaxResults), NAMED('SearchInformation'));
OUTPUT(CHOOSEN(KELGlobal.Q_C_L_U_E_Property_Risk_Claims(TransactionIDs[1].TransactionID).Res0, MaxResults), NAMED('RiskClaims'));
OUTPUT(CHOOSEN(KELGlobal.Q_C_L_U_E_Property_Insured_Claims(TransactionIDs[1].TransactionID).Res0, MaxResults), NAMED('InsuredClaims'));