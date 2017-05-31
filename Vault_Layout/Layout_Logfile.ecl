EXPORT Layout_Logfile :=  RECORD
	STRING10 Grouping;
	UNSIGNED8 CountGroup;
	UNSIGNED8 Current_Build_Records;
	UNSIGNED8 Records_Expired;
	UNSIGNED8 Records_New;
	UNSIGNED8 Records_Updated;
END;