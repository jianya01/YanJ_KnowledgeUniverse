// This function takes in a SALT profile, the number of data patterns to show (-1 == show all), 
// and then outputs some potential field type information for both KEL and ECL

IMPORT SALT35;

EXPORT SALT_Profile_Field_Types(DATASET(SALT35.MAC_Character_Counts.ResultLine_Layout) InputSALTProfile, INTEGER NumberOfDataPatternsToShow = 5) := FUNCTION
	SlimmedSALTProfile := PROJECT(InputSALTProfile, TRANSFORM({RECORDOF(LEFT) - cardinality - minval30 - maxval30 - asnumber_minval - asnumber_maxval - asnumber_mean - asnumber_var - len - words - characters - frequent_terms}, SELF := LEFT));
	
	FieldTypeLayout := RECORD
		UNSIGNED8 Field_Number;
		STRING Field_Name;
		STRING Potential_KEL_Field_Type;
		STRING Potential_ECL_Field_Type;
		RECORDOF(SlimmedSALTProfile) - fldno - fieldname;
	END;
	
	FieldTypeLayout getFieldTypes(SlimmedSALTProfile SALTProfile) := TRANSFORM
		SELF.Field_Number := (UNSIGNED)SALTProfile.Fldno;
		SELF.Field_Name := SALTProfile.FieldName;
		
		dataPatterns := PROJECT(SALTProfile.Patterns (TRIM(data_pattern) <> ''), 
			TRANSFORM({STRING DataPattern, BOOLEAN isInteger, BOOLEAN isString, BOOLEAN hasString, BOOLEAN hasDigits, BOOLEAN hasReal, BOOLEAN hasDate, BOOLEAN hasBoolean, BOOLEAN hasNegativeValues, UNSIGNED8 patternLength},
				thisPattern := LEFT.data_pattern;
				patternLength := LENGTH(TRIM(thisPattern));
				onlyString := LENGTH(TRIM(StringLib.StringFilterOut(thisPattern, '9'))) = patternLength;
				onlyDigits := LENGTH(TRIM(StringLib.StringFilter(thisPattern, '9'))) = patternLength;
				
				thisPatternMinusFirstChar := thisPattern[2..];
				patternLengthMinusFirstChar := LENGTH(TRIM(thisPatternMinusFirstChar));
				onlyStringMinusFirstChar := LENGTH(TRIM(StringLib.StringFilterOut(thisPatternMinusFirstChar, '9'))) = patternLengthMinusFirstChar;
				onlyDigitsMinusFirstChar := LENGTH(TRIM(StringLib.StringFilter(thisPatternMinusFirstChar, '9'))) = patternLengthMinusFirstChar;
				
				SELF.DataPattern := thisPattern;
				SELF.PatternLength := patternLength;
				SELF.isInteger := onlyDigits;
				SELF.isString := onlyString;
				containsString := LENGTH(TRIM(StringLib.StringFilterOut(thisPattern, '9'))) > 0;
				containsStringMinusFirstChar := LENGTH(TRIM(StringLib.StringFilterOut(thisPatternMinusFirstChar, '9'))) > 0;
				SELF.hasString := containsString;
				containsDigits := LENGTH(TRIM(StringLib.StringFilter(thisPattern, '9'))) > 0;
				containsDigitsMinusFirstChar := LENGTH(TRIM(StringLib.StringFilter(thisPatternMinusFirstChar, '9'))) > 0;
				SELF.hasDigits := containsDigits;
				containsPeriod := TRIM(StringLib.StringFilterOut(thisPattern, '9')) = '.';
				containsPeriodMinusFirstChar := TRIM(StringLib.StringFilterOut(thisPatternMinusFirstChar, '9')) = '.';
				SELF.hasReal := (containsString AND containsDigits AND containsPeriod) OR (containsStringMinusFirstChar AND containsDigitsMinusFirstChar AND containsPeriodMinusFirstChar);
				SELF.hasBoolean := onlyString AND patternLength IN [4, 5];
				SELF.hasDate := onlyDigits AND patternLength = 8;
				SELF.hasNegativeValues := thisPattern[1] = '-' AND (onlyDigitsMinusFirstChar OR (LENGTH(TRIM(StringLib.StringFilter(thisPatternMinusFirstChar, '9'))) > 0 AND TRIM(StringLib.StringFilterOut(thisPatternMinusFirstChar, '9')) = '.'));
			));
		
		SELF.Potential_KEL_Field_Type := MAP(COUNT(dataPatterns) = 0								=> 'Never Populated: STRING',
											COUNT(dataPatterns (hasBoolean)) = COUNT(dataPatterns) 	=> 'BOOLEAN or STRING',
											COUNT(dataPatterns (isString)) > 0						=> 'STRING',
											COUNT(dataPatterns (hasDate)) = COUNT(dataPatterns)		=> 'DATE',
											COUNT(dataPatterns (isInteger)) = COUNT(dataPatterns)	=> 'INTEGER',
											COUNT(dataPatterns (hasReal)) > 0						=> 'REAL or STRING',
											COUNT(dataPatterns (hasString)) > 0						=> 'STRING',
																										'Unknown: STRING');
		SELF.Potential_ECL_Field_Type := MAP(COUNT(dataPatterns) = 0								=> 'Never Populated: STRING',
											COUNT(dataPatterns (hasBoolean)) = COUNT(dataPatterns) => 'BOOLEAN or STRING',
											COUNT(dataPatterns (isString)) > 0						=> 'STRING',
											COUNT(dataPatterns (hasDate)) = COUNT(dataPatterns)		=> 'UNSIGNED',
											COUNT(dataPatterns (isInteger)) = COUNT(dataPatterns)	=> 'UNSIGNED',
											COUNT(dataPatterns (hasNegativeValues)) > 0				=> 'INTEGER',
											COUNT(dataPatterns (hasReal)) > 0						=> 'REAL or STRING',
											COUNT(dataPatterns (hasString)) > 0						=> 'STRING',
																										'Unknown: STRING');
		SELF.Patterns := IF(NumberOfDataPatternsToShow <= 0, SALTProfile.Patterns, CHOOSEN(SALTProfile.Patterns, NumberOfDataPatternsToShow));
	END;
	
	WithFieldTypes := PROJECT(SlimmedSALTProfile, getFieldTypes(LEFT));
								
	RETURN WithFieldTypes;
END;