#workunit('name', 'Testing_CC_Auto');
#option('expandSelectCreateRow', true); // Added to improve overall compile time
IMPORT KELBlackBox, KELGlobal;

MaxResults := 250; // The maximum number of records to show in the workunit

CCTransactionID := 2951;

RawAuto := KELBlackBox.FileCurrentCarrierAutoNormalized.FileCCAutoRoot(RecordIdentifier = CCTransactionID);
AutoEntity := KELGlobal.Q_C_C_Auto(CCTransactionID).Res0;
AutoAll := KELGlobal.Q_Dump_C_C_Auto.Res0;
OUTPUT(CHOOSEN(RawAuto, MaxResults), NAMED('RawAuto'));
OUTPUT(CHOOSEN(AutoEntity, MaxResults), NAMED('AutoEntity'));
OUTPUT(CHOOSEN(AutoAll, MaxResults), NAMED('AutoAll'));

RawAutoSubject := KELBlackBox.FileCurrentCarrierAutoNormalized.FileCCAutoSubIDSets(RecordIdentifier = CCTransactionID);
AutoSubjectEntity := KELGlobal.Q_C_C_Auto_Subject(CCTransactionID).Res0;
AutoSubjectAll := KELGlobal.Q_Dump_C_C_Auto_Subject.Res0;
OUTPUT(CHOOSEN(RawAutoSubject, MaxResults), NAMED('RawAutoSubject'));
OUTPUT(CHOOSEN(AutoSubjectEntity, MaxResults), NAMED('AutoSubjectEntity'));
OUTPUT(CHOOSEN(AutoSubjectAll, MaxResults), NAMED('AutoSubjectAll'));

RawAutoSubjectRecap := KELBlackBox.FileCurrentCarrierAutoNormalized.FileCCAutoSubjectRecap(RecordIdentifier = CCTransactionID);
AutoRecapEntity := KELGlobal.Q_C_C_Auto_Recap(CCTransactionID).Res0;
AutoRecapAll := KELGlobal.Q_Dump_C_C_Auto_Recap.Res0;
OUTPUT(CHOOSEN(RawAutoSubjectRecap, MaxResults), NAMED('RawAutoSubjectRecap'));
OUTPUT(CHOOSEN(AutoRecapEntity, MaxResults), NAMED('AutoEntityRecap'));
OUTPUT(CHOOSEN(AutoRecapAll, MaxResults), NAMED('AutoAllRecap'));

RawAutoAttachment := KELBlackBox.FileCurrentCarrierAutoNormalized.FileCCAutoAttachmentSect(RecordIdentifier = CCTransactionID);
AutoAttachmentEntity := KELGlobal.Q_C_C_Auto_Attachment(CCTransactionID).Res0;
AutoAttachmentAll := KELGlobal.Q_Dump_C_C_Auto_Attachment.Res0;
OUTPUT(CHOOSEN(RawAutoAttachment, MaxResults), NAMED('RawAutoAttachment'));
OUTPUT(CHOOSEN(AutoAttachmentEntity, MaxResults), NAMED('AutoAttachmentEntity'));
OUTPUT(CHOOSEN(AutoAttachmentAll, MaxResults), NAMED('AutoAttachmentAll'));