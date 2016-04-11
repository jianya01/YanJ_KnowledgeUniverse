#workunit('name', 'Testing_CreditReport_Attributes');
#option('expandSelectCreateRow', true); // Added to improve overall compile time

IMPORT KELBlackBox, KELGlobal, UT;

MaxResults := 250; // The maximum number of records to show in the workunit

//TransactionID := '8778105R14224580'; // Joint Report
TransactionID := '8778015R13971833'; // Bankruptcies/Collections

CreditReport := KELGlobal.Q_Credit_Report_Attributes(TransactionID).Res0;
OUTPUT(CreditReport, NAMED('Credit_Report'));

Bankruptcy := KELGlobal.Q_Credit_Report_Bankruptcy_Attributes(TransactionID).Res0;
OUTPUT(Bankruptcy, NAMED('Bankruptcy'));

Collection := KELGlobal.Q_Credit_Report_Collection_Attributes(TransactionID).Res0;
OUTPUT(Collection, NAMED('Collection'));

Employment := KELGlobal.Q_Credit_Report_Employment_Attributes(TransactionID).Res0;
OUTPUT(Employment, NAMED('Employment'));

Inquiry := KELGlobal.Q_Credit_Report_Inquiry_Attributes(TransactionID).Res0;
OUTPUT(Inquiry, NAMED('Inquiry'));

Judgement := KELGlobal.Q_Credit_Report_Judgement_Attributes(TransactionID).Res0;
OUTPUT(Judgement, NAMED('Judgement'));

Lien := KELGlobal.Q_Credit_Report_Lien_Attributes(TransactionID).Res0;
OUTPUT(Lien, NAMED('Lien'));

Tradeline := KELGlobal.Q_Credit_Report_Tradeline_Attributes(TransactionID).Res0;
OUTPUT(Tradeline, NAMED('Tradeline'));

NarrativeRemarks := KELGlobal.Q_Credit_Report_Narrative_Remarks_Attributes(TransactionID).Res0;
OUTPUT(NarrativeRemarks, NAMED('Narrative_Remarks'));