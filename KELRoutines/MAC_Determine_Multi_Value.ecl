// This MACRO takes in the results of a KEL ENTITY structure, and determines how many 

EXPORT MAC_Determine_Multi_Value(inputData, outputResults, sampleRecordCount = 100, uidField = 'UID', sampleSubModelValuesCount = 200) := MACRO
	LOADXML('<xml/>');
	#EXPORTXML(records, RECORDOF(inputData));
	
	#DECLARE(returnString);
	#SET(returnString, ''); // Initialize it to an empty string
	
	// Append new columns to the dataset that contain record-counts of the sub-models called Field_Name_Count
	#UNIQUENAME(countChildRecords);
	#UNIQUENAME(recLayout);
	#UNIQUENAME(countedResults);
	#APPEND(returnString, %'recLayout'% + ' := RECORD\n'); // recLayout := RECORD
	#APPEND(returnString, 'RECORDOF(' + #TEXT(inputData) + ');'); // inputData record structure
	
	#FOR(records)
		#FOR(Field)
			#IF(%@isDataset%=1) // We have a dataset, append a counter field to the layout
				#APPEND(returnString, '  UNSIGNED8 ' + %'{@name}'% + 'Count := 0;\n'); // UNSIGNED8 Field_Name_Count := 0;
			#END
		#END
	#END
	#APPEND(returnString, 'END;\n\n'); // END;
	
	#APPEND(returnString, %'recLayout'% + ' ' + %'countChildRecords'% + '( ' + #TEXT(inputData) + ' le) := TRANSFORM\n'); // recLayout countChildRecords(inputData le) := TRANSFORM
	#FOR(records)
		#FOR(Field)
			#IF(%@isDataset%=1) // We have a dataset, count it
				#APPEND(returnString, '  SELF.' + %'{@name}'% + 'Count := COUNT(le.' + %'{@name}'% + ');\n'); // SELF.Field_Name_Count := COUNT(le.Field_Name_);
			#END
		#END
	#END
	#APPEND(returnString, 'SELF := le;'); // SELF := le;
	#APPEND(returnString, 'END;\n\n'); //END;

	%returnString%
    %countedResults% := PROJECT(inputData, %countChildRecords%(LEFT));
	
	// For each child-dataset, output the largest sub-model record counts as well as a sample of those largest counts
	#DECLARE(outputString);
	#SET(outputString, ''); // Initialize it to an empty string
	
	#FOR(records)
		#FOR(Field)
			#IF(%@isDataset%=1) // We have a dataset, sort and output the records with the highest count value
				 // OUTPUT(SORT(countedResults, -Field_Name_Count, uidField)[1].Field_Name_Count, NAMED('Field_Name_Largest_Count'));
				#APPEND(outputString, 'OUTPUT(SORT(' + %'countedResults'% + ', -' + %'{@name}'% + 'Count, ' + uidField + ')[1].' + %'{@name}'% + 'Count, NAMED(\'' + %'{@name}'% + 'Largest_Count\'));\n');
				// OUTPUT(CHOOSEN(PROJECT(SORT(countedResults, -Field_Name_Count, uidField), TRANSFORM({TYPEOF(LEFT.uidField) uidField, DATASET(RECORDOF(LEFT.Field_Name_)) Field_Name_}, SELF.uidField := LEFT.uidField; SELF.Field_Name_ := CHOOSEN(LEFT.Field_Name_, sampleSubModelValuesCount))), sampleRecordCount), NAMED('Field_Name_Counts'));
				#APPEND(outputString, 'OUTPUT(CHOOSEN(PROJECT(SORT(' + %'countedResults'% + ', -' + %'{@name}'% + 'Count, ' + uidField + '), TRANSFORM({TYPEOF(LEFT.' + uidField + ') ' + uidField + ', DATASET(RECORDOF(LEFT.' + %'{@name}'% + ')) ' + %'{@name}'% + '}, SELF.' + uidField + ' := LEFT.' + uidField + '; SELF.' + %'{@name}'% + ' := CHOOSEN(LEFT.' + %'{@name}'% + ', ' + #TEXT(sampleSubModelValuesCount) + '))), ' + #TEXT(sampleRecordCount) + '), NAMED(\'' + %'{@name}'% + 'Counts\'));\n');
			#END
		#END
	#END
	
	%outputString%
	outputResults := %countedResults%
ENDMACRO;