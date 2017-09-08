EXPORT LogFile_Layout := RECORD
	STRING10 Grouping;
	UNSIGNED8 CountGroup;
	UNSIGNED8 Current_Build_Records;
	UNSIGNED8 Records_Expired;//updated
	UNSIGNED8 Records_New;//new
	UNSIGNED8 Records_Unchanged;//unchanged
	string file_name;//string80 file_name;
	string20 wuid;
END;