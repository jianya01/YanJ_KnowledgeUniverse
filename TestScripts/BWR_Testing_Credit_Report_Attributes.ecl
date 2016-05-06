#workunit('name', 'Testing_CreditReport_Attributes');
#option('expandSelectCreateRow', true); // Added to improve overall compile time

IMPORT KELBlackBox, KELGlobal, UT;

MaxResults := 250; // The maximum number of records to show in the workunit

//TransactionID := '8778105R14224580'; // Joint Report
CreditReport := DATASET([{'8778015R13971833', 1514226899}], {STRING TransactionID, UNSIGNED6 LexID}); // Bankruptcies/Collections
//CreditReport := DATASET([{'0F19ADA9C0X3382', 1514226899}], {STRING TransactionID, UNSIGNED6 LexID}); // Bankruptcies/Collections/Tradeline/Inquiries

HistoryDate := (INTEGER)UT.GetDate; // Run with Today's Date

CreditReportSummary := KELGlobal.Q_Credit_Report_Attributes(CreditReport[1].TransactionID).Res0;
OUTPUT(CreditReportSummary, NAMED('Credit_Report'));

PersonsCreditReport := KELGlobal.Q_Persons_Credit_Report(CreditReport[1].LexID).Res0;
OUTPUT(PersonsCreditReport, NAMED('Persons_Credit_Report'));

Bankruptcy := KELGlobal.Q_Credit_Report_Bankruptcy_Attributes(CreditReport[1].TransactionID).Res0;
OUTPUT(Bankruptcy, NAMED('Bankruptcy'));

Collection := KELGlobal.Q_Credit_Report_Collection_Attributes(CreditReport[1].TransactionID).Res0;
OUTPUT(Collection, NAMED('Collection'));

Employment := KELGlobal.Q_Credit_Report_Employment_Attributes(CreditReport[1].TransactionID).Res0;
OUTPUT(Employment, NAMED('Employment'));

Inquiry := KELGlobal.Q_Credit_Report_Inquiry_Attributes(CreditReport[1].TransactionID).Res0;
OUTPUT(Inquiry, NAMED('Inquiry'));

Judgement := KELGlobal.Q_Credit_Report_Judgement_Attributes(CreditReport[1].TransactionID).Res0;
OUTPUT(Judgement, NAMED('Judgement'));

Lien := KELGlobal.Q_Credit_Report_Lien_Attributes(CreditReport[1].TransactionID).Res0;
OUTPUT(Lien, NAMED('Lien'));

Tradeline := KELGlobal.Q_Credit_Report_Tradeline_Attributes(CreditReport[1].TransactionID).Res0;
OUTPUT(Tradeline, NAMED('Tradeline'));

NarrativeRemarks := KELGlobal.Q_Credit_Report_Narrative_Remarks_Attributes(CreditReport[1].TransactionID).Res0;
OUTPUT(NarrativeRemarks, NAMED('Narrative_Remarks'));