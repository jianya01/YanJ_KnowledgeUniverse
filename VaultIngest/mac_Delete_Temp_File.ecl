IMPORT STD;

EXPORT mac_Delete_Temp_File(string pModuleName) := FUNCTION

	FILE_MASK := 'temp::' + pModuleName + '::ingest_cache__p*';
	
	ds_files := nothor(STD.File.LogicalFileList(FILE_MASK, true, false, true)); 
	
	filename := if(COUNT(ds_files) > 0, '~' + ds_files[1].name, '');  //make sure the dataset of files isn't empty
	
	result :=	nothor(if(filename <> '', STD.File.DeleteLogicalFile(filename))); //delete the temp file if it exists
	
	RETURN result;
	
END;