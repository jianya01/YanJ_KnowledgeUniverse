EXPORT FilesCleaned := MODULE

	SHARED FilterDate := 99999999; // If you want to run faster for quick iterative development set this to a recent date. Otherwise 99999999 runs everything.

	EXPORT Header_Data := PROJECT(Files.Header_Data (FilterDate = 99999999 OR (INTEGER)HDDateOfReport >= FilterDate),
												TRANSFORM(RECORDOF(LEFT),
												SELF.HDDateOfReport := Utilities.CleanDate(LEFT.HDDateOfReport),
												SELF.HDFileSinceDate := Utilities.CleanDate(LEFT.HDFileSinceDate),
												SELF.HDBirthDate := Utilities.CleanDate(LEFT.HDBirthDate),
												SELF.HDDeathDate := Utilities.CleanDate(LEFT.HDDeathDate),
												SELF := LEFT));
	
	EXPORT Inquiry_Data := PROJECT(Files.Inquiry_Data (FilterDate = 99999999 OR (INTEGER)HDDateOfReport >= FilterDate),
												 TRANSFORM(RECORDOF(LEFT),
												 SELF.HDDateOfReport := Utilities.CleanDate(LEFT.HDDateOfReport),
												 SELF.IQInquiryDate := Utilities.CleanDate(LEFT.IQInquiryDate),
												 SELF := LEFT));

	EXPORT PublicRecord_Data := PROJECT(Files.PublicRecord_Data (FilterDate = 99999999 OR (INTEGER)HDDateOfReport >= FilterDate),
															TRANSFORM(RECORDOF(LEFT),
														  SELF.HDDateOfReport := Utilities.CleanDate(LEFT.HDDateOfReport),
														  SELF.PRDateFiled := Utilities.CleanDate(LEFT.PRDateFiled),
														  SELF.PRStatusDate := Utilities.CleanDate(LEFT.PRStatusDate),
														  SELF := LEFT));
															
	EXPORT Collection_Data := PROJECT(Files.Collection_Data (FilterDate = 99999999 OR (INTEGER)HDDateOfReport >= FilterDate),
														TRANSFORM(RECORDOF(LEFT),
												    SELF.HDDateOfReport := Utilities.CleanDate(LEFT.HDDateOfReport),
												    SELF.CODateReported := Utilities.CleanDate(LEFT.CODateReported),
												    SELF.CODateAssigned := Utilities.CleanDate(LEFT.CODateAssigned),
												    SELF.COLastPaymentDate := Utilities.CleanDate(LEFT.COLastPaymentDate),
												    SELF.CODate1stDelinquency := Utilities.CleanDate(LEFT.CODate1stDelinquency),
												    SELF := LEFT));

	EXPORT TradeTrended_Data := PROJECT(Files.TradeTrended_Data (FilterDate = 99999999 OR (INTEGER)HDDateOfReport >= FilterDate),
														  TRANSFORM(RECORDOF(LEFT),
														  SELF.HDDateOfReport := Utilities.CleanDate(LEFT.HDDateOfReport),
														  SELF.TRDateReported := Utilities.CleanDate(LEFT.TRDateReported),
														  SELF.TRDateAccountOpened := Utilities.CleanDate(LEFT.TRDateAccountOpened),
														  SELF.TROldHistoricalWorstRatingDate := Utilities.CleanDate(LEFT.TROldHistoricalWorstRatingDate),
														  SELF.TRStatusDate := Utilities.CleanDate(LEFT.TRStatusDate),
														  SELF.TRLastPaymentDate := Utilities.CleanDate(LEFT.TRLastPaymentDate),
														  SELF.TRDateLastActivity := Utilities.CleanDate(LEFT.TRDateLastActivity),
														  SELF.TRClosedDate := Utilities.CleanDate(LEFT.TRClosedDate),
														  SELF.TRDeferredPaymentStartDate := Utilities.CleanDate(LEFT.TRDeferredPaymentStartDate),
														  SELF.TRBalloonPaymentDueDate := Utilities.CleanDate(LEFT.TRBalloonPaymentDueDate),
														  SELF.TRPaymentPatternStartDate := Utilities.CleanDate(LEFT.TRPaymentPatternStartDate),
															SELF.TDTrendedDataStartDate := Utilities.CleanDate(LEFT.TDTrendedDataStartDate),
														  SELF.TDLastPaymentDate := Utilities.CleanDate(LEFT.TDLastPaymentDate),
														  SELF := LEFT));
END;