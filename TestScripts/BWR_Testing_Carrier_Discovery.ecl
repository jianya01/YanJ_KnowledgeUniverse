#workunit('name', 'Testing_CarrierDiscovery_Auto');
#option('expandSelectCreateRow', true); // Added to improve overall compile time

IMPORT KELBlackBox, KELGlobal, SALT35, SALTRoutines, UT;

MaxResults := 250; // The maximum number of records to show in the workunit

CarrierDiscoveryTransactionID := 2951;

RawAuto := KELBlackBox.FileCarrierDiscoveryAutoNormalized.FileCDiscAutoRoot(RecordIdentifier = CarrierDiscoveryTransactionID);
AutoEntity := KELGlobal.Q_Carrier_Discovery_Auto(CarrierDiscoveryTransactionID).Res0;
AutoAll := KELGlobal.Q_Dump_Carrier_Discovery_Auto.Res0;
OUTPUT(CHOOSEN(RawAuto, MaxResults), NAMED('RawAuto'));
OUTPUT(CHOOSEN(AutoEntity, MaxResults), NAMED('AutoEntity'));
OUTPUT(CHOOSEN(AutoAll, MaxResults), NAMED('AutoAll'));

AutoSubjectInfoEntity := KELGlobal.Q_Carrier_Discovery_Auto_Subject(CarrierDiscoveryTransactionID).Res0;
AutoSubjectInfoAll := KELGlobal.Q_Dump_Carrier_Discovery_Auto_Subject.Res0;
OUTPUT(CHOOSEN(AutoSubjectInfoEntity, MaxResults), NAMED('AutoSubjectInfoEntity'));
OUTPUT(CHOOSEN(AutoSubjectInfoAll, MaxResults), NAMED('AutoSubjectInfoAll'));

AutoUnitRecapEntity := KELGlobal.Q_Carrier_Discovery_Auto_Recap(CarrierDiscoveryTransactionID).Res0;
AutoUnitRecapAll := KELGlobal.Q_Dump_Carrier_Discovery_Auto_Recap.Res0;
OUTPUT(CHOOSEN(AutoUnitRecapEntity, MaxResults), NAMED('AutoUnitRecapEntity'));
OUTPUT(CHOOSEN(AutoUnitRecapAll, MaxResults), NAMED('AutoUnitRecapAll'));    