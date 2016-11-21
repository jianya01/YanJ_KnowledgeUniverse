#workunit('name', 'Testing_ClaimsDiscovery_Auto');
#option('expandSelectCreateRow', true); // Added to improve overall compile time

IMPORT KELBlackBox, KELGlobal, SALT35, SALTRoutines, UT;

MaxResults := 250; // The maximum number of records to show in the workunit


// ClaimsDiscoveryTransactionID := 2951;
ClaimsDiscoveryTransactionID := 965370;

RawAuto := KELBlackBox.FileCLDACleaned.FileCDAutoCleaned(RecordIdentifier = ClaimsDiscoveryTransactionID);
AutoEntity := KELGlobal.Q_Claims_Discovery_Auto(ClaimsDiscoveryTransactionID).Res0;
AutoAll := KELGlobal.Q_Dump_Claims_Discovery_Auto.Res0;
OUTPUT(CHOOSEN(RawAuto, MaxResults), NAMED('RawAuto'));
OUTPUT(CHOOSEN(AutoEntity, MaxResults), NAMED('AutoEntity'));
OUTPUT(CHOOSEN(AutoAll, MaxResults), NAMED('AutoAll'));

RawAutoSubjectID := KELBlackBox.FileCLDACleaned.FileCDAutoSubjectID(RecordIdentifier = ClaimsDiscoveryTransactionID);
AutoSubjectInfoEntity := KELGlobal.Q_Claims_Discovery_Auto_Subject_I_D(ClaimsDiscoveryTransactionID).Res0;
AutoSubjectInfoAll := KELGlobal.Q_Dump_Claims_Discovery_Auto_Subject_I_D.Res0;
OUTPUT(CHOOSEN(RawAutoSubjectID, MaxResults), NAMED('RawAutoSubjectID'));
OUTPUT(CHOOSEN(AutoSubjectInfoEntity, MaxResults), NAMED('AutoSubjectInfoEntity'));
OUTPUT(CHOOSEN(AutoSubjectInfoAll, MaxResults), NAMED('AutoSubjectInfoAll'));


RawAutoClaims := KELBlackBox.FileCLDACleaned.FileCDAutoClaim(RecordIdentifier = ClaimsDiscoveryTransactionID);
RawAutoClaimsPayments := KELBlackBox.FileCLDACleaned.FileCDAutoPayments(RecordIdentifier = ClaimsDiscoveryTransactionID);
AutoClaimsEntity := KELGlobal.Q_Claims_Discovery_Auto_Claim(ClaimsDiscoveryTransactionID).Res0;
AutoClaimsAll := KELGlobal.Q_Dump_Claims_Discovery_Auto_Claim.Res0;
OUTPUT(CHOOSEN(RawAutoClaims, MaxResults), NAMED('RawAutoClaims'));
OUTPUT(CHOOSEN(RawAutoClaimsPayments, MaxResults), NAMED('RawAutoClaimsPayments'));
OUTPUT(CHOOSEN(AutoClaimsEntity, MaxResults), NAMED('AutoClaimsEntity'));
OUTPUT(CHOOSEN(AutoClaimsAll, MaxResults), NAMED('AutoClaimsAll'));


RawAutoUnitRecap := KELBlackBox.FileCLDACleaned.FileCDAutoUnitRecap(RecordIdentifier = ClaimsDiscoveryTransactionID);
AutoUnitRecapEntity := KELGlobal.Q_Claims_Discovery_Auto_Recap(ClaimsDiscoveryTransactionID).Res0;
AutoUnitRecapAll := KELGlobal.Q_Dump_Claims_Discovery_Auto_Recap.Res0;
OUTPUT(CHOOSEN(RawAutoUnitRecap, MaxResults), NAMED('RawAutoUnitRecap'));
OUTPUT(CHOOSEN(AutoUnitRecapEntity, MaxResults), NAMED('AutoUnitRecapEntity'));
OUTPUT(CHOOSEN(AutoUnitRecapAll, MaxResults), NAMED('AutoUnitRecapAll'));   


