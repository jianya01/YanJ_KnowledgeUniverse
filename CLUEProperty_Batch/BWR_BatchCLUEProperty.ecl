IMPORT lib_fileservices, CLUEProperty_Batch, STD, UT, _Control;
#WORKUNIT('name','CLUEProperty_Batch_Build');


		BOOLEAN isProd := False;
		//BOOLEAN isProd := True;
		Today_Date := (STRING8)Std.Date.Today();
		Build_Period := Today_Date[1..6];
		Result := CLUEProperty_Batch.CLUEProperty_Batch_Build(Build_Period, isProd);
		
		Result
		: success(lib_fileservices.FileServices.sendemail(CLUEProperty_Batch.Constants.Email_Target,'C.L.U.E. Property Batch Product Results FOR VAULT Success',
          'C.L.U.E. Property Batch job completed in  ' + Thorlib.group())),
			failure(lib_fileservices.FileServices.sendemail(CLUEProperty_Batch.Constants.Email_Target,'*** C.L.U.E. PROPERTY BATCH Product Results FOR VAULT FAILED *** ' + workunit,
          FAILMESSAGE));

		