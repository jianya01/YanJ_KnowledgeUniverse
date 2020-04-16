/* ******************************************
This FUNCTIONMACRO takes in a KEL Index optionally cleans the names back to Original KEL names and 
pulls out the .v values, dropping the .f values by performing something like:

PayloadDataWithoutFlags := RECORD
	STRING Field1;
	UNSIGNED Field2;
END;

InDataWithoutFlags := RECORD
	STRING IndexField1;
	BOOLEAN IndexField2;
	DATASET(PayloadDataWithoutFlags) __Payload;
END;

PayloadDataWithoutFlags simplifyPayload(RECORDOF(InData.__Payload) payload) := TRANSFORM
	SELF.Field1 := payload.Field1.v;
	SELF.Field2 := payload.Field2.v;
END;

Results := PROJECT(InData, TRANSFORM(InDataWithoutFlags, 
	SELF.IndexField1 := LEFT.IndexField1;
	SELF.IndexField2 := LEFT.IndexField2;
	SELF.__Payload := PROJECT(LEFT.__Payload, simplifyPayload(LEFT));
	));
*********************************************** */

EXPORT MAC_Simplify_Index(InData, CleanFieldNames = TRUE) := FUNCTIONMACRO
	IMPORT STD;
	IMPORT KEL12 AS KEL;
	
	// Load up the XML containing the record structure of the data that was passed in
	#EXPORTXML(RECORDS, RECORDOF(InData));
	
	#DECLARE(PayloadDataWithoutFlags); // Build up the PayloadDataWithoutFlags RECORD structure
	#SET(PayloadDataWithoutFlags, '');
	
	#DECLARE(InDataWithoutFlags); // Build up the InDataWithoutFlags RECORD structure
	#SET(InDataWithoutFlags, '');
	
	#DECLARE(simplifyPayload); // Build up the Payload TRANSFORM
	#SET(simplifyPayload, '');
	
	#DECLARE(resultTransform); // Build up the Result TRANSFORM
	#SET(resultTransform, '');
	
	#DECLARE(datasetEntered); // Track if this is the first time encountering the child dataset, if so record its name
	#SET(datasetEntered, 0); // Start us so that we haven't entered a child dataset
	#DECLARE(datasetName);
	#SET(datasetName, '');
	
	#DECLARE(nestedRecordEntered); // Track if this is the first time entering a nested record
	#SET(nestedRecordEntered, 0); // Start us so that we haven't entered a nested record
	#DECLARE(recordName);
	#SET(recordName, '');
	
	#DECLARE(dataType); // Need to translate from KEL data type to ECL data type
	#SET(dataType, '');
	#DECLARE(rawDataType);
	#SET(rawDataType, '');
	
	// Set up the initial definitions
	#APPEND(PayloadDataWithoutFlags, 'PayloadDataWithoutFlags := RECORD\n');
	#APPEND(InDataWithoutFlags, 'InDataWithoutFlags := RECORD\n');
	
	// We know these fields will exist, don't do anything special with them when creating the RECORD structures
	SetOfFieldsToIgnore := ['v', 'f', '__internal_fpos__'];
	
	// We need to iterate through the RECORDS layout to gather column names
	#FOR(RECORDS)
		#FOR(Field)
			// ----------- Debugging ------------
			// OUTPUT('Dataset:' + %'{@isDataset}'% + '\nRecord:' + %'{@isRecord}'% + '\nEnd:' + %'{@isEnd}'% + '\nField:' + %'{@type}'% #IF (%'{@size}'% <> '-15' AND %'{@isRecord}'%='' AND %'{@isDataset}'%='') + %'{@size}'% #END + ' ' + %'{@name}'%);
			
			#IF(%{@isDataset}% = 0 AND %{@isRecord}% = 0 AND %{@isEnd}% = 0)
				#IF(%'{@name}'% NOT IN SetOfFieldsToIgnore) // We have a field we care to keep!
					#SET(rawDataType, %'{@type}'% #IF (%'{@size}'% <> '-15') + %'{@size}'% #END);
					#IF(%'rawDataType'%[1..4] = 'nint')
						#SET(dataType, 'INTEGER');
					#ELSEIF(%'rawDataType'%[1..4] = 'nuid')
						#SET(dataType, 'UNSIGNED8');
					#ELSEIF(%'rawDataType'%[1..7] = 'nbiguid')
						#SET(dataType, 'DATA16');
					#ELSEIF(%'rawDataType'%[1..4] = 'nstr')
						#SET(dataType, 'STRING');
					#ELSEIF(%'rawDataType'%[1..5] = 'nbool')
						#SET(dataType, 'BOOLEAN');
					#ELSEIF(%'rawDataType'%[1..6] = 'nkdate')
						#SET(dataType, 'UNSIGNED4');
					#ELSEIF(%'rawDataType'%[1..10] = 'ntimestamp')
						#SET(dataType, 'UNSIGNED8');
					#ELSEIF(%'rawDataType'%[1..6] = 'nfloat')
						#SET(dataType, 'REAL8');
					#ELSEIF(%'rawDataType'%[1..4] = 'nunk')
						#SET(dataType, 'STRING');
					#ELSEIF(%'rawDataType'%[1..9] = '<unnamed>') // This is likely an embedded entity reference
						#SET(dataType, 'UNSIGNED8');
					#ELSE
						#SET(dataType, %'rawDataType'%);
					#END
					
					#IF(%datasetEntered% = 1) // Likely a record inside the __Payload
						#APPEND(PayloadDataWithoutFlags, %'dataType'% + ' ' + %'{@name}'% + ';\n'); // STRING Field1;
						#APPEND(simplifyPayload, '  SELF.' + %'{@name}'% + ' := payload.' + %'{@name}'% + ';\n'); // SELF.Field1 := payload.Field1;
					#ELSE // Likely a record outside the __Payload
						#APPEND(InDataWithoutFlags, %'dataType'% + ' ' + %'{@name}'% + ';\n'); // STRING Field1;
						#APPEND(resultTransform, '  SELF.' + %'{@name}'% + ' := LEFT.' + %'{@name}'% + ';\n'); // SELF.Field1 := LEFT.Field1;
					#END
				#END
			#ELSEIF(%{@isRecord}% = 1 AND %{@isDataset}% = 0 AND %{@isEnd}% = 0) // We have a nested record
				#SET(nestedRecordEntered, %nestedRecordEntered% + 1);
				#SET(recordName, %'{@name}'%);
				// Translate the data type
				#SET(rawDataType, %'{@type}'% #IF (%'{@size}'% <> '-15') + %'{@size}'% #END);
				#IF(%'rawDataType'%[1..4] = 'nint')
					#SET(dataType, 'INTEGER');
				#ELSEIF(%'rawDataType'%[1..4] = 'nuid')
					#SET(dataType, 'UNSIGNED8');
				#ELSEIF(%'rawDataType'%[1..7] = 'nbiguid')
					#SET(dataType, 'DATA16');
				#ELSEIF(%'rawDataType'%[1..4] = 'nstr')
					#SET(dataType, 'STRING');
				#ELSEIF(%'rawDataType'%[1..5] = 'nbool')
					#SET(dataType, 'BOOLEAN');
				#ELSEIF(%'rawDataType'%[1..6] = 'nkdate')
					#SET(dataType, 'UNSIGNED4');
				#ELSEIF(%'rawDataType'%[1..10] = 'ntimestamp')
					#SET(dataType, 'UNSIGNED8');
				#ELSEIF(%'rawDataType'%[1..6] = 'nfloat')
					#SET(dataType, 'REAL8');
				#ELSEIF(%'rawDataType'%[1..4] = 'nunk')
					#SET(dataType, 'STRING');
				#ELSEIF(%'rawDataType'%[1..9] = '<unnamed>') // This is likely an embedded entity reference
					#SET(dataType, 'UNSIGNED8');
				#ELSE
					#SET(dataType, %'rawDataType'%);
				#END
				
				// Append some more ECL
				#IF(%datasetEntered% = 1) // Likely a record inside the __Payload
					#APPEND(PayloadDataWithoutFlags, %'dataType'% + ' ' + %'{@name}'% + ';\n'); // STRING Field1;
					#APPEND(simplifyPayload, '  SELF.' + %'{@name}'% + ' := payload.' + %'{@name}'% + '.v;\n'); // SELF.Field1 := payload.Field1.v;
				#ELSE // Likely a record outside the __Payload
					#APPEND(InDataWithoutFlags, %'dataType'% + ' ' + %'{@name}'% + ';\n'); // STRING Field1;
					#APPEND(resultTransform, '  SELF.' + %'{@name}'% + ' := LEFT.' + %'{@name}'% + '.v;\n'); // SELF.Field1 := LEFT.Field1.v;
				#END
			#ELSEIF(%{@isDataset}% = 1 AND %{@isRecord}% = 0 AND %{@isEnd}% = 0) // We have a child dataset
				// We have entered the __payload section
				#SET(datasetEntered, %datasetEntered% + 1);
				#SET(datasetName, %'{@name}'%);
			#ELSEIF(%{@isEnd}% = 1)
				#IF(%'recordName'% = %'{@name}'%) // Popping out of a nested record structure
					#SET(nestedRecordEntered, %nestedRecordEntered% - 1); // We have left the nested record
					#SET(recordName, '');
				#ELSEIF(%'datasetName'% = %'{@name}'%) // Popping out of a child dataset structure
					#SET(datasetEntered, %datasetEntered% - 1); // We have left the child dataset
				#END
			#END
		#END
	#END
	
	#APPEND(PayloadDataWithoutFlags, 'END;\n');
	
	// Determine if there was any __Payload in this Index
	#IF(%'datasetName'% != '') // There was a __Payload
		#APPEND(InDataWithoutFlags, 'DATASET(PayloadDataWithoutFlags) __Payload;\n');
		#APPEND(resultTransform, '  SELF.__Payload := PROJECT(LEFT.__Payload, simplifyPayload(LEFT));\n');
	#ELSE // No __Payload
		#SET(PayloadDataWithoutFlags, '// No __Payload for this Index');
		#SET(simplifyPayload, '// No __Payload for this Index');
	#END
	
	#APPEND(InDataWithoutFlags, 'END;\n');
	
	#EXPAND(%'PayloadDataWithoutFlags'%) // PayloadDataWithoutFlags := RECORD
	
	#EXPAND(%'InDataWithoutFlags'%) // InDataWithoutFlags := RECORD
	
	#IF(%'datasetName'% != '')
		PayloadDataWithoutFlags simplifyPayload(RECORDOF(InData.__Payload) payload) := TRANSFORM
			#EXPAND(%'simplifyPayload'%) // Payload TRANSFORM
		END;
	#END
	
	// Results := InData;
	Results := PROJECT(InData, TRANSFORM(InDataWithoutFlags,
		#EXPAND(%'resultTransform'%)
		));
	
	// ----------- Debugging ------------
	// OUTPUT(%'PayloadDataWithoutFlags'%);
	// OUTPUT(%'InDataWithoutFlags'%);
	// OUTPUT(%'simplifyPayload'%);
	// OUTPUT(%'resultTransform'%);
	
	#IF(CleanFieldNames)
		RETURN KEL.Clean(Results, TRUE, TRUE, TRUE);
	#ELSE
		RETURN Results;
	#END
ENDMACRO;