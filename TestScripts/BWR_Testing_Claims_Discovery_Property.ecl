#workunit('name', 'Testing_ClaimsDiscovery_Property');
#option('expandSelectCreateRow', true); // Added to improve overall compile time

IMPORT KELBlackBox, KELGlobal, SALT35, SALTRoutines, UT;

MaxResults := 250; // The maximum number of records to show in the workunit

ClaimsDiscoveryTransactionID := 568349;

RawProperty := KELBlackBox.FileCLDPCleaned.FileCDPropertyCleaned(RecordIdentifier = ClaimsDiscoveryTransactionID);
PropertyEntity := KELGlobal.Q_Claims_Discovery_Property_Result(ClaimsDiscoveryTransactionID).Res0;
PropertyAll := KELGlobal.Q_Dump_Claims_Discovery_Property_Result.Res0;
OUTPUT(CHOOSEN(RawProperty, MaxResults), NAMED('RawProperty'));
OUTPUT(CHOOSEN(PropertyEntity, MaxResults), NAMED('PropertyEntity'));
OUTPUT(CHOOSEN(PropertyAll, MaxResults), NAMED('PropertyAll'));

RawPropertySearchInfo := KELBlackBox.FileCLDPCleaned.FileCDPropertySubjectID(RecordIdentifier = ClaimsDiscoveryTransactionID);
PropertySearchInfoEntity := KELGlobal.Q_Claims_Discovery_Property_Search_Information(ClaimsDiscoveryTransactionID).Res0;
PropertySearchInfoAll := KELGlobal.Q_Dump_Claims_Discovery_Property_Search_Information.Res0;
OUTPUT(CHOOSEN(RawPropertySearchInfo, MaxResults), NAMED('RawPropertySearchInfo'));
OUTPUT(CHOOSEN(PropertySearchInfoEntity, MaxResults), NAMED('PropertySearchInfoEntity'));
OUTPUT(CHOOSEN(PropertySearchInfoAll, MaxResults), NAMED('PropertySearchInfoAll'));

RawPropertyRiskClaims := KELBlackBox.FileCLDPCleaned.FileCDPropertyRiskClaim(RecordIdentifier = ClaimsDiscoveryTransactionID);
RawPropertyRiskClaimsPayments := KELBlackBox.FileCLDPCleaned.FileCDPropertyRiskClaimPayments(RecordIdentifier = ClaimsDiscoveryTransactionID);
PropertyRiskClaimsEntity := KELGlobal.Q_Claims_Discovery_Property_Risk_Claim(ClaimsDiscoveryTransactionID).Res0;
PropertyRiskClaimsAll := KELGlobal.Q_Dump_Claims_Discovery_Property_Risk_Claim.Res0;
OUTPUT(CHOOSEN(RawPropertyRiskClaims, MaxResults), NAMED('RawPropertyRiskClaims'));
OUTPUT(CHOOSEN(RawPropertyRiskClaimsPayments, MaxResults), NAMED('RawPropertyRiskClaimsPayments'));
OUTPUT(CHOOSEN(PropertyRiskClaimsEntity, MaxResults), NAMED('PropertyRiskClaimsEntity'));
OUTPUT(CHOOSEN(PropertyRiskClaimsAll, MaxResults), NAMED('PropertyRiskClaimsAll'));

RawPropertyInsuredClaims := KELBlackBox.FileCLDPCleaned.FileCDPropertyInsuredClaim(RecordIdentifier = ClaimsDiscoveryTransactionID);
RawPropertyInsuredClaimsPayments := KELBlackBox.FileCLDPCleaned.FileCDPropertyInsuredClaimPayments(RecordIdentifier = ClaimsDiscoveryTransactionID);
PropertyInsuredClaimsEntity := KELGlobal.Q_Claims_Discovery_Property_Insured_Claim(ClaimsDiscoveryTransactionID).Res0;
PropertyInsuredClaimsAll := KELGlobal.Q_Dump_Claims_Discovery_Property_Insured_Claim.Res0;
// TestQuery := KELGlobal.Q_Claims_Discovery_Property_Insured_Claim_Additional_Name1(001).Res0;
OUTPUT(CHOOSEN(RawPropertyInsuredClaims, MaxResults), NAMED('RawPropertyInsuredClaims'));
OUTPUT(CHOOSEN(RawPropertyInsuredClaimsPayments, MaxResults), NAMED('RawPropertyInsuredClaimsPayments'));
OUTPUT(CHOOSEN(PropertyInsuredClaimsEntity, MaxResults), NAMED('PropertyInsuredClaimsEntity'));
OUTPUT(CHOOSEN(PropertyInsuredClaimsAll, MaxResults), NAMED('PropertyInsuredClaimsAll'));
// OUTPUT(CHOOSEN(TestQuery, MaxResults), NAMED('AdditionalNameTest'));