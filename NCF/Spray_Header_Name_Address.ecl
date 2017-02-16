IMPORT STD, NCF_Layout;

EXPORT Spray_Header_Name_Address := FUNCTION
		
		SprayFile := Files.base_prefix + '::' + WORKUNIT[2..9] + WORKUNIT[11..16] + '::header_name_address_csv';
		
		Spray := STD.File.SprayVariable(Constants.ModelingIP, Constants.HeaderFileLandingZonePath, 8192, Constants.srcCSVPipeseparator, Constants.srcCSVterminator,, 
																		Constants.devDestinationgroup,SprayFile,,,,,,TRUE);  
		
		OutputFile := PROJECT(Files.Header_Input_Spray_File,
									TRANSFORM(NCF_Layout.Layout_Header_InputFile, 
														SELF.Record_Number := LEFT.InputHeaderFile[3..12],
														SELF.Lexid := LEFT.InputHeaderFile[530..588],
														SELF.YOB := LEFT.InputHeaderFile[51..54],
														SELF.Name := LEFT.InputHeaderFile[114..178],
														SELF.Address1 := LEFT.InputHeaderFile[200..263],
														SELF.CityStateZip1 := LEFT.InputHeaderFile[264..295],
														SELF.Address2 := LEFT.InputHeaderFile[296..359],
														SELF.CityStateZip2 := LEFT.InputHeaderFile[360..391],
														SELF.Address3 := LEFT.InputHeaderFile[392..455],
														SELF.CityStateZip3 := LEFT.InputHeaderFile[456..487],
														SELF.CNflag := LEFT.InputHeaderFile[596..596]));

		RETURN SEQUENTIAL(Spray,
											FileUtil.FN_PromoteSingleFile(Files.base_prefix, 'header_name_address_csv', WORKUNIT[2..9]  + WORKUNIT[11..16]),
											FileUtil.FN_OutputAndPromoteFile(OutputFile, Files.base_prefix, 'header_input', WORKUNIT[2..9] + WORKUNIT[11..16]));
											// FileUtil.FN_OutputAndPromoteFile(OutputFile, Files.base_prefix, 'header_name_address', WORKUNIT[2..9] + WORKUNIT[11..16])); - Commented this as we should have all header records without matching TIP

END;		