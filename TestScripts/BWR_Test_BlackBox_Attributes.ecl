#workunit('name', 'Testing_BlackBox_Attributes');

IMPORT KELBlackBox, KELGlobal, Utilities;

//LexID := 910; // Populates most attributes
LexID := 44; // Contains multiple InsurView snapshots

PersonResults := CHOOSEN(KELGlobal.Q_Dump_All_Person_Data.Res0, 5);
PersonResultsForLexID := KELGlobal.Q_Dump_Person_Data(LexID).Res0;
BlackBoxResultsForLexID := KELGlobal.Q_Black_Box_Attributes(LexID).Res0;
BocaShellResultsForLexID := KELGlobal.Q_Boca_Shell_Attributes(LexID).Res0;
InsurViewResultsForLexID := KELGlobal.Q_Insur_View_Person_Data(LexID).Res0;
MaritalStatusResultsForLexID := KELGlobal.Q_Marital_Status_Attributes(LexID).Res0;
MarketViewResultsForLexID := KELGlobal.Q_Market_View_Attributes(LexID).Res0;
RiskViewResultsForLexID := KELGlobal.Q_Risk_View_Attributes(LexID).Res0;

OUTPUT(PersonResults, NAMED('Person_Data_Dump'));
OUTPUT(PersonResultsForLexID, NAMED('Person_Data_LexID_910'));
OUTPUT(BlackBoxResultsForLexID, NAMED('BlackBox_Attributes_LexID_910'));
OUTPUT(BocaShellResultsForLexID, NAMED('Boca_Shell_Attributes_LexID_910'));
OUTPUT(InsurViewResultsForLexID, NAMED('InsurView_Data_LexID_910'));
OUTPUT(MaritalStatusResultsForLexID, NAMED('MaritalStatus_Attributes_LexID_910'));
OUTPUT(MarketViewResultsForLexID, NAMED('MarketView_Attributes_LexID_910'));
OUTPUT(RiskViewResultsForLexID, NAMED('RiskView_Attributes_LexID_910'));