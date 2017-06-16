IMPORT STD;
EXPORT FileUtil := MODULE

	EXPORT FN_ExtractFile(DATASET Dset, STRING FileNamePrefix, STRING Suffix, STRING Append = '') := FUNCTION
	
	   	FileNameNewLogical := TRIM(IF(Append = '', FileNamePrefix + '::' + WORKUNIT[2..9] + '::' + Suffix, 
																		FileNamePrefix + '::' + Append + '::' + Suffix), ALL);
   	
   		RETURN OUTPUT(Dset, ,FileNameNewLogical, CSV(HEADING(0),SEPARATOR(['|']),TERMINATOR(['\n','\r\n','\n\r'])), OVERWRITE, __COMPRESSED__);
   		
	END;
   	
	EXPORT FN_OutputFile(DATASET Dset, STRING FileNamePrefix, STRING Suffix, STRING Append = '') := FUNCTION

   		FileNameNewLogical := TRIM(IF(Append = '', FileNamePrefix + '::' +  Suffix + '::' + WORKUNIT[2..9], 
																		FileNamePrefix + '::' + Suffix + '::' + Append), ALL);

		  RETURN OUTPUT(Dset, , FileNameNewLogical, OVERWRITE, __COMPRESSED__);	
					 
	END;
   
  EXPORT FN_PromoteFile(STRING FileNamePrefix, STRING Suffix, STRING Append = '') := FUNCTION   	
   
   		FileNameNewLogical 				:= TRIM(IF(TRIM(Append,LEFT,RIGHT) = '', FileNamePrefix +  '::' +  Suffix + '::' + WORKUNIT[2..9], 
																				FileNamePrefix + '::' + Suffix + '::' + Append ), ALL);
   		FileNameProd	 						:= TRIM(FileNamePrefix + '::' + Suffix + '::prod' , ALL);
   		FileNameFather 						:= TRIM(FileNamePrefix + '::' + Suffix + '::father' , ALL);
   		FileNameGrandFather 			:= TRIM(FileNamePrefix + '::' + Suffix + '::grandfather' , ALL);
   
   		PromotionList := STD.File.PromoteSuperFileList([FileNameProd,
   																												FileNameFather,
   																												FileNameGrandFather],
   																											  FileNameNewLogical, TRUE);
   
   		RETURN PromotionList;
  END;
	
  EXPORT FN_PromoteSingleFile(STRING FileNamePrefix, STRING Suffix, STRING Append = '') := FUNCTION   	
   
   		FileNameNewLogical 				:= TRIM(IF(TRIM(Append,LEFT,RIGHT) = '', FileNamePrefix + '::' + WORKUNIT[2..9] + '::' + Suffix, 
																				FileNamePrefix + '::' + Append + '::' + Suffix), ALL);
   		FileNameProd	 						:= TRIM(FileNamePrefix + '::prod::' + Suffix, ALL);
   
   		PromotionList := FileServices.PromoteSuperFileList([FileNameProd], FileNameNewLogical, TRUE);
   
   		RETURN PromotionList;
  END;	
	
	  EXPORT FN_PromoteSingleFileToSameSuper(STRING FileNamePrefix, STRING Suffix, STRING Append = '') := FUNCTION   	
   
   		FileNameNewLogical 				:= TRIM(IF(TRIM(Append,LEFT,RIGHT) = '', FileNamePrefix + '::' + WORKUNIT[2..9] + '::' + Suffix, 
																				FileNamePrefix + '::' + Append + '::' + Suffix+'_old'), ALL);
   		FileNameProd	 						:= TRIM(FileNamePrefix + '::prod::' + Suffix, ALL);
   
   		PromotionList := FileServices.PromoteSuperFileList([FileNameProd], FileNameNewLogical, TRUE);
   
   		RETURN PromotionList;
  END;
	
  EXPORT FN_AddFile(STRING FileNamePrefix, STRING Suffix, STRING Append = '') := FUNCTION   	
   
   		FileNameNewLogical 				:= TRIM(IF(TRIM(Append,LEFT,RIGHT) = '', FileNamePrefix + '::' + WORKUNIT[2..9] + '::' + Suffix, 
																				FileNamePrefix + '::' + Append + '::' + Suffix), ALL);
   		FileNameProd	 						:= TRIM(FileNamePrefix + '::prod::' + Suffix, ALL);
   
			AddFile        						:= SEQUENTIAL(FileServices.StartSuperfileTransaction(),
																							Fileservices.AddSuperFile(FileNameProd, FileNameNewLogical),
																							FileServices.FinishSuperfileTransaction());
   
   		RETURN AddFile;
  END;	
	
  EXPORT FN_RemoveFile(STRING FileNamePrefix, STRING Suffix, STRING Append = '') := FUNCTION   	
   
   		FileNameNewLogical 				:= TRIM(IF(TRIM(Append,LEFT,RIGHT) = '', FileNamePrefix + '::' + WORKUNIT[2..9] + '::' + Suffix, 
																				FileNamePrefix + '::' + Append + '::' + Suffix), ALL);
   		FileNameProd	 						:= TRIM(FileNamePrefix + '::prod::' + Suffix, ALL);
   
			RemoveFile        				:= SEQUENTIAL(FileServices.StartSuperfileTransaction(),
																							Fileservices.RemoveSuperFile(FileNameProd, FileNameNewLogical),
																							FileServices.FinishSuperfileTransaction());
   
   		RETURN RemoveFile;
  END;	

	EXPORT FN_RenameFile (STRING FileNamePrefix, STRING Suffix, STRING Append = '') := FUNCTION
   		
			FileNameNewLogical 				:= TRIM(IF(TRIM(Append,LEFT,RIGHT) = '', FileNamePrefix + '::' + WORKUNIT[2..9] + '::' + Suffix, 
																				FileNamePrefix + '::' + Append + '::' + Suffix), ALL);
		  
			RETURN IF(FileServices.FileExists(FileNameNewLogical), FileServices.RenameLogicalFile(FileNameNewLogical, FileNameNewLogical + '_old'));
			
  END;
	
	EXPORT FN_OutputAndAddFile(DATASET Dset, STRING FileNamePrefix, STRING Suffix, STRING Append = '') := FUNCTION
			RETURN	SEQUENTIAL(FN_OutputFile(Dset, FileNamePrefix, Suffix, Append),
												 FN_AddFile(FileNamePrefix, Suffix, Append));
	END;

	EXPORT FN_OutputAndPromoteFile(DATASET Dset, STRING FileNamePrefix, STRING Suffix, STRING Append = '') := FUNCTION
			RETURN	SEQUENTIAL(FN_OutputFile(Dset, FileNamePrefix, Suffix, Append),
												 FN_PromoteFile(FileNamePrefix, Suffix, Append));
	END;
	
	EXPORT FN_RemoveAndRenameFile(STRING FileNamePrefix, STRING Suffix, STRING Append = '') := FUNCTION
			RETURN	SEQUENTIAL(FN_RemoveFile(FileNamePrefix, Suffix, Append),
												 FN_RenameFile(FileNamePrefix, Suffix, Append));
  END;												 
	
	EXPORT FN_RemoveAndRenameAndPromoteSingleFile(STRING FileNamePrefix, STRING Suffix, STRING Append = '') := FUNCTION
			RETURN	SEQUENTIAL(FN_RemoveFile(FileNamePrefix, Suffix, Append),
												 FN_RenameFile(FileNamePrefix, Suffix, Append),
												 FN_PromoteSingleFile(FileNamePrefix, Suffix + '_old', Append));
  END;
	
	EXPORT FN_RemoveAndRenameAndPromoteSingleFileToSameSuper(STRING FileNamePrefix, STRING Suffix, STRING Append = '') := FUNCTION
			RETURN	SEQUENTIAL(FN_RemoveFile(FileNamePrefix, Suffix, Append),
												 FN_RenameFile(FileNamePrefix, Suffix, Append),
												 FN_PromoteSingleFileToSameSuper(FileNamePrefix, Suffix , Append));
  END;

	EXPORT FN_RemoveAndRenameAndPromoteFile(STRING FileNamePrefix, STRING Suffix, STRING Append = '') := FUNCTION
			RETURN	SEQUENTIAL(FN_RemoveFile(FileNamePrefix, Suffix, Append),
												 FN_RenameFile(FileNamePrefix, Suffix, Append),
												 FN_PromoteFile(FileNamePrefix, Suffix + '_old', Append));
  END;												 
	
  EXPORT FN_Despray(STRING destinationIP, STRING mask, STRING destinationpath, STRING date) := FUNCTION
      dset_fname := Fileservices.logicalfilelist(mask)(rowcount > 0); 
			RETURN NOTHOR(APPLY(dset_fname,
													FileServices.DeSpray('~'+dset_fname.name, 
						              destinationIP, 
													destinationpath+TRIM(date)+'_P'+TRIM(dset_fname.name[StringLib.stringfind(dset_fname.name, '_inputdata_p', 1) + 12 ..], ALL)+'.dat',,,,TRUE)));										 
	END;	

	SHARED FileStats := RECORD
		STRING File_Name;
		UNSIGNED8 Record_Count;
		UNSIGNED8 Uncompressed_Size_Bytes;
		REAL8 Uncompressed_Size_KB;
		REAL8 Uncompressed_Size_MB;
		REAL8 Uncompressed_Size_GB;
		REAL8 Uncompressed_Size_TB;
		UNSIGNED8 Compressed_Size_Bytes;
		REAL8 Compressed_Size_KB;
		REAL8 Compressed_Size_MB;
		REAL8 Compressed_Size_GB;
		REAL8 Compressed_Size_TB;
		REAL8 Compression_Percentage;
	END;
	EXPORT getFileSizeStats(STRING fileName) := FUNCTION
		recordCount := (UNSIGNED8)STD.File.GetLogicalFileAttribute(fileName, 'recordCount');
		size := (UNSIGNED8)STD.File.GetLogicalFileAttribute(fileName, 'size');
		compressedSize := (UNSIGNED8)STD.File.GetLogicalFileAttribute(fileName, 'compressedSize');
	
		FinalDataset := DATASET([{fileName, 
			recordCount, 
			size, // B
			ROUND((size / 1000), 3), // KB
			ROUND((size / 1000000), 3), // MB
			ROUND((size / 1000000000), 3), // GB
			ROUND((size / 1000000000000), 3), // TB
			compressedSize, // B
			ROUND((compressedSize / 1000), 3), // KB
			ROUND((compressedSize / 1000000), 3), // MB
			ROUND((compressedSize / 1000000000), 3), // GB
			ROUND((compressedSize / 1000000000000), 3), // TB
			ROUND((((size - compressedSize) / size) * 100), 3)
		}], FileStats);
	
		RETURN FinalDataset;
	END;
	
	EXPORT combineFileSizeStats (DATASET(FileStats) fileStatsSet) := FUNCTION
		combined := ROLLUP(PROJECT(fileStatsSet, TRANSFORM(RECORDOF(LEFT), SELF.File_Name := '1'; SELF := LEFT)), TRUE, 
		TRANSFORM(FileStats, 
			SELF.File_Name := (STRING)((UNSIGNED8)LEFT.File_Name + (UNSIGNED8)RIGHT.File_Name); 
			SELF.Record_Count := LEFT.Record_Count + RIGHT.Record_Count; 
			SELF.Uncompressed_Size_Bytes := LEFT.Uncompressed_Size_Bytes + RIGHT.Uncompressed_Size_Bytes; 
			SELF.Compressed_Size_Bytes := LEFT.Compressed_Size_Bytes + RIGHT.Compressed_Size_Bytes;
			SELF := LEFT));

		combinedStats := PROJECT(combined,
			TRANSFORM(FileStats,
				SELF.File_Name := LEFT.File_Name + ' Files Examined';
				SELF.Uncompressed_Size_KB := ROUND((LEFT.Uncompressed_Size_Bytes / 1000), 3);
				SELF.Uncompressed_Size_MB := ROUND((LEFT.Uncompressed_Size_Bytes / 1000000), 3);
				SELF.Uncompressed_Size_GB := ROUND((LEFT.Uncompressed_Size_Bytes / 1000000000), 3);
				SELF.Uncompressed_Size_TB := ROUND((LEFT.Uncompressed_Size_Bytes / 1000000000000), 3);
				SELF.Compressed_Size_KB := ROUND((LEFT.Compressed_Size_Bytes / 1000), 3);
				SELF.Compressed_Size_MB := ROUND((LEFT.Compressed_Size_Bytes / 1000000), 3);
				SELF.Compressed_Size_GB := ROUND((LEFT.Compressed_Size_Bytes / 1000000000), 3);
				SELF.Compressed_Size_TB := ROUND((LEFT.Compressed_Size_Bytes / 1000000000000), 3);
				SELF.Compression_Percentage := ROUND((((LEFT.Uncompressed_Size_Bytes - LEFT.Compressed_Size_Bytes) / LEFT.Uncompressed_Size_Bytes) * 100), 3);
				SELF := LEFT));
	
		RETURN combinedStats;
	END;
	
	EXPORT FileCopyFunction(STRING SourceFileName, STRING DestinationCluster, STRING DestinationFileName, STRING SourceDALI, BOOLEAN AllowOverwrite = false, BOOLEAN Compress = false, BOOLEAN WaitForFileCopy = true, BOOLEAN Replicate = false, BOOLEAN AsSuperfile = false, BOOLEAN ForcePush = false) := FUNCTION
       CopyAction := STD.File.Copy(SourceFileName, DestinationCluster, DestinationFileName, SourceDali, IF(WaitForFileCopy, -1, 0) /*timeout*/, /*espserverIPPort*/, 1 /*maxConnections*/, AllowOverwrite, Replicate, AsSuperfile, Compress, ForcePush);
       RETURN CopyAction;
	END;
END;