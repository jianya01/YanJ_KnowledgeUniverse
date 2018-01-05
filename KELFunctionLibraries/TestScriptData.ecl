EXPORT TestScriptData := MODULE
	EXPORT recKELGlobalFunctionLibrary := RECORD
		UNSIGNED4 pid;
		INTEGER8 dateofbirth;	
		INTEGER4 testvalue1;
	END;
	
	EXPORT KELGlobalFunctionLibraryData := DATASET([
		{1,-1,-1},
		{2,19800515,0},
		{3,19620701,15},
		{4,20010101,30}],
	recKELGlobalFunctionLibrary);
END;