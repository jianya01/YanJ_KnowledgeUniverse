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
   
   		PromotionList := FileServices.PromoteSuperFileList([FileNameProd,
   																												FileNameFather,
   																												FileNameGrandFather],
   																											  FileNameNewLogical, TRUE);
   
   		RETURN PromotionList;
  END;
/*    	
   	EXPORT FN_OutputFile(DATASET Dset, STRING FileNamePrefix, STRING Suffix, STRING Append = '') := FUNCTION
   
      		FileNameNewLogical := TRIM(IF(Append = '', FileNamePrefix + '::' + WORKUNIT[2..9] + '::' + Suffix, 
   																		FileNamePrefix + '::' + Append + '::' + Suffix), ALL);
   
   		  RETURN OUTPUT(Dset, , FileNameNewLogical, OVERWRITE, __COMPRESSED__);	
   					 
   	END;
      
     EXPORT FN_PromoteFile(STRING FileNamePrefix, STRING Suffix, STRING Append = '') := FUNCTION   	
      
      		FileNameNewLogical 				:= TRIM(IF(TRIM(Append,LEFT,RIGHT) = '', FileNamePrefix + '::' + WORKUNIT[2..9] + '::' + Suffix, 
   																				FileNamePrefix + '::' + Append + '::' + Suffix), ALL);
      		FileNameProd	 						:= TRIM(FileNamePrefix + '::prod::' + Suffix, ALL);
      		FileNameFather 						:= TRIM(FileNamePrefix + '::father::' + Suffix, ALL);
      		FileNameGrandFather 			:= TRIM(FileNamePrefix + '::grandfather::' + Suffix, ALL);
      
      		PromotionList := FileServices.PromoteSuperFileList([FileNameProd,
      																												FileNameFather,
      																												FileNameGrandFather],
      																											  FileNameNewLogical, TRUE);
      
      		RETURN PromotionList;
     END;
*/
	
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
		
END;