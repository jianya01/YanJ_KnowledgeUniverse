#workunit('name', 'Testing_CLUE_Property');
#option('expandSelectCreateRow', true); // Added to improve overall compile time

IMPORT KELBlackBox, KELGlobal, SALT35, SALTRoutines, UT;

MaxResults := 250; // The maximum number of records to show in the workunit

// CLUETransactionID := 280; // 3 Risk Claims
//CLUETransactionID := 29490; // 25 Risk Claims
 CLUETransactionID := 1115333; // 1 Risk Claim, 25 Insured Claims

RawProperty := KELBlackBox.FileCLUECleaned.FileCLUEPropertyCleaned(RecordIdentifier = CLUETransactionID);
PropertyEntity := KELGlobal.Q_C_L_U_E_Property_Result(CLUETransactionID).Res0;
PropertyAll := KELGlobal.Q_Dump_C_L_U_E_Property_Result.Res0;
OUTPUT(CHOOSEN(RawProperty, MaxResults), NAMED('RawProperty'));
OUTPUT(CHOOSEN(PropertyEntity, MaxResults), NAMED('PropertyEntity'));
OUTPUT(CHOOSEN(PropertyAll, MaxResults), NAMED('PropertyAll'));

RawPropertySearchInfo := KELBlackBox.FileCLUECleaned.FileCLUEPropertySubjectID(RecordIdentifier = CLUETransactionID);
PropertySearchInfoEntity := KELGlobal.Q_C_L_U_E_Property_Search_Information(CLUETransactionID).Res0;
PropertySearchInfoAll := KELGlobal.Q_Dump_C_L_U_E_Property_Search_Information.Res0;
OUTPUT(CHOOSEN(RawPropertySearchInfo, MaxResults), NAMED('RawPropertySearchInfo'));
OUTPUT(CHOOSEN(PropertySearchInfoEntity, MaxResults), NAMED('PropertySearchInfoEntity'));
OUTPUT(CHOOSEN(PropertySearchInfoAll, MaxResults), NAMED('PropertySearchInfoAll'));

RawPropertyRiskClaims := KELBlackBox.FileCLUECleaned.FileCLUEPropertyRiskClaim(RecordIdentifier = CLUETransactionID);
RawPropertyRiskClaimsPayments := KELBlackBox.FileCLUECleaned.FileCLUEPropertyRiskClaimPayments(RecordIdentifier = CLUETransactionID);
PropertyRiskClaimsEntity := KELGlobal.Q_C_L_U_E_Property_Risk_Claim(CLUETransactionID).Res0;
PropertyRiskClaimsAll := KELGlobal.Q_Dump_C_L_U_E_Property_Risk_Claim.Res0;
OUTPUT(CHOOSEN(RawPropertyRiskClaims, MaxResults), NAMED('RawPropertyRiskClaims'));
OUTPUT(CHOOSEN(RawPropertyRiskClaimsPayments, MaxResults), NAMED('RawPropertyRiskClaimsPayments'));
OUTPUT(CHOOSEN(PropertyRiskClaimsEntity, MaxResults), NAMED('PropertyRiskClaimsEntity'));
OUTPUT(CHOOSEN(PropertyRiskClaimsAll, MaxResults), NAMED('PropertyRiskClaimsAll'));

RawPropertyInsuredClaims := KELBlackBox.FileCLUECleaned.FileCLUEPropertyInsuredClaim(RecordIdentifier = CLUETransactionID);
RawPropertyInsuredClaimsPayments := KELBlackBox.FileCLUECleaned.FileCLUEPropertyInsuredClaimPayments(RecordIdentifier = CLUETransactionID);
PropertyInsuredClaimsEntity := KELGlobal.Q_C_L_U_E_Property_Insured_Claim(CLUETransactionID).Res0;
PropertyInsuredClaimsAll := KELGlobal.Q_Dump_C_L_U_E_Property_Insured_Claim.Res0;
OUTPUT(CHOOSEN(RawPropertyInsuredClaims, MaxResults), NAMED('RawPropertyInsuredClaims'));
OUTPUT(CHOOSEN(RawPropertyInsuredClaimsPayments, MaxResults), NAMED('RawPropertyInsuredClaimsPayments'));
OUTPUT(CHOOSEN(PropertyInsuredClaimsEntity, MaxResults), NAMED('PropertyInsuredClaimsEntity'));
OUTPUT(CHOOSEN(PropertyInsuredClaimsAll, MaxResults), NAMED('PropertyInsuredClaimsAll'));