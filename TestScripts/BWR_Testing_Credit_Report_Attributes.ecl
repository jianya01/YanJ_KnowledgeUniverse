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