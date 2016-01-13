#workunit('name', 'Testing_BlackBox_Attributes');
#option('expandSelectCreateRow', true); // Added to improve overall compile time

IMPORT KELBlackBox, KELGlobal, Utilities;

//LexID := 44;
LexID := 910;

HistoricalDate := (INTEGER)Utilities.GetDate; // Pick this to run with todays date
//HistoricalDate := 20141001; // Pick this to run with a historical archive date YYYYMMDD

//PersonResults := CHOOSEN(KELGlobal.Q_Dump_All_Person_Data.Res0, 5);
PersonResultsForLexID := KELGlobal.Q_Dump_Person_Data(LexID, HistoricalDate).Res0;
BlackBoxResultsForLexID := KELGlobal.Q_Black_Box_Attributes(LexID, HistoricalDate).Res0;
BocaShellResultsForLexID := KELGlobal.Q_Boca_Shell_Attributes(LexID, HistoricalDate).Res0;
InsuranceHeaderResultsForLexID := KELGlobal.Q_Insurance_Header_Attributes(LexID, HistoricalDate).Res0;
InsurViewResultsForLexID := KELGlobal.Q_Insur_View_Person_Data(LexID, HistoricalDate).Res0;
MaritalStatusResultsForLexID := KELGlobal.Q_Marital_Status_Attributes(LexID, HistoricalDate).Res0;
MarketViewResultsForLexID := KELGlobal.Q_Market_View_Attributes(LexID, HistoricalDate).Res0;
RiskViewResultsForLexID := KELGlobal.Q_Risk_View_Attributes(LexID, HistoricalDate).Res0;

//OUTPUT(PersonResults, NAMED('Person_Data_Dump'));
OUTPUT(PersonResultsForLexID, NAMED('Person_Data_LexID'));
OUTPUT(BlackBoxResultsForLexID, NAMED('BlackBox_Attributes_LexID'));
OUTPUT(BocaShellResultsForLexID, NAMED('Boca_Shell_Attributes_LexID'));
OUTPUT(InsuranceHeaderResultsForLexID, NAMED('InsuranceHeader_Attributes_LexID'));
OUTPUT(InsurViewResultsForLexID, NAMED('InsurView_Data_LexID'));
OUTPUT(MaritalStatusResultsForLexID, NAMED('MaritalStatus_Attributes_LexID'));
OUTPUT(MarketViewResultsForLexID, NAMED('MarketView_Attributes_LexID'));
OUTPUT(RiskViewResultsForLexID, NAMED('RiskView_Attributes_LexID'));