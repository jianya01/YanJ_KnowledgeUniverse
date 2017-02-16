#workunit('name', 'Testing_CreditReport_Attributes');
#option('expandSelectCreateRow', true); // Added to improve overall compile time

IMPORT KELBlackBox, UT;
IMPORT KELGlobal AS KELCodeLocation;

Transaction := DATASET([{'8778015R13971833', 1514226899}], {STRING TransactionID, UNSIGNED6 LexID}); // Bankruptcies/Collections
//Transaction := DATASET([{'0F19ADA9C0X3382', 1514226899}], {STRING TransactionID, UNSIGNED6 LexID}); // Bankruptcies/Collections/Tradeline/Inquiries

// NCFVersion := 1; // Run NCF Version 1
NCFVersion := 2; // Run NCF Version 2

IncludeDebugQueries := true; // Only OUTPUT the top level CreditReport
// IncludeDebugQueries := false; // OUTPUT all CreditReport* ENTITY results

#if(NCFVersion = 1)
	OUTPUT(KELCodeLocation.S_Credit_Report_V1.Result(Transaction_I_D_ = Transaction[1].TransactionID), NAMED('CreditReport'));
	#if(IncludeDebugQueries)
	OUTPUT(KELCodeLocation.Q_Credit_Report_Bankruptcy_V1(Transaction[1].TransactionID).Res0, NAMED('CreditReportBankruptcy'));
	OUTPUT(KELCodeLocation.Q_Credit_Report_Collection_V1(Transaction[1].TransactionID).Res0, NAMED('CreditReportCollection'));
	OUTPUT(KELCodeLocation.Q_Credit_Report_Employment_V1(Transaction[1].TransactionID).Res0, NAMED('CreditReportEmployment'));
	OUTPUT(KELCodeLocation.Q_Credit_Report_Inquiry_V1(Transaction[1].TransactionID).Res0, NAMED('CreditReportInquiry'));
	OUTPUT(KELCodeLocation.Q_Credit_Report_Judgement_V1(Transaction[1].TransactionID).Res0, NAMED('CreditReportJudgement'));
	OUTPUT(KELCodeLocation.Q_Credit_Report_Lien_V1(Transaction[1].TransactionID).Res0, NAMED('CreditReportLien'));
	OUTPUT(KELCodeLocation.Q_Credit_Report_Narrative_Remarks_V1(Transaction[1].TransactionID).Res0, NAMED('CreditReportNarrativeRemarks'));
	OUTPUT(KELCodeLocation.Q_Credit_Report_Tradeline_V1(Transaction[1].TransactionID).Res0, NAMED('CreditReportTradeline'));
	#end
#else
	OUTPUT(KELCodeLocation.S_Credit_Report_V2.Result(Transaction_I_D_ = Transaction[1].TransactionID), NAMED('CreditReport'));
	#if(IncludeDebugQueries)
	OUTPUT(KELCodeLocation.Q_Credit_Report_Bankruptcy_V2(Transaction[1].TransactionID).Res0, NAMED('CreditReportBankruptcy'));
	OUTPUT(KELCodeLocation.Q_Credit_Report_Collection_V2(Transaction[1].TransactionID).Res0, NAMED('CreditReportCollection'));
	OUTPUT(KELCodeLocation.Q_Credit_Report_Employment_V2(Transaction[1].TransactionID).Res0, NAMED('CreditReportEmployment'));
	OUTPUT(KELCodeLocation.Q_Credit_Report_Inquiry_V2(Transaction[1].TransactionID).Res0, NAMED('CreditReportInquiry'));
	OUTPUT(KELCodeLocation.Q_Credit_Report_Judgement_V2(Transaction[1].TransactionID).Res0, NAMED('CreditReportJudgement'));
	OUTPUT(KELCodeLocation.Q_Credit_Report_Lien_V2(Transaction[1].TransactionID).Res0, NAMED('CreditReportLien'));
	OUTPUT(KELCodeLocation.Q_Credit_Report_Narrative_Remarks_V2(Transaction[1].TransactionID).Res0, NAMED('CreditReportNarrativeRemarks'));
	OUTPUT(KELCodeLocation.Q_Credit_Report_Tradeline_V2(Transaction[1].TransactionID).Res0, NAMED('CreditReportTradeline'));
	#end
#end