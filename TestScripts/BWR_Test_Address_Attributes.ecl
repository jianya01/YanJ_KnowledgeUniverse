#workunit('name', 'Testing_Address_Attributes');

IMPORT ACA, ADVO, KELGlobal, UT;

HistoricalDate := (STRING)UT.GetDate; // Pick this to run with todays date
//HistoricalDate := (INTEGER)UT.GetDate; // Pick this to run with todays date
//HistoricalDate := 20141001; // Pick this to run with a historical archive date in YYYYMMDD format

InputAddress := PROJECT(UT.DS_OneRecord, TRANSFORM({STRING Prim_Range, STRING Predir, STRING Prim_Name, STRING Suffix, STRING Postdir, STRING Sec_Range, STRING Zip5},
	SELF.Prim_Range := '13020';
	SELF.Predir := '';
	SELF.Prim_Name := '107TH';
	SELF.Suffix := 'AVE';
	SELF.Postdir := '';
	SELF.Sec_Range := '';
	SELF.Zip5 := '11419'))[1];

OUTPUT(ADVO.Key_Addr1 (KEYED(ZIP = (STRING)InputAddress.Zip5 AND Prim_Range = (STRING)InputAddress.Prim_Range AND Prim_Name = InputAddress.Prim_Name) AND Addr_Suffix = InputAddress.Suffix AND Predir = InputAddress.Predir AND Postdir = InputAddress.Postdir AND Sec_Range = InputAddress.Sec_Range), NAMED('Raw_ADVO'));
OUTPUT(ACA.Key_ACA_Addr (KEYED(Prim_Name = InputAddress.Prim_Name AND Prim_Range = (STRING)InputAddress.Prim_Range AND ZIP = (STRING)InputAddress.Zip5 AND Sec_Range = InputAddress.Sec_Range) AND Addr_Suffix = InputAddress.Suffix AND Predir = InputAddress.Predir AND Postdir = InputAddress.Postdir), NAMED('Raw_ACA'));

AddressEntityResults := KELGlobal.Q_Address_Attributes(InputAddress.Prim_Range, InputAddress.Predir, InputAddress.Prim_Name, InputAddress.Suffix, InputAddress.Postdir, InputAddress.Sec_Range, (INTEGER)InputAddress.Zip5, HistoricalDate).Res0;
OUTPUT(AddressEntityResults, NAMED('Address_Entity_Results'));

ADVOCount := TABLE(KELGlobal.Q_Address_Dump(HistoricalDate).Res0, 
					{primary_range_,
					predirectional_,
					primary_name_,
					suffix_,
					postdirectional_,
					secondary_range_,
					z_i_p5_,
					UNSIGNED8 RecordCount := COUNT(A_D_V_O_Date_Summary_)}, 
					primary_range_, predirectional_, primary_name_, suffix_, postdirectional_, secondary_range_, z_i_p5_);
ACACount := TABLE(KELGlobal.Q_Address_Dump(HistoricalDate).Res0, 
					{primary_range_,
					predirectional_,
					primary_name_,
					suffix_,
					postdirectional_,
					secondary_range_,
					z_i_p5_,
					UNSIGNED8 RecordCount := COUNT(a_c_a_)}, 
					primary_range_, predirectional_, primary_name_, suffix_, postdirectional_, secondary_range_, z_i_p5_);

HighestADVOCount := SORT(ADVOCount, -RecordCount);
HighestACACount := SORT(ACACount, -RecordCount);

OUTPUT(HighestADVOCount, NAMED('HighestADVOCount'));
OUTPUT(HighestACACount, NAMED('HighestACACount'));
OUTPUT(KELGlobal.Q_Address_Dump(HistoricalDate).Res0 (HighestADVOCount[1].primary_range_ = primary_range_ AND HighestADVOCount[1].predirectional_ = predirectional_ AND HighestADVOCount[1].primary_name_ = primary_name_ AND HighestADVOCount[1].suffix_ = suffix_ AND HighestADVOCount[1].postdirectional_ = postdirectional_ AND HighestADVOCount[1].secondary_range_ = secondary_range_ AND HighestADVOCount[1].z_i_p5_ = z_i_p5_), NAMED('HighestADVOCountRecords'));
OUTPUT(KELGlobal.Q_Address_Dump(HistoricalDate).Res0 (HighestACACount[1].primary_range_ = primary_range_ AND HighestACACount[1].predirectional_ = predirectional_ AND HighestACACount[1].primary_name_ = primary_name_ AND HighestACACount[1].suffix_ = suffix_ AND HighestACACount[1].postdirectional_ = postdirectional_ AND HighestACACount[1].secondary_range_ = secondary_range_ AND HighestACACount[1].z_i_p5_ = z_i_p5_), NAMED('HighestACACountRecords'));

OUTPUT(ADVO.Key_Addr1 (KEYED(ZIP = (STRING)HighestADVOCount[1].z_i_p5_ AND Prim_Range = (STRING)HighestADVOCount[1].primary_range_ AND Prim_Name = HighestADVOCount[1].primary_name_) AND Addr_Suffix = HighestADVOCount[1].suffix_ AND Predir = HighestADVOCount[1].predirectional_ AND Postdir = HighestADVOCount[1].postdirectional_ AND Sec_Range = HighestADVOCount[1].secondary_range_), NAMED('Raw_Highest_ADVO'));
OUTPUT(ACA.Key_ACA_Addr (KEYED(Prim_Name = HighestACACount[1].primary_name_ AND Prim_Range = (STRING)HighestACACount[1].primary_range_ AND ZIP = (STRING)HighestACACount[1].z_i_p5_ AND Sec_Range = HighestACACount[1].secondary_range_) AND Addr_Suffix = HighestACACount[1].suffix_ AND Predir = HighestACACount[1].predirectional_ AND Postdir = HighestACACount[1].postdirectional_), NAMED('Raw_Highest_ACA'));
