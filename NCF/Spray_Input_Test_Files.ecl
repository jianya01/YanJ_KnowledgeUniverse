IMPORT STD, NCF_Layout;

EXPORT Spray_Input_Test_Files(STRING Input) := FUNCTION
		
		FormatDate(STRING8 Indate) := FUNCTION
			STRING8 OutDate := IF((INTEGER)Indate = 0, '00000000', Indate[5..8] + Indate[1..4]);
			RETURN OutDate;	
		END;

		SprayFile := Files.base_prefix + '::' + WORKUNIT[2..9] + WORKUNIT[11..16] + '::' + Input + '_csv';
		
		LandingZonePath := CASE(TRIM(Input, ALL), 
														'HeaderRecord' => Constants.HeaderFinalLandingZonePath,
														'TradeRecord' => Constants.TradeFinalLandingZonePath,
														'InquiryRecord' => Constants.InquiryFinalLandingZonePath,
														'PublicRecord' => Constants.PublicRecordFinalLandingZonePath,
														'CollectionRecord' => Constants.CollectionFinalLandingZonePath,
														'TradeTrendedRecord' => Constants.TradeTrendedFinalLandingZonePath,
														'');														
		
		Spray := STD.File.SprayVariable(Constants.ModelingIP, LandingZonePath, 8192, Constants.srcCSVPipeseparator, Constants.srcCSVterminator,, 
																		Constants.devDestinationgroup,SprayFile,,,,,,TRUE);
																		
		HeaderFile := PROJECT(DATASET(SprayFile, NCF_Layout.Layout_Header, CSV(HEADING(1), SEPARATOR('|'), TERMINATOR('\n'))), 
									TRANSFORM(NCF_Layout.Layout_Header, 
									SELF.HDDateOfReport := FormatDate(LEFT.HDDateOfReport),	
									SELF.HDBirthDate := FormatDate(LEFT.HDBirthDate),	
									SELF := LEFT));

		TradeFile := PROJECT(DATASET(SprayFile, {NCF_Layout.Layout_Trade_TestInput - [UniqueId, TDTradeTrendedData]}, CSV(HEADING(1), SEPARATOR('|'), TERMINATOR('\n'))), 
									TRANSFORM({NCF_Layout.Layout_Trade - [UniqueId, TDTrendedDataFlag, TDTradeTrendedData, TDTrendedDataStartDate]}, 
									SELF.HDDateOfReport := FormatDate(LEFT.HDDateOfReport),			
									SELF.TRDateReported := FormatDate(LEFT.TRDateReported),			
									SELF.TRDateAccountOpened := FormatDate(LEFT.TRDateAccountOpened),			
									SELF.TROldHistoricalWorstRatingDate := FormatDate(LEFT.TROldHistoricalWorstRatingDate),			
									SELF.TRStatusDate := FormatDate(LEFT.TRStatusDate),			
									SELF.TRLastPaymentDate := FormatDate(LEFT.TRLastPaymentDate),			
									SELF.TRDeferredPaymentStartDate := FormatDate(LEFT.TRDeferredPaymentStartDate),			
									SELF.TRBalloonPaymentDueDate := FormatDate(LEFT.TRBalloonPaymentDueDate),			
									SELF.TRPaymentPatternStartDate := FormatDate(LEFT.TRPaymentPatternStartDate),			
									SELF := LEFT));
									
		InquiryFile := PROJECT(DATASET(SprayFile, NCF_Layout.Layout_Inquiry, CSV(HEADING(1), SEPARATOR('|'), TERMINATOR('\n'))), 
									TRANSFORM(NCF_Layout.Layout_Inquiry, 
									SELF.HDDateOfReport := FormatDate(LEFT.HDDateOfReport),										
									SELF.IQInquiryDate := FormatDate(LEFT.IQInquiryDate),										
									SELF := LEFT));
									
		PublicRecordFile := PROJECT(DATASET(SprayFile, NCF_Layout.Layout_PublicRecord, CSV(HEADING(1), SEPARATOR('|'), TERMINATOR('\n'))), 
									TRANSFORM(NCF_Layout.Layout_PublicRecord, 
									SELF.HDDateOfReport := FormatDate(LEFT.HDDateOfReport),																			
									SELF.PRDateFiled := FormatDate(LEFT.PRDateFiled),																			
									SELF.PRStatusDate := FormatDate(LEFT.PRStatusDate),																			
									SELF := LEFT));
									
		CollectionFile := PROJECT(DATASET(SprayFile, NCF_Layout.Layout_Collection, CSV(HEADING(1), SEPARATOR('|'), TERMINATOR('\n'))), 
									TRANSFORM(NCF_Layout.Layout_Collection, 
									SELF.HDDateOfReport := FormatDate(LEFT.HDDateOfReport),																												
									SELF.CODateReported := FormatDate(LEFT.CODateReported),																												
									SELF.CODateAssigned := FormatDate(LEFT.CODateAssigned),																												
									SELF.COLastPaymentDate := FormatDate(LEFT.COLastPaymentDate),	
									SELF := LEFT));
									
		TradeTrendedFile := PROJECT(DATASET(SprayFile, NCF_Layout.Layout_TradeTrended_TestInput, CSV(HEADING(1), SEPARATOR('|'), TERMINATOR('\n'))), 
									TRANSFORM(NCF_Layout.Layout_TradeTrended_TestInput, 
									SELF.HDDateOfReport := FormatDate(LEFT.HDDateOfReport),																												
									SELF.TDTrendedDataStartDate := FormatDate(LEFT.TDTrendedDataStartDate),																												
									SELF.TDLastPaymentDateM01 := FormatDate(LEFT.TDLastPaymentDateM01),																												
									SELF.TDLastPaymentDateM02 := FormatDate(LEFT.TDLastPaymentDateM02),																												
									SELF.TDLastPaymentDateM03 := FormatDate(LEFT.TDLastPaymentDateM03),																												
									SELF.TDLastPaymentDateM04 := FormatDate(LEFT.TDLastPaymentDateM04),																												
									SELF.TDLastPaymentDateM05 := FormatDate(LEFT.TDLastPaymentDateM05),																												
									SELF.TDLastPaymentDateM06 := FormatDate(LEFT.TDLastPaymentDateM06),																												
									SELF.TDLastPaymentDateM07 := FormatDate(LEFT.TDLastPaymentDateM07),																												
									SELF.TDLastPaymentDateM08 := FormatDate(LEFT.TDLastPaymentDateM08),																												
									SELF.TDLastPaymentDateM09 := FormatDate(LEFT.TDLastPaymentDateM09),																												
									SELF.TDLastPaymentDateM10 := FormatDate(LEFT.TDLastPaymentDateM10),																												
									SELF.TDLastPaymentDateM11 := FormatDate(LEFT.TDLastPaymentDateM11),																												
									SELF.TDLastPaymentDateM12 := FormatDate(LEFT.TDLastPaymentDateM12),																												
									SELF.TDLastPaymentDateM13 := FormatDate(LEFT.TDLastPaymentDateM13),																												
									SELF.TDLastPaymentDateM14 := FormatDate(LEFT.TDLastPaymentDateM14),																												
									SELF.TDLastPaymentDateM15 := FormatDate(LEFT.TDLastPaymentDateM15),																												
									SELF.TDLastPaymentDateM16 := FormatDate(LEFT.TDLastPaymentDateM16),																												
									SELF.TDLastPaymentDateM17 := FormatDate(LEFT.TDLastPaymentDateM17),																												
									SELF.TDLastPaymentDateM18 := FormatDate(LEFT.TDLastPaymentDateM18),																												
									SELF.TDLastPaymentDateM19 := FormatDate(LEFT.TDLastPaymentDateM19),																												
									SELF.TDLastPaymentDateM20 := FormatDate(LEFT.TDLastPaymentDateM20),																												
									SELF.TDLastPaymentDateM21 := FormatDate(LEFT.TDLastPaymentDateM21),																												
									SELF.TDLastPaymentDateM22 := FormatDate(LEFT.TDLastPaymentDateM22),																												
									SELF.TDLastPaymentDateM23 := FormatDate(LEFT.TDLastPaymentDateM23),																												
									SELF.TDLastPaymentDateM24 := FormatDate(LEFT.TDLastPaymentDateM24),																												
									SELF.TDLastPaymentDateM25 := FormatDate(LEFT.TDLastPaymentDateM25),
									SELF := LEFT));
									
		RETURN SEQUENTIAL(Spray,
											IF(TRIM(Input, ALL) = 'HeaderRecord', OUTPUT(HeaderFile,,'~thor::base::ncf::prod::testinput::headerrecord', OVERWRITE, COMPRESSED)),
											IF(TRIM(Input, ALL) = 'TradeRecord', OUTPUT(TradeFile,,'~thor::base::ncf::prod::testinput::TradeRecord', OVERWRITE, COMPRESSED)),
											IF(TRIM(Input, ALL) = 'InquiryRecord', OUTPUT(InquiryFile,,'~thor::base::ncf::prod::testinput::InquiryRecord', OVERWRITE, COMPRESSED)),
											IF(TRIM(Input, ALL) = 'PublicRecord', OUTPUT(PublicRecordFile,,'~thor::base::ncf::prod::testinput::PublicRecord', OVERWRITE, COMPRESSED)),
											IF(TRIM(Input, ALL) = 'CollectionRecord', OUTPUT(CollectionFile,,'~thor::base::ncf::prod::testinput::CollectionRecord', OVERWRITE, COMPRESSED)),
											IF(TRIM(Input, ALL) = 'TradeTrendedRecord', OUTPUT(TradeTrendedFile,,'~thor::base::ncf::prod::testinput::TradeTrendedRecord', OVERWRITE, COMPRESSED))
											);

END;		