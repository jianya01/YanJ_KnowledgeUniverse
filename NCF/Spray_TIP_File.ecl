IMPORT STD, NCF_Layout;

EXPORT Spray_TIP_File := FUNCTION
		
		SprayFile := Files.base_prefix + '::' + WORKUNIT[2..9] + WORKUNIT[11..16] + '::tipfile_csv';
		
		Spray := STD.File.SprayVariable(Constants.ModelingIP, Constants.TIPFileLandingZonePath, 8192, Constants.srcCSVPipeseparator, Constants.srcCSVterminator,, 
																		Constants.devDestinationgroup,SprayFile,,,,,,TRUE);  
		
		OutputFile := PROJECT(Files.Tip_Input_Spray_File, 
									TRANSFORM({STRING InputFile}, 
														SELF := LEFT));

		RETURN SEQUENTIAL(Spray,
											FileUtil.FN_PromoteSingleFile(Files.base_prefix, 'tipfile_csv', WORKUNIT[2..9]  + WORKUNIT[11..16]),
											FileUtil.FN_OutputAndPromoteFile(OutputFile, Files.base_prefix, 'tipfile', WORKUNIT[2..9]  + WORKUNIT[11..16]));

END;		