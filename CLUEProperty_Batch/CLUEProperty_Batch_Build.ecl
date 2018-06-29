IMPORT ut, Std, _control, CLUEProperty_Batch;

EXPORT CLUEProperty_Batch_Build(STRING6 Input_Build_Period = '', BOOLEAN isProdFlag) := FUNCTION									


		STRING MonthlyInputFile 	:= 'thor::base::AR::' + Input_Build_Period + '::CLUEPropertyRequest';
		STRING MonthlyOutputFile 	:= 'thor::base::AR::' + Input_Build_Period + '::CLUEPropertyResults';
		STRING MonthlyLogFile 	 	:= 'thor::base::AR::' + Input_Build_Period + '::CLUEPropertyResults::auditlog';
		
		STRING sourceThor := IF(isProdFlag, '~foreign::10.1194.112.101::' , '~foreign::10.194.126.207::');
		Today_Date := (STRING8)Std.Date.Today();
		string year := Input_Build_Period[1..4];	
		string yearQtr := CLUEProperty_Batch.fn_quarter.fn_Current_quarter(Input_Build_Period + '15');
		
		STRING MonthlyFN := '~' + MonthlyOutputFile;
		STRING ProdFN   := '~thor::base::AR::Prod::CLUEPropertyResults';	
		STRING QuarterlyFN := '~thor::base::AR::'+yearQtr+'::CLUEPropertyResults';
		STRING YearlyFN    := '~thor::base::AR::'+year+'::CLUEPropertyResults';
		STRING ProdLogFN 	:= '~thor::base::AR::prod::CLUEPropertyResults::auditlog';
		STRING MonthlyLogFN := '~' + MonthlyLogFile;
		
		//Copy the files from Alpha to Vault
		If(NOT Fileservices.FileExists('~' + MonthlyInputFile),STD.File.Copy(sourceThor  + MonthlyInputFile , 'analyt_thor400_90_c',  '~' + MonthlyInputFile,,,,,TRUE,,,,,,TRUE));
		If(NOT Fileservices.FileExists('~' + MonthlyOutputFile),STD.File.Copy(sourceThor  + MonthlyOutputFile , 'analyt_thor400_90_c', '~' +   MonthlyOutputFile,,,,,TRUE,,,,,,TRUE)); 
		If(NOT Fileservices.FileExists(MonthlyLogFN),STD.File.Copy(sourceThor +  MonthlyLogFile, 'analyt_thor400_90_c',    MonthlyLogFN,,,,,TRUE,,,,,,TRUE)); 

		CreateSupers := SEQUENTIAL(
		
			IF(NOT NOTHOR(Fileservices.SuperFileExists(ProdFN)),    NOTHOR(Fileservices.CreateSuperFile(ProdFN))),	
			IF(NOT NOTHOR(Fileservices.SuperFileExists(YearlyFN)), NOTHOR(Fileservices.CreateSuperFile(YearlyFN))),
			IF(NOT NOTHOR(Fileservices.SuperFileExists(QuarterlyFN)), NOTHOR(Fileservices.CreateSuperFile(QuarterlyFN))),
			IF(NOT NOTHOR(Fileservices.SuperFileExists(ProdLogFN)), NOTHOR(Fileservices.CreateSuperFile(ProdLogFN))));
		
		DetachFromSupers := SEQUENTIAL(
			IF(NOTHOR(FileServices.FindSuperFileSubName(QuarterlyFN, MonthlyFN)) >= 1, NOTHOR(FileServices.RemoveSuperFile(QuarterlyFN, MonthlyFN))),
			IF(NOTHOR(FileServices.FindSuperFileSubName(ProdLogFN, MonthlyLogFile)) >= 1, NOTHOR(FileServices.RemoveSuperFile(ProdLogFN, MonthlyLogFile))));

		AttachToSupers := SEQUENTIAL(
			IF(NOTHOR(Fileservices.FindSuperFileSubName(QuarterlyFN,   MonthlyFN)) < 1, NOTHOR(Fileservices.AddSuperFile(QuarterlyFN,   MonthlyFN))),
			IF(NOTHOR(Fileservices.FindSuperFileSubName(YearlyFN,   QuarterlyFN)) < 1,	NOTHOR(Fileservices.AddSuperFile(YearlyFN,   QuarterlyFN))),
			IF(NOTHOR(Fileservices.FindSuperFileSubName(ProdFN, YearlyFN)) < 1, NOTHOR(Fileservices.AddSuperFile(ProdFN, YearlyFN))),
				
			IF(NOTHOR(Fileservices.FindSuperFileSubName(ProdLogFN, MonthlyLogFN)) < 1, NOTHOR(Fileservices.AddSuperFile(ProdLogFN, MonthlyLogFN)))			
			);

		PromoteFiles := SEQUENTIAL();

		Action1 := SEQUENTIAL(CreateSupers, DetachFromSupers, AttachToSupers);
	
		Final := Action1;
		
		RETURN Final;
		
END;