#workunit('name', 'Black Box Dataset Statistics');

IMPORT KELBlackBox, UT;

eyeball := 250;

BocaShellRecs := DISTRIBUTE(KELBlackBox.FileBlackBoxBocaShell, HASH64(LexID));
InsuranceHeaderRecs := DISTRIBUTE(KELBlackBox.FileBlackBoxInsuranceHeader, HASH64(LexID));
InsurViewRecs := DISTRIBUTE(KELBlackBox.FileBlackBoxInsurView, HASH64(LexID));
LengthOfResidencyRecs := DISTRIBUTE(KELBlackBox.FileBlackBoxLengthOfResidency, HASH64(LexID));
MaritalStatusRecs := DISTRIBUTE(KELBlackBox.FileBlackBoxMaritalStatus, HASH64(LexID));
MarketViewRecs := DISTRIBUTE(KELBlackBox.FileBlackBoxMarketView, HASH64(LexID));
RiskViewRecs := DISTRIBUTE(KELBlackBox.FileBlackBoxRiskView, HASH64(LexID));

BocaShellLexIDStats := TABLE(BocaShellRecs, {LexID, UNSIGNED8 TotalRecords := COUNT(GROUP)}, LexID);
InsuranceHeaderLexIDStats := TABLE(InsuranceHeaderRecs, {LexID, UNSIGNED8 TotalRecords := COUNT(GROUP)}, LexID);
InsurViewLexIDStats := TABLE(InsurViewRecs, {LexID, UNSIGNED8 TotalRecords := COUNT(GROUP)}, LexID);
LengthOfResidencyLexIDStats := TABLE(LengthOfResidencyRecs, {LexID, UNSIGNED8 TotalRecords := COUNT(GROUP)}, LexID);
MaritalStatusLexIDStats := TABLE(MaritalStatusRecs, {LexID, UNSIGNED8 TotalRecords := COUNT(GROUP)}, LexID);
MarketViewLexIDStats := TABLE(MarketViewRecs, {LexID, UNSIGNED8 TotalRecords := COUNT(GROUP)}, LexID);
RiskViewLexIDStats := TABLE(RiskViewRecs, {LexID, UNSIGNED8 TotalRecords := COUNT(GROUP)}, LexID);

BocaShellStats := TABLE(BocaShellLexIDStats, {UNSIGNED8 TotalLexIDs := COUNT(GROUP), REAL8 AverageRecordsPerLexID := AVE(GROUP, TotalRecords), UNSIGNED8 MinRecordsPerLexID := MIN(GROUP, TotalRecords), UNSIGNED8 MaxRecordsPerLexID := MAX(GROUP, TotalRecords)}, TRUE);
InsuranceHeaderStats := TABLE(InsuranceHeaderLexIDStats, {UNSIGNED8 TotalLexIDs := COUNT(GROUP), REAL8 AverageRecordsPerLexID := AVE(GROUP, TotalRecords), UNSIGNED8 MinRecordsPerLexID := MIN(GROUP, TotalRecords), UNSIGNED8 MaxRecordsPerLexID := MAX(GROUP, TotalRecords)}, TRUE);
InsurViewStats := TABLE(InsurViewLexIDStats, {UNSIGNED8 TotalLexIDs := COUNT(GROUP), REAL8 AverageRecordsPerLexID := AVE(GROUP, TotalRecords), UNSIGNED8 MinRecordsPerLexID := MIN(GROUP, TotalRecords), UNSIGNED8 MaxRecordsPerLexID := MAX(GROUP, TotalRecords)}, TRUE);
LengthOfResidencyStats := TABLE(LengthOfResidencyLexIDStats, {UNSIGNED8 TotalLexIDs := COUNT(GROUP), REAL8 AverageRecordsPerLexID := AVE(GROUP, TotalRecords), UNSIGNED8 MinRecordsPerLexID := MIN(GROUP, TotalRecords), UNSIGNED8 MaxRecordsPerLexID := MAX(GROUP, TotalRecords)}, TRUE);
MaritalStatusStats := TABLE(MaritalStatusLexIDStats, {UNSIGNED8 TotalLexIDs := COUNT(GROUP), REAL8 AverageRecordsPerLexID := AVE(GROUP, TotalRecords), UNSIGNED8 MinRecordsPerLexID := MIN(GROUP, TotalRecords), UNSIGNED8 MaxRecordsPerLexID := MAX(GROUP, TotalRecords)}, TRUE);
MarketViewStats := TABLE(MarketViewLexIDStats, {UNSIGNED8 TotalLexIDs := COUNT(GROUP), REAL8 AverageRecordsPerLexID := AVE(GROUP, TotalRecords), UNSIGNED8 MinRecordsPerLexID := MIN(GROUP, TotalRecords), UNSIGNED8 MaxRecordsPerLexID := MAX(GROUP, TotalRecords)}, TRUE);
RiskViewStats := TABLE(RiskViewLexIDStats, {UNSIGNED8 TotalLexIDs := COUNT(GROUP), REAL8 AverageRecordsPerLexID := AVE(GROUP, TotalRecords), UNSIGNED8 MinRecordsPerLexID := MIN(GROUP, TotalRecords), UNSIGNED8 MaxRecordsPerLexID := MAX(GROUP, TotalRecords)}, TRUE);

OverallStats := 
SORT(
PROJECT(BocaShellStats, TRANSFORM({STRING Product, UNSIGNED8 TotalUniqueLexIDs, REAL8 AverageRecordsPerLexID, UNSIGNED8 MinRecordsPerLexID, UNSIGNED8 MaxRecordsPerLexID}, SELF.Product := 'Boca Shell'; SELF.TotalUniqueLexIDs := LEFT.TotalLexIDs; SELF.AverageRecordsPerLexID := ROUND(LEFT.AverageRecordsPerLexID, 4); SELF.MinRecordsPerLexID := LEFT.MinRecordsPerLexID; SELF.MaxRecordsPerLexID := LEFT.MaxRecordsPerLexID)) +
PROJECT(InsuranceHeaderStats, TRANSFORM({STRING Product, UNSIGNED8 TotalUniqueLexIDs, REAL8 AverageRecordsPerLexID, UNSIGNED8 MinRecordsPerLexID, UNSIGNED8 MaxRecordsPerLexID}, SELF.Product := 'Insurance Header'; SELF.TotalUniqueLexIDs := LEFT.TotalLexIDs; SELF.AverageRecordsPerLexID := ROUND(LEFT.AverageRecordsPerLexID, 4); SELF.MinRecordsPerLexID := LEFT.MinRecordsPerLexID; SELF.MaxRecordsPerLexID := LEFT.MaxRecordsPerLexID)) +
PROJECT(InsurViewStats, TRANSFORM({STRING Product, UNSIGNED8 TotalUniqueLexIDs, REAL8 AverageRecordsPerLexID, UNSIGNED8 MinRecordsPerLexID, UNSIGNED8 MaxRecordsPerLexID}, SELF.Product := 'InsurView'; SELF.TotalUniqueLexIDs := LEFT.TotalLexIDs; SELF.AverageRecordsPerLexID := ROUND(LEFT.AverageRecordsPerLexID, 4); SELF.MinRecordsPerLexID := LEFT.MinRecordsPerLexID; SELF.MaxRecordsPerLexID := LEFT.MaxRecordsPerLexID)) +
PROJECT(LengthOfResidencyStats, TRANSFORM({STRING Product, UNSIGNED8 TotalUniqueLexIDs, REAL8 AverageRecordsPerLexID, UNSIGNED8 MinRecordsPerLexID, UNSIGNED8 MaxRecordsPerLexID}, SELF.Product := 'Length of Residency'; SELF.TotalUniqueLexIDs := LEFT.TotalLexIDs; SELF.AverageRecordsPerLexID := ROUND(LEFT.AverageRecordsPerLexID, 4); SELF.MinRecordsPerLexID := LEFT.MinRecordsPerLexID; SELF.MaxRecordsPerLexID := LEFT.MaxRecordsPerLexID)) +
PROJECT(MaritalStatusStats, TRANSFORM({STRING Product, UNSIGNED8 TotalUniqueLexIDs, REAL8 AverageRecordsPerLexID, UNSIGNED8 MinRecordsPerLexID, UNSIGNED8 MaxRecordsPerLexID}, SELF.Product := 'Marital Status'; SELF.TotalUniqueLexIDs := LEFT.TotalLexIDs; SELF.AverageRecordsPerLexID := ROUND(LEFT.AverageRecordsPerLexID, 4); SELF.MinRecordsPerLexID := LEFT.MinRecordsPerLexID; SELF.MaxRecordsPerLexID := LEFT.MaxRecordsPerLexID)) +
PROJECT(MarketViewStats, TRANSFORM({STRING Product, UNSIGNED8 TotalUniqueLexIDs, REAL8 AverageRecordsPerLexID, UNSIGNED8 MinRecordsPerLexID, UNSIGNED8 MaxRecordsPerLexID}, SELF.Product := 'MarketView'; SELF.TotalUniqueLexIDs := LEFT.TotalLexIDs; SELF.AverageRecordsPerLexID := ROUND(LEFT.AverageRecordsPerLexID, 4); SELF.MinRecordsPerLexID := LEFT.MinRecordsPerLexID; SELF.MaxRecordsPerLexID := LEFT.MaxRecordsPerLexID)) +
PROJECT(RiskViewStats, TRANSFORM({STRING Product, UNSIGNED8 TotalUniqueLexIDs, REAL8 AverageRecordsPerLexID, UNSIGNED8 MinRecordsPerLexID, UNSIGNED8 MaxRecordsPerLexID}, SELF.Product := 'RiskView'; SELF.TotalUniqueLexIDs := LEFT.TotalLexIDs; SELF.AverageRecordsPerLexID := ROUND(LEFT.AverageRecordsPerLexID, 4); SELF.MinRecordsPerLexID := LEFT.MinRecordsPerLexID; SELF.MaxRecordsPerLexID := LEFT.MaxRecordsPerLexID))
, Product);

OUTPUT(OverallStats, NAMED('Black_Box_Dataset_Stats'));
//OUTPUT(BocaShellStats, NAMED('Boca_Shell_Stats'));
//OUTPUT(InsuranceHeaderStats, NAMED('Insurance_Header_Stats'));
//OUTPUT(InsurViewStats, NAMED('InsurView_Stats'));
//OUTPUT(MaritalStatusStats, NAMED('Marital_Status_Stats'));
//OUTPUT(MarketViewStats, NAMED('Market_View_Stats'));
//OUTPUT(RiskViewStats, NAMED('RiskView_Stats'));

OUTPUT(CHOOSEN(SORT(BocaShellLexIDStats, -TotalRecords), eyeball), NAMED('Boca_Shell_Top_LexIDs'));
OUTPUT(CHOOSEN(SORT(InsuranceHeaderLexIDStats, -TotalRecords), eyeball), NAMED('Insurance_Header_Top_LexIDs'));
OUTPUT(CHOOSEN(SORT(InsurViewLexIDStats, -TotalRecords), eyeball), NAMED('InsurView_Top_LexIDs'));
OUTPUT(CHOOSEN(SORT(LengthOfResidencyLexIDStats, -TotalRecords), eyeball), NAMED('Length_Of_Residency_Top_LexIDs'));
OUTPUT(CHOOSEN(SORT(MaritalStatusLexIDStats, -TotalRecords), eyeball), NAMED('Marital_Status_Top_LexIDs'));
OUTPUT(CHOOSEN(SORT(MarketViewLexIDStats, -TotalRecords), eyeball), NAMED('Market_View_Top_LexIDs'));
OUTPUT(CHOOSEN(SORT(RiskViewLexIDStats, -TotalRecords), eyeball), NAMED('RiskView_Top_LexIDs'));