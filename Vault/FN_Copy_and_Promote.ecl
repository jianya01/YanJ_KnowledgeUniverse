IMPORT STD;	
	
EXPORT FN_Copy_and_Promote(STRING SourceFileName,STRING ThorCluster,STRING FileNamePrefix, STRING Suffix, STRING Append = '') := FUNCTION

		FileCopy := std.file.copy(SourceFileName,ThorCluster,TRIM(IF(Append = '', FileNamePrefix + '::' + WORKUNIT[2..9] + '::' + Suffix, 
																	FileNamePrefix + '::' + Append + '::' + Suffix), ALL),,,,,TRUE,,,,,,TRUE);

		FileNameNewLogical 				:= TRIM(IF(TRIM(Append,LEFT,RIGHT) = '', FileNamePrefix + '::' + WORKUNIT[2..9] + '::' + Suffix, 
																			FileNamePrefix + '::' + Append + '::' + Suffix), ALL);
		FileNameProd	 						:= TRIM(FileNamePrefix + '::prod::' + Suffix, ALL);
		FileNameFather 						:= TRIM(FileNamePrefix + '::father::' + Suffix, ALL);
		FileNameGrandFather 			:= TRIM(FileNamePrefix + '::grandfather::' + Suffix, ALL);
 
		PromotionList := FileServices.PromoteSuperFileList([FileNameProd,
																												FileNameFather,
																												FileNameGrandFather],
																												FileNameNewLogical, TRUE);
		CopyandPromote := SEQUENTIAL(FileCopy,PromotionList);
 
		RETURN CopyandPromote;
END;