#workunit('name', 'Testing_BlackBox_Attributes');
#option('expandSelectCreateRow', true); // Added to improve overall compile time

IMPORT KELBlackBox, KELGlobal, UT;

MaxResults := 250; // The maximum number of records to show in the workunit

RunSingleLexID := TRUE; // Pick this to run only 1 LexID at a time
//RunSingleLexID := FALSE; // Pick this to run a set of LexID's. NOTE: THIS WILL TAKE LONGER TO RUN

ReturnAttributeSnapshots := TRUE; // Returns the various Black Box Attribute snapshot results. NOTE: THIS WILL TAKE LONGER TO RUN ~30 minutes longer runtime
//ReturnAttributeSnapshots := FALSE; // Only returns just the most recent attribute values. This takes ~6 minutes to compile and run

HistoricalDate := (INTEGER)UT.GetDate; // Pick this to run with todays date
//HistoricalDate := 20141001; // Pick this to run with a historical archive date in YYYYMMDD format

#if(RunSingleLexID)
LexID := 31474864422; // Pick a specific LexID

// These queries produce the "most recent attribute value" for a given LexID as of the historical date
BlackBoxAttributes			:= KELGlobal.Q_Black_Box_Attributes(LexID, HistoricalDate).Res0;
BocaShellAttributes			:= KELGlobal.Q_Boca_Shell_Attributes(LexID, HistoricalDate).Res0;
InsuranceHeaderAttributes	:= KELGlobal.Q_Insurance_Header_Attributes(LexID, HistoricalDate).Res0;
LengthOfResidencyAttributes	:= KELGlobal.Q_Length_Of_Residency_Attributes(LexID, HistoricalDate).Res0;
MaritalStatusAttributes		:= KELGlobal.Q_Marital_Status_Attributes(LexID, HistoricalDate).Res0;
MarketViewAttributes		:= KELGlobal.Q_Market_View_Attributes(LexID, HistoricalDate).Res0;
RiskViewAttributes			:= KELGlobal.Q_Risk_View_Attributes(LexID, HistoricalDate).Res0;

#if(ReturnAttributeSnapshots)
// These queries produce the attribute "snapshots" for a given LexID as of the historical date
BocaShellSnapshots			:= KELGlobal.Q_Boca_Shell_Snapshots(LexID, HistoricalDate).Res0;
InsuranceHeaderSnapshots	:= KELGlobal.Q_Insurance_Header_Snapshots(LexID, HistoricalDate).Res0;
LengthOfResidencySnapshots	:= KELGlobal.Q_Length_Of_Residency_Snapshots(LexID, HistoricalDate).Res0;
MaritalStatusSnapshots		:= KELGlobal.Q_Marital_Status_Snapshots(LexID, HistoricalDate).Res0;
MarketViewSnapshots			:= KELGlobal.Q_Market_View_Snapshots(LexID, HistoricalDate).Res0;
RiskViewSnapshots			:= KELGlobal.Q_Risk_View_Snapshots(LexID, HistoricalDate).Res0;
#end

// This query produces the Relatives and Associates for a given LexID
FirstDegreeRelativesAndAssociates := KELGlobal.Q_First_Degree_Relatives_And_Associates(LexID, HistoricalDate).Res0;

// Now show the results
OUTPUT(BlackBoxAttributes, NAMED('LexID_Black_Box_Attributes'));
OUTPUT(BocaShellAttributes, NAMED('LexID_Boca_Shell_Attributes'));
OUTPUT(InsuranceHeaderAttributes, NAMED('LexID_Insurance_Header_Attributes'));
OUTPUT(LengthOfResidencyAttributes, NAMED('LexID_Length_of_Residency_Attributes'));
OUTPUT(MaritalStatusAttributes, NAMED('LexID_Marital_Status_Attributes'));
OUTPUT(MarketViewAttributes, NAMED('LexID_MarketView_Attributes'));
OUTPUT(RiskViewAttributes, NAMED('LexID_RiskView_Attributes'));

#if(ReturnAttributeSnapshots)
OUTPUT(BocaShellSnapshots, NAMED('LexID_Boca_Shell_Snapshots'));
OUTPUT(InsuranceHeaderSnapshots, NAMED('LexID_Insurance_Header_Snapshots'));
OUTPUT(LengthOfResidencySnapshots, NAMED('LexID_Length_of_Residency_Snapshots'));
OUTPUT(MaritalStatusSnapshots, NAMED('LexID_Marital_Status_Snapshots'));
OUTPUT(MarketViewSnapshots, NAMED('LexID_MarketView_Snapshots'));
OUTPUT(RiskViewSnapshots, NAMED('LexID_RiskView_Snapshots'));
#end

OUTPUT(CHOOSEN(FirstDegreeRelativesAndAssociates, MaxResults), NAMED('LexID_First_Degree_Relatives_And_Associates'));

#else
LexIDSet := DATASET([ // You can add as many LexID's as you want to look for here - or this could be replaced with an input file of LexID's
	{910}, 
	{2951}, 
	{5400}
	], {INTEGER LexID}); 

// These queries produce the "most recent attribute value" for a given set of LexID's as of the historical date
BlackBoxAttributes			:= JOIN(LexIDSet, KELGlobal.Q_All_Black_Box_Attributes(HistoricalDate).Res0, LEFT.LexID = RIGHT.UID, TRANSFORM(RIGHT), KEEP(1), ATMOST(10), SMART);
BocaShellAttributes			:= JOIN(LexIDSet, KELGlobal.Q_All_Boca_Shell_Attributes(HistoricalDate).Res0, LEFT.LexID = RIGHT.UID, TRANSFORM(RIGHT), KEEP(1), ATMOST(10), SMART);
InsuranceHeaderAttributes	:= JOIN(LexIDSet, KELGlobal.Q_All_Insurance_Header_Attributes(HistoricalDate).Res0, LEFT.LexID = RIGHT.UID, TRANSFORM(RIGHT), KEEP(1), ATMOST(10), SMART);
LengthOfResidencyAttributes	:= JOIN(LexIDSet, KELGlobal.Q_All_Length_Of_Residency_Attributes(HistoricalDate).Res0, LEFT.LexID = RIGHT.UID, TRANSFORM(RIGHT), KEEP(1), ATMOST(10), SMART);
MaritalStatusAttributes		:= JOIN(LexIDSet, KELGlobal.Q_All_Marital_Status_Attributes(HistoricalDate).Res0, LEFT.LexID = RIGHT.UID, TRANSFORM(RIGHT), KEEP(1), ATMOST(10), SMART);
MarketViewAttributes		:= JOIN(LexIDSet, KELGlobal.Q_All_Market_View_Attributes(HistoricalDate).Res0, LEFT.LexID = RIGHT.UID, TRANSFORM(RIGHT), KEEP(1), ATMOST(10), SMART);
RiskViewAttributes			:= JOIN(LexIDSet, KELGlobal.Q_All_Risk_View_Attributes(HistoricalDate).Res0, LEFT.LexID = RIGHT.UID, TRANSFORM(RIGHT), KEEP(1), ATMOST(10), SMART);

#if(ReturnAttributeSnapshots)
// These queries produce the attribute "snapshots" for a given set of LexID's as of the historical date
BocaShellSnapshots			:= JOIN(LexIDSet, KELGlobal.Q_All_Boca_Shell_Snapshots(HistoricalDate).Res0, LEFT.LexID = RIGHT.Subject_, TRANSFORM(RIGHT), KEEP(1), ATMOST(10), SMART);
InsuranceHeaderSnapshots	:= JOIN(LexIDSet, KELGlobal.Q_All_Insurance_Header_Snapshots(HistoricalDate).Res0, LEFT.LexID = RIGHT.Subject_, TRANSFORM(RIGHT), KEEP(1), ATMOST(10), SMART);
LengthOfResidencySnapshots	:= JOIN(LexIDSet, KELGlobal.Q_All_Length_Of_Residency_Snapshots(HistoricalDate).Res0, LEFT.LexID = RIGHT.Subject_, TRANSFORM(RIGHT), KEEP(1), ATMOST(10), SMART);
MaritalStatusSnapshots		:= JOIN(LexIDSet, KELGlobal.Q_All_Marital_Status_Snapshots(HistoricalDate).Res0, LEFT.LexID = RIGHT.Subject_, TRANSFORM(RIGHT), KEEP(1), ATMOST(10), SMART);
MarketViewSnapshots			:= JOIN(LexIDSet, KELGlobal.Q_All_Market_View_Snapshots(HistoricalDate).Res0, LEFT.LexID = RIGHT.Subject_, TRANSFORM(RIGHT), KEEP(1), ATMOST(10), SMART);
RiskViewSnapshots			:= JOIN(LexIDSet, KELGlobal.Q_All_Risk_View_Snapshots(HistoricalDate).Res0, LEFT.LexID = RIGHT.Subject_, TRANSFORM(RIGHT), KEEP(1), ATMOST(10), SMART);
#end

// This query produces the Relatives and Associates for a given set of LexID's
FirstDegreeRelativesAndAssociates := JOIN(LexIDSet, KELGlobal.Q_All_First_Degree_Relatives_And_Associates(HistoricalDate).Res0, LEFT.LexID = RIGHT.Subject_.UID, TRANSFORM(RIGHT), KEEP(1), ATMOST(10), SMART);

// Now show the results
OUTPUT(CHOOSEN(BlackBoxAttributes, MaxResults), NAMED('LexID_Black_Box_Attributes'));
OUTPUT(CHOOSEN(BocaShellAttributes, MaxResults), NAMED('LexID_Boca_Shell_Attributes'));
OUTPUT(CHOOSEN(InsuranceHeaderAttributes, MaxResults), NAMED('LexID_Insurance_Header_Attributes'));
OUTPUT(CHOOSEN(LengthOfResidencyAttributes, MaxResults), NAMED('LexID_Length_of_Residency_Attributes'));
OUTPUT(CHOOSEN(MaritalStatusAttributes, MaxResults), NAMED('LexID_Marital_Status_Attributes'));
OUTPUT(CHOOSEN(MarketViewAttributes, MaxResults), NAMED('LexID_MarketView_Attributes'));
OUTPUT(CHOOSEN(RiskViewAttributes, MaxResults), NAMED('LexID_RiskView_Attributes'));

#if(ReturnAttributeSnapshots)
OUTPUT(CHOOSEN(BocaShellSnapshots, MaxResults), NAMED('LexID_Boca_Shell_Snapshots'));
OUTPUT(CHOOSEN(InsuranceHeaderSnapshots, MaxResults), NAMED('LexID_Insurance_Header_Snapshots'));
OUTPUT(CHOOSEN(LengthOfResidencySnapshots, MaxResults), NAMED('LexID_Length_of_Residency_Snapshots'));
OUTPUT(CHOOSEN(MaritalStatusSnapshots, MaxResults), NAMED('LexID_Marital_Status_Snapshots'));
OUTPUT(CHOOSEN(MarketViewSnapshots, MaxResults), NAMED('LexID_MarketView_Snapshots'));
OUTPUT(CHOOSEN(RiskViewSnapshots, MaxResults), NAMED('LexID_RiskView_Snapshots'));
#end

OUTPUT(CHOOSEN(FirstDegreeRelativesAndAssociates, MaxResults), NAMED('LexID_First_Degree_Relatives_And_Associates'));
#end