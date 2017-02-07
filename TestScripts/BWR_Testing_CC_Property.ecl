#workunit('name', 'Testing_CC_Property');
#option('expandSelectCreateRow', true); // Added to improve overall compile time
IMPORT KELBlackBox, KELGlobal;

MaxResults := 250; // The maximum number of records to show in the workunit

CCTransactionID := 2951;

RawProperty := KELBlackBox.FileCurrentCarrierPropNormalized.FileCCPropertyRoot(RecordIdentifier = CCTransactionID);
PropertyEntity := KELGlobal.Q_C_C_Property(CCTransactionID).Res0;
PropertyAll := KELGlobal.Q_Dump_C_C_Property.Res0;
OUTPUT(CHOOSEN(RawProperty, MaxResults), NAMED('RawProperty'));
OUTPUT(CHOOSEN(PropertyEntity, MaxResults), NAMED('PropertyEntity'));
OUTPUT(CHOOSEN(PropertyAll, MaxResults), NAMED('PropertyAll'));

RawPropertySubject := KELBlackBox.FileCurrentCarrierPropNormalized.FileCCPropSubIDSets(RecordIdentifier = CCTransactionID);
PropertySubjectEntity := KELGlobal.Q_C_C_Property_Subject(CCTransactionID).Res0;
PropertySubjectAll := KELGlobal.Q_Dump_C_C_Property_Subject.Res0;
OUTPUT(CHOOSEN(RawPropertySubject, MaxResults), NAMED('RawPropertySubject'));
OUTPUT(CHOOSEN(PropertySubjectEntity, MaxResults), NAMED('PropertySubjectEntity'));
OUTPUT(CHOOSEN(PropertySubjectAll, MaxResults), NAMED('PropertySubjectAll'));

RawPropertySubjectRecap := KELBlackBox.FileCurrentCarrierPropNormalized.FileCCPropSubjectRecap(RecordIdentifier = CCTransactionID);
PropertyRecapEntity := KELGlobal.Q_C_C_Property_Recap(CCTransactionID).Res0;
PropertyRecapAll := KELGlobal.Q_Dump_C_C_Property_Recap.Res0;
OUTPUT(CHOOSEN(RawPropertySubjectRecap, MaxResults), NAMED('RawPropertySubjectRecap'));
OUTPUT(CHOOSEN(PropertyRecapEntity, MaxResults), NAMED('PropertyEntityRecap'));
OUTPUT(CHOOSEN(PropertyRecapAll, MaxResults), NAMED('PropertyAllRecap'));

RawPropertyAttachment := KELBlackBox.FileCurrentCarrierPropNormalized.FileCCPropAttachmentSect(RecordIdentifier = CCTransactionID);
PropertyAttachmentEntity := KELGlobal.Q_C_C_Property_Attachment(CCTransactionID).Res0;
PropertyAttachmentAll := KELGlobal.Q_Dump_C_C_Property_Attachment.Res0;
OUTPUT(CHOOSEN(RawPropertyAttachment, MaxResults), NAMED('RawPropertyAttachment'));
OUTPUT(CHOOSEN(PropertyAttachmentEntity, MaxResults), NAMED('PropertyAttachmentEntity'));
OUTPUT(CHOOSEN(PropertyAttachmentAll, MaxResults), NAMED('PropertyAttachmentAll'));