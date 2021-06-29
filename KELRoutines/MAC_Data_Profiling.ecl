/* ********************************************************************************
 * The purpose of this macro is to take in a dataset, along with an indicator for *
 * if it is an Entity/Association Index or a raw base file.                       *
 * It will then spit out several useful facts about that data for analysis.       *
 ******************************************************************************** */

EXPORT MAC_Data_Profiling(InData, IsKELIndex = FALSE, UniqueName = '') := FUNCTIONMACRO
	IMPORT STD;
	IMPORT * FROM KEL16.Null;
	IMPORT KEL16 AS KEL;	
	IMPORT MDR;

	SourceStatsLayout := RECORD
		STRING Source;
		STRING Source_Name;
		UNSIGNED4 Date_First_Seen;
		UNSIGNED4 Date_Last_Seen;
		UNSIGNED2 YYYY;
		UNSIGNED8 Raw_Record_Count;
		UNSIGNED8 KEL_Rolled_Record_Count;
		REAL8 Percent_Of_Dataset;
		REAL8 KEL_Rolled_Percent_Of_Dataset;
		UNSIGNED8 Dataset_Record_Count;
	END;
	
	#IF(IsKELIndex)
		Pulled := PROJECT(InData.__Payload, TRANSFORM({RECORDOF(LEFT)}, SELF := LEFT));
		// The __UNWRAP step below pulls the .v and .f columns out into the more expected value, value__flags columns
		Unwrapped := KEL.Null.__UNWRAP(Pulled);
		ProfilingData := KEL.Clean(Unwrapped, /*flags*/ TRUE, /*counts*/ FALSE, /*unmang*/ TRUE);
	#ELSE
		ProfilingData := InData;
	#END
	
	// Load up the XML containing the record structure of the data that is being profiled
	#EXPORTXML(RECORDS, RECORDOF(ProfilingData));
	
	KnownSourceFields := ['source_', 'src', 'source'];
	
	KnownDateFirstSeenFields := ['date_first_seen_', 'date_first_seen', 'datefirstseen', 'dt_first_seen', 'dtfirstseen'];
	
	KnownDateLastSeenFields := ['date_last_seen_', 'date_last_seen', 'datelastseen', 'dt_last_seen', 'dtlastseen'];
	
	KnownKELRecordCountFields := ['__recordcount'];
	
	#UNIQUENAME(SourceFound);
	#UNIQUENAME(DateFirstSeenFound);
	#UNIQUENAME(DateLastSeenFound);
	#UNIQUENAME(KELRecordCountFound);
	
	#SET(SourceFound, FALSE);
	#SET(DateFirstSeenFound, FALSE);
	#SET(DateLastSeenFound, FALSE);
	#SET(KELRecordCountFound, FALSE);
	
	#UNIQUENAME(TransformCode);
	#SET(TransformCode, 'TRANSFORM(SourceStatsLayout,');
	
	#FOR(RECORDS)
		#FOR(Field)
			#IF (%'{@isEnd}'% <> '') // The End
			#ELSE // Not The End
				#IF(%'{@label}'% IN KnownSourceFields AND %SourceFound% = FALSE) // We found the Source column, map it
					#APPEND(TransformCode, 'SELF.Source := TRIM((STRING)LEFT.' + %'{@label}'% + ');');
					#SET(SourceFound, TRUE);
				#ELSEIF(%'{@label}'% IN KnownDateFirstSeenFields AND %DateFirstSeenFound% = FALSE) // We found the Date First Seen column, map it
					#IF(IsKELIndex) // Need to translate from the days representation back to STRING8
						#APPEND(TransformCode, 'SELF.Date_First_Seen := (UNSIGNED4)KEL.Routines.DateToString(KEL.Routines.FromDaysSince1900((UNSIGNED4)LEFT.' + %'{@label}'% + '), \'%Y%m%d\');'); //KEL.Routines.DateToString(KEL.Routines.FromDaysSince1900(43619), '%Y%m%d')
						#APPEND(TransformCode, 'SELF.YYYY := (UNSIGNED2)(KEL.Routines.DateToString(KEL.Routines.FromDaysSince1900((UNSIGNED4)LEFT.' + %'{@label}'% + '), \'%Y%m%d\')[1..4]);');
					#ELSE
						#APPEND(TransformCode, 'SELF.Date_First_Seen := (UNSIGNED4)LEFT.' + %'{@label}'% + ';');
						#APPEND(TransformCode, 'SELF.YYYY := (UNSIGNED2)(TRIM((STRING)LEFT.' + %'{@label}'% + ')[1..4]);');
					#END
					#SET(DateFirstSeenFound, TRUE);
				#ELSEIF(%'{@label}'% IN KnownDateLastSeenFields AND %DateLastSeenFound% = FALSE) // We found the Date Last Seen column, map it
					#IF(IsKELIndex) // Need to translate from the days representation back to STRING8
						#APPEND(TransformCode, 'SELF.Date_Last_Seen := (UNSIGNED4)KEL.Routines.DateToString(KEL.Routines.FromDaysSince1900((UNSIGNED4)LEFT.' + %'{@label}'% + '), \'%Y%m%d\');');
					#ELSE
						#APPEND(TransformCode, 'SELF.Date_Last_Seen := (UNSIGNED4)LEFT.' + %'{@label}'% + ';');
					#END
					#SET(DateLastSeenFound, TRUE);
				#ELSEIF(%'{@label}'% IN KnownKELRecordCountFields AND %KELRecordCountFound% = FALSE) // We found the KEL Record Count column, map it
					#APPEND(TransformCode, 'SELF.KEL_Rolled_Record_Count := (UNSIGNED8)LEFT.' + %'{@label}'% + ';');
					#SET(KELRecordCountFound, TRUE);
				#ELSE
					// Not a field we want to track
				#END
			#END
		#END
	#END
	
	#APPEND(TransformCode, 'SELF.Source_Name := MDR.sourceTools.TranslateSource(SELF.Source);');
	#APPEND(TransformCode, 'SELF.Raw_Record_Count := 1;');
	#APPEND(TransformCode, 'SELF := LEFT;');
	#APPEND(TransformCode, 'SELF := [])');
	// OUTPUT(%'TransformCode'%, NAMED('Field_Mapping_Logic_' + UniqueName));
	
	CleanProfile := PROJECT(ProfilingData, #EXPAND(%'TransformCode'%));
	// OUTPUT(CHOOSEN(CleanProfile, 10), NAMED('Slimmed_Data_' + UniqueName), OVERWRITE);
	
	DistributedDataset := SORT(DISTRIBUTE(CleanProfile, HASH64(Source, YYYY)), Source, YYYY, RECORD, LOCAL);
	// OUTPUT(CHOOSEN(DistributedDataset, 10), NAMED('DistributedDataset_' + UniqueName), OVERWRITE);
	
	StatsStep1 := ROLLUP(DistributedDataset, LEFT.Source = RIGHT.Source AND LEFT.YYYY = RIGHT.YYYY, TRANSFORM(SourceStatsLayout, 
			SELF.Date_First_Seen := MAP(LEFT.Date_First_Seen > 0 AND RIGHT.Date_First_Seen > 0 => MIN(LEFT.Date_First_Seen, RIGHT.Date_First_Seen),
										LEFT.Date_First_Seen <= 0 AND RIGHT.Date_First_Seen > 0 => RIGHT.Date_First_Seen,
																									LEFT.Date_First_Seen);
			SELF.Date_Last_Seen := MAX(LEFT.Date_Last_Seen, RIGHT.Date_Last_Seen);
			SELF.Raw_Record_Count := LEFT.Raw_Record_Count + RIGHT.Raw_Record_Count;
			SELF.KEL_Rolled_Record_Count := LEFT.KEL_Rolled_Record_Count + RIGHT.KEL_Rolled_Record_Count;
			SELF := LEFT;
		), LOCAL);
	
	TotalRecords := SUM(StatsStep1, Raw_Record_Count);
	
	Stats := PROJECT(StatsStep1, TRANSFORM(SourceStatsLayout, 
			SELF.Percent_Of_Dataset := (LEFT.Raw_Record_Count / TotalRecords) * 100.0;
			SELF.KEL_Rolled_Percent_Of_Dataset := (LEFT.KEL_Rolled_Record_Count / TotalRecords) * 100.0;
			SELF.Dataset_Record_Count := TotalRecords;
			SELF := LEFT;
		));
	
	StatsSorted := SORT(Stats, Source, YYYY, Date_First_Seen, -Date_Last_Seen, Raw_Record_Count, KEL_Rolled_Record_Count, Percent_Of_Dataset, KEL_Rolled_Percent_Of_Dataset);
	
	UniqueSourceCount := GLOBAL(COUNT(DEDUP(StatsSorted, Source)));
	
	Total := ROLLUP(Stats, TRUE, TRANSFORM(SourceStatsLayout,
			SELF.Source := 'TOTAL';
			SELF.Source_Name := 'SUMMARY FOR THE ENTIRE DATASET: ' + UniqueSourceCount + ' UNIQUE SOURCES FOUND';
			SELF.Date_First_Seen := MAP(LEFT.Date_First_Seen > 0 AND RIGHT.Date_First_Seen > 0 => MIN(LEFT.Date_First_Seen, RIGHT.Date_First_Seen),
										LEFT.Date_First_Seen <= 0 AND RIGHT.Date_First_Seen > 0 => RIGHT.Date_First_Seen,
																									LEFT.Date_First_Seen);
			SELF.Date_Last_Seen := MAX(LEFT.Date_Last_Seen, RIGHT.Date_Last_Seen);
			SELF.YYYY := MIN(LEFT.YYYY, RIGHT.YYYY);
			SELF.Raw_Record_Count := LEFT.Raw_Record_Count + RIGHT.Raw_Record_Count;
			SELF.KEL_Rolled_Record_Count := LEFT.KEL_Rolled_Record_Count + RIGHT.KEL_Rolled_Record_Count;
			SELF.Percent_Of_Dataset := LEFT.Percent_Of_Dataset + RIGHT.Percent_Of_Dataset;
			SELF.KEL_Rolled_Percent_Of_Dataset := LEFT.KEL_Rolled_Percent_Of_Dataset + RIGHT.KEL_Rolled_Percent_Of_Dataset;
			SELF := LEFT));
	
	OUTPUT(Total + StatsSorted, NAMED('STATS_' + UniqueName), ALL, OVERWRITE);
	
	
	/* // This code outputs the RECORD structure for examples of ECL Templating Language
	#FOR(RECORDS)
		#FOR(Field)
			#IF (%'{@isEnd}'% <> '')
				OUTPUT('END;');
			#ELSE
				OUTPUT(%'{@type}'%
					#IF (%'{@size}'% <> '-15' AND
						%'{@isRecord}'%='' AND
						%'{@isDataset}'%='')
							+ %'{@size}'%
					#END
				+ ' ' + %'{@label}'% + ';');
			#END
		#END
	#END
	*/
	
	RETURN ProfilingData;
ENDMACRO;