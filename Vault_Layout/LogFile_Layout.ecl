EXPORT LogFile_Layout := RECORD
	STRING10 Grouping;
	UNSIGNED8 CountGroup;
	UNSIGNED8 Current_Build_Records;
	UNSIGNED8 Records_Expired;//updated
	UNSIGNED8 Records_New;//new
	UNSIGNED8 Records_Unchanged;//unchanged
END;