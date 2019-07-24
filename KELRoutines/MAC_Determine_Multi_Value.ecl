// This MACRO takes in the results of a KEL ENTITY structure, and determines how many records are in a submodel across all UID values 
// inputData - DATASET: The ENTITY data you are profiling
// outputResults - DATASET: ECL variable name to store the results
// sampleRecordCount - UNSIGNED: The number of records to OUTPUT as a sampling
// uidField - STRING: The name of the unique identifier field.  Most of the time this will be UID
// sampleSubModelValuesCount - UNSIGNED: The number of records from the submodel to OUTPUT
// ignoreSubModels - SET OF STRING: A set of strings containing submodels you wish to ignore during profiling.  This can help speed up profiling if there are submodels you already know are multi-valued.  This should be the ECL generated name, NOT THE KEL NAME - there will be _ in the name 

EXPORT MAC_Determine_Multi_Value(inputData, outputResults, sampleRecordCount = 100, uidField = 'UID', sampleSubModelValuesCount = 200, ignoreSubModels = []) := MACRO
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
			#IF(%@isDataset%=1 AND %'{@name}'% NOT IN ignoreSubModels) // We have a dataset and it isn't one we wish to ignore, append a counter field to the layout
				#APPEND(returnString, '  UNSIGNED8 ' + %'{@name}'% + 'Count := 0;\n'); // UNSIGNED8 Field_Name_Count := 0;
			#END
		#END
	#END
	#APPEND(returnString, 'END;\n\n'); // END;
	
	#APPEND(returnString, %'recLayout'% + ' ' + %'countChildRecords'% + '( ' + #TEXT(inputData) + ' le) := TRANSFORM\n'); // recLayout countChildRecords(inputData le) := TRANSFORM
	#FOR(records)
		#FOR(Field)
			#IF(%@isDataset%=1 AND %'{@name}'% NOT IN ignoreSubModels) // We have a dataset and it isn't one we wish to ignore, count it
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
			#IF(%@isDataset%=1 AND %'{@name}'% NOT IN ignoreSubModels) // We have a dataset and it isn't one we wish to ignore, sort and output the records with the highest count value
				 // OUTPUT(SORT(countedResults, -Field_Name_Count, uidField)[1].Field_Name_Count, NAMED('Field_Name_Largest_Count'));
				#APPEND(outputString, 'OUTPUT(SORT(' + %'countedResults'% + ', -' + %'{@name}'% + 'Count, ' + uidField + ')[1].' + %'{@name}'% + 'Count, NAMED(\'' + %'{@name}'% + 'Largest_Count\'));\n');
				// OUTPUT(CHOOSEN(PROJECT(SORT(countedResults, -Field_Name_Count, uidField), TRANSFORM({TYPEOF(LEFT.uidField) uidField, DATASET(RECORDOF(LEFT.Field_Name_)) Field_Name_}, SELF.uidField := LEFT.uidField; SELF.Field_Name_ := CHOOSEN(LEFT.Field_Name_, sampleSubModelValuesCount))), sampleRecordCount), NAMED('Field_Name_Counts'));
				#APPEND(outputString, 'OUTPUT(CHOOSEN(PROJECT(SORT(' + %'countedResults'% + ', -' + %'{@name}'% + 'Count, ' + uidField + '), TRANSFORM({TYPEOF(LEFT.' + uidField + ') ' + uidField + ', DATASET(RECORDOF(LEFT.' + %'{@name}'% + ')) ' + %'{@name}'% + '}, SELF.' + uidField + ' := LEFT.' + uidField + '; SELF.' + %'{@name}'% + ' := CHOOSEN(LEFT.' + %'{@name}'% + ', ' + #TEXT(sampleSubModelValuesCount) + ', FEW, UNORDERED, UNSTABLE))), ' + #TEXT(sampleRecordCount) + '), NAMED(\'' + %'{@name}'% + 'Counts\'));\n');
			#END
		#END
	#END
	
	%outputString%
	outputResults := %countedResults%
ENDMACRO;