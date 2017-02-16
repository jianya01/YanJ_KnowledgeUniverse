IMPORT NCF_Layout, ut;

EXPORT MockData := FUNCTION

	BOOLEAN isNumeric(STRING a) := REGEXFIND('^[0-9]+$', TRIM(a,ALL));

	BOOLEAN isValidYearMonth(STRING8 InDate) := IF(InDate[1..4] >= '1800' AND InDate[5..6] BETWEEN '01' and '12', TRUE, FALSE);
			 
	FormatDate(STRING8 Indate) := FUNCTION
		STRING8 OutDate := IF((INTEGER)Indate = 0, '00000000', Indate[5..8] + Indate[1..4]);
		RETURN OutDate;	
	END;

	FormatAmount(STRING15 InValue) := FUNCTION
		UNSIGNED3 OutValue := CASE(TRIM(InValue, LEFT, RIGHT), 'UNKNOWN' => 0, '<100' =>	99, '>2520000' =>	2520001, '>252000' =>	252001, '>25200' =>	25201, 0);
		RETURN OutValue;	
	END;

	HeaderRecord := PROJECT(Files.Header_Input_Data,
									TRANSFORM(NCF_Layout.Layout_Header,
														SELF.RecordId := '110',
														SELF.BureauCode := 'XPN',
														SELF.HDBureauVersion := '07',
														SELF.HDDateOfReport := FormatDate('12292012'),
														SELF.ReferenceNumber := LEFT.Record_Number,
														SELF.HDPaymentHistoryType := '8',
														SELF.HDFileSinceDate := '',
														SELF.HDBirthDate := IF(LEFT.YOB = '', '00000000', LEFT.YOB + '0101'),
														SELF.HDDeathDate := '',
														SELF.HDConsumerStatementOnFileFlag := (UNSIGNED1)LEFT.CNflag,
														SELF.Name := LEFT.Name,
														SELF.Address := LEFT.Address1,
														SELF.CityStateZip := LEFT.CityStateZip1,
														SELF.Lexid := (UNSIGNED8) LEFT.Lexid));
														
	InquiryRecord := JOIN(Files.Tip_Inquiry_Data, HeaderRecord,
										    LEFT.Record_Number = RIGHT.ReferenceNumber, 
											  TRANSFORM(NCF_Layout.Layout_Inquiry,
														 SELF.RecordID := '359',
														 SELF.BureauCode := 'XPN',
														 SELF.HDDateOfReport := FormatDate('12292012'),
														 SELF.ReferenceNumber := LEFT.Record_Number,
														 SELF.IQInquiryDate := FormatDate(LEFT.Inquiry_Date),
														 SELF.IQMemberNumber := LEFT.Subcode,
														 SELF.IQKOB := LEFT.KOB,
														 SELF.IQMemberName := 'Member Name',
														 SELF.IQAmount := (UNSIGNED4) LEFT.Inquiry_Dollar_Amount,
														 SELF.IQType := LEFT.Enhanced_Type_Code,
														 SELF.IQAbbreviation := '',
														 SELF.IQTerms := LEFT.Inquiry_Terms,
														 SELF.Lexid := RIGHT.Lexid), LEFT OUTER, HASH);

	PublicRecord := JOIN(Files.Tip_PublicRecord_Data, HeaderRecord,
										   LEFT.Record_Number = RIGHT.ReferenceNumber, 
											 TRANSFORM(NCF_Layout.Layout_PublicRecord,
														SELF.RecordID := '350',
														SELF.BureauCode := 'XPN',
														SELF.HDDateOfReport := FormatDate('12292012'),
														SELF.ReferenceNumber := LEFT.Record_Number,
														SELF.PRTypeStatus := LEFT.Enhanced_Legal_Status,
														SELF.PRDateFiled := FormatDate(LEFT.Original_Filing_Date),
														SELF.PRPublicRecordAmount := (UNSIGNED4) LEFT.Public_Record_Amount,
														SELF.PRECOA := LEFT.Public_Record_ECOA,
														SELF.PRNarrativeCode1 := IF(LEFT.Public_Record_SCC = '00', '', LEFT.Public_Record_SCC),
														SELF.PRNarrativeCode2 := '',
														SELF.PRStatusDate := FormatDate(LEFT.Legal_Status_Date),
														SELF.PRConsumerDisputeFlag := '',
														SELF.PRPlaintiff := '',
														SELF.PRDefendant := '',
														SELF.PRCourtNumber := 'CourtID',
														SELF.PRCaseNumber := 'CaseNumber',
														SELF.Lexid := RIGHT.Lexid), LEFT OUTER, HASH);
														
	CollectionRecord := JOIN(Files.Tip_Trade_Data((KOB IN ['YA','YC','YL','YZ','ZY']) OR (Enhanced_Type_Code = '0C') OR (Enhanced_Type_Code = '48' AND (UNSIGNED1)Original_Creditor_Classification_Code > 00)), HeaderRecord,	
													 LEFT.Record_Number = RIGHT.ReferenceNumber, 
													 TRANSFORM(NCF_Layout.Layout_Collection,
																SELF.RecordID := '357',
																SELF.BureauCode := 'XPN',
																SELF.HDDateOfReport := FormatDate('12292012'),
																SELF.ReferenceNumber := LEFT.Record_Number,
																SELF.COKOB := LEFT.KOB,
																SELF.CODateReported := FormatDate(LEFT.Balance_Date),
																SELF.CODateAssigned := FormatDate(LEFT.Date_Open),
																SELF.COMemberNumber := LEFT.Subcode,
																SELF.COMemberName := 'Member Name',
																SELF.COOriginalCreditorName := 'Original Creditor',
																SELF.COAccountNumber := 'Account Number',
																SELF.COECOA := LEFT.ECOA,
																SELF.COOriginalCollectionAmount := MAP((UNSIGNED4)LEFT.Original_Loan_Amount > 0 => (UNSIGNED4)LEFT.Original_Loan_Amount,
																																			 LEFT.Amount_1_Qualifier = 'O' AND (UNSIGNED4)LEFT.Amount_1 > 0 => (UNSIGNED4)LEFT.Amount_1, 
																																			 LEFT.Amount_2_Qualifier = 'O' AND (UNSIGNED4)LEFT.Amount_2 > 0 => (UNSIGNED4)LEFT.Amount_2,
																																			 (UNSIGNED4)LEFT.High_Balance_Amount > 0 => (UNSIGNED4)LEFT.High_Balance_Amount,
																																			 LEFT.Amount_1_Qualifier = 'H' AND (UNSIGNED4)LEFT.Amount_1 > 0 => (UNSIGNED4)LEFT.Amount_1, 
																																			 LEFT.Amount_2_Qualifier = 'H' AND (UNSIGNED4)LEFT.Amount_2 > 0 => (UNSIGNED4)LEFT.Amount_2,
																																			 (UNSIGNED4)LEFT.Charge_Off_Amount > 0 => (UNSIGNED4)LEFT.Charge_Off_Amount,
																																			 LEFT.Amount_1_Qualifier = 'C' AND (UNSIGNED4)LEFT.Amount_1 > 0 => (UNSIGNED4)LEFT.Amount_1, 
																																			 LEFT.Amount_2_Qualifier = 'C' AND (UNSIGNED4)LEFT.Amount_2 > 0 => (UNSIGNED4)LEFT.Amount_2,
																																			 0),
																SELF.COBalanceAmount := (UNSIGNED4)LEFT.Balance_Amount,
																SELF.COPastDueAmount := (UNSIGNED4)LEFT.Amount_Past_Due,
																SELF.COStatus := '',
																SELF.COClassificationCode := LEFT.Original_Creditor_Classification_Code,
																SELF.COConsumerDisputeFlag := '',
																SELF.COAccountTypeCode := LEFT.Enhanced_Type_Code,
																SELF.CONarrativeCode1 := LEFT.Enhanced_Special_Comment,
																SELF.CONarrativeCode2 := LEFT.Compliance_Condition_Code,
																SELF.CONarrativeCode3 := '',
																SELF.CONarrativeCode4 := '',
																SELF.COConsumerInfoIndicator := LEFT.CII_Code,
																SELF.COLastPaymentDate := FormatDate(LEFT.Last_Payment_Date),
																SELF.CODate1stDelinquency := '',
																SELF.Lexid := RIGHT.Lexid), LEFT OUTER, HASH);

	TradeRecord := JOIN(Files.Tip_Trade_Data(NOT((KOB IN ['YA','YC','YL','YZ','ZY']) OR (Enhanced_Type_Code = '0C') OR (Enhanced_Type_Code = '48' AND (UNSIGNED1)Original_Creditor_Classification_Code > 00))), HeaderRecord,	
										  LEFT.Record_Number = RIGHT.ReferenceNumber, 
											TRANSFORM(NCF_Layout.Layout_Trade,
														SELF.UniqueId := LEFT.UniqueId;
														SELF.TradeKey := LEFT.TradeKey;
														SELF.RecordId := '357';
														SELF.BureauCode := 'XPN';
														SELF.HDDateOfReport := FormatDate('12292012');
														SELF.ReferenceNumber := LEFT.Record_Number;
														SELF.TRKOB := LEFT.KOB;
														SELF.TRMemberNumber := LEFT.Subcode;
														SELF.TRMemberName := 'Member Name';
														SELF.TRAccountNumber := 'Account Number';
														SELF.TRDateReported := FormatDate(LEFT.Balance_Date);
														SELF.TRDateAccountOpened := FormatDate(LEFT.Date_Open);
														SELF.TRECOA := LEFT.ECOA;
														SELF.TRPortfolioTypeCode := MAP(LEFT.Enhanced_Terms =  'REV' => 'R', 
																														LEFT.Enhanced_Terms = 'LOC' => 'C', 
																														LEFT.Enhanced_Terms = '001' => 'O', 
																														LEFT.Enhanced_Terms = 'UNK' => '', 
																														LEFT.Enhanced_Terms NOT IN ['REV','LOC','001','UNK'] AND (INTEGER) LEFT.Enhanced_Terms > 1 AND isNumeric(LEFT.Enhanced_Terms) => 'I', 
																														'');
														SELF.TRAccountTypeCode := LEFT.Enhanced_Type_Code;
														SELF.TRTermsDuration := LEFT.Enhanced_Terms;
														SELF.TRHighestCreditAmount := MAP((UNSIGNED5)LEFT.High_Balance_Amount > 0 => (UNSIGNED5)LEFT.High_Balance_Amount,
																															LEFT.Amount_1_Qualifier = 'H' AND FormatAmount(LEFT.Amount_1) > 0 => FormatAmount(LEFT.Amount_1),
																															LEFT.Amount_2_Qualifier = 'H' AND FormatAmount(LEFT.Amount_2) > 0 => FormatAmount(LEFT.Amount_2),
																															(UNSIGNED5)LEFT.Original_Loan_Amount > 0 => (UNSIGNED5)LEFT.Original_Loan_Amount,
																															LEFT.Amount_1_Qualifier = 'O' AND FormatAmount(LEFT.Amount_1) > 0 => FormatAmount(LEFT.Amount_1),
																															LEFT.Amount_2_Qualifier = 'O' AND FormatAmount(LEFT.Amount_2) > 0 => FormatAmount(LEFT.Amount_2), 
																															0);
														SELF.TRCreditLimit := MAP((UNSIGNED5)LEFT.Credit_Limit > 0 => (UNSIGNED5)LEFT.Credit_Limit,
																											LEFT.Amount_1_Qualifier = 'L' AND FormatAmount(LEFT.Amount_1) > 0 => FormatAmount(LEFT.Amount_1),
																											LEFT.Amount_2_Qualifier = 'L' AND FormatAmount(LEFT.Amount_2) > 0 => FormatAmount(LEFT.Amount_2), 
																											0);
														SELF.TRChargeOffAmount := MAP((UNSIGNED5)LEFT.Charge_Off_Amount > 0 => (UNSIGNED5)LEFT.Charge_Off_Amount,
																													LEFT.Amount_1_Qualifier = 'C' AND FormatAmount(LEFT.Amount_1) > 0 => FormatAmount(LEFT.Amount_1), 
																													LEFT.Amount_2_Qualifier = 'C' AND FormatAmount(LEFT.Amount_2) > 0 => FormatAmount(LEFT.Amount_2), 
																													0);
														SELF.TRAccountBalance := (UNSIGNED4)LEFT.Balance_Amount;
														SELF.TRScheduledPaymentAmount := (UNSIGNED4)LEFT.Monthly_Payment_Amount;
														SELF.TRMonthlyPaymentType := 'S';
														SELF.TRActualPaymentAmount := (UNSIGNED4)LEFT.Actual_Payment_Amount;
														SELF.TRActualPaymentNullInd := IF(LEFT.Actual_Payment_Amount = '', 1, 0);
														SELF.TRPastDueAmount := (UNSIGNED4)LEFT.Amount_Past_Due;
														SELF.TRCurrentRateCode := Constants.CurrentRateCodeConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[1..1])[1].LN_Standardized_Code;
														SELF.TRStatusCode := LEFT.Enhanced_Status_Code;
														SELF.TRAccountConditionCode := LEFT.Account_Condition_Code;
														SELF.TRMonthsReviewed := 0;
														SELF.TR30dayCounter := (UNSIGNED1)LEFT.Thirty_Day_Counter;
														SELF.TR60dayCounter := (UNSIGNED1)LEFT.Sixty_Day_Counter;
														SELF.TR90dayCounter := (UNSIGNED1)LEFT.Ninety_Day_Counter;
														SELF.TRDerogCounter := (UNSIGNED1)LEFT.Derog_Counter;
														BOOLEAN DeliquencyCondition := isValidYearMonth(LEFT.Balance_Date) AND isValidYearMonth(LEFT.Maximum_Delinquency_Date) AND UT.monthsApart_YYYYMMDD(LEFT.Balance_Date, LEFT.Maximum_Delinquency_Date) >= 84;
														SELF.TROldHistoricalWorstRatingCode := IF(DeliquencyCondition, Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Maximum_Payment_Code)[1].LN_Standardized_Code, '');
														SELF.TROldHistoricalWorstRatingDate := IF(DeliquencyCondition, LEFT.Maximum_Delinquency_Date, '00000000');
														SELF.TRStatusDate := FormatDate(LEFT.Status_Date);
														SELF.TRLastPaymentDate := FormatDate(LEFT.Last_Payment_Date);
														SELF.TRDateLastActivity := '';
														STRING84 PaymentHistory :=  			Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[2..2])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[3..3])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[4..4])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[5..5])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[6..6])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[7..7])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[8..8])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[9..9])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[10..10])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[11..11])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[12..12])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[13..13])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[14..14])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[15..15])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[16..16])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[17..17])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[18..18])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[19..19])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[20..20])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[21..21])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[22..22])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[23..23])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[24..24])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[25..25])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[26..26])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[27..27])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[28..28])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[29..29])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[30..30])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[31..31])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[32..32])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[33..33])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[34..34])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[35..35])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[36..36])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[37..37])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[38..38])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[39..39])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[40..40])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[41..41])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[42..42])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[43..43])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[44..44])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[45..45])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[46..46])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[47..47])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[48..48])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[49..49])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[50..50])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[51..51])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[52..52])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[53..53])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[54..54])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[55..55])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[56..56])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[57..57])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[58..58])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[59..59])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[60..60])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[61..61])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[62..62])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[63..63])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[64..64])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[65..65])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[66..66])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[67..67])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[68..68])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[69..69])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[70..70])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[71..71])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[72..72])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[73..73])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[74..74])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[75..75])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[76..76])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[77..77])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[78..78])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[79..79])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[80..80])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[81..81])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[82..82])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[83..83])[1].LN_Standardized_Code + 
																															Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[84..84])[1].LN_Standardized_Code;
														SELF.TR84MonthsPaymentHistory := PaymentHistory;																															
														SELF.TRConsumerDisputeFlag := '';
														SELF.TRNarrativeCode1 := LEFT.Enhanced_Special_Comment;
														SELF.TRNarrativeCode2 := LEFT.Compliance_Condition_Code;
														SELF.TRNarrativeCode3 := '';
														SELF.TRNarrativeCode4 := '';
														SELF.TRConsumerInfoIndicator := LEFT.CII_Code;
														SELF.TRPaymentFrequency := LEFT.Terms_Frequency;
														SELF.TRActivityDesignatorCode := IF(LEFT.Account_Condition_Code IN ['A1', 'A2', 'A3', 'A4'], LEFT.Account_Condition_Code, '');
														SELF.TRClosedDate := '';
														SELF.TRMortgageID := 'MortgageID';
														SELF.TRDeferredPaymentStartDate := IF(LEFT.Special_Payment_Code ='02', FormatDate(LEFT.Special_Payment_Date), '00000000'); 
														SELF.TRDeferredPaymentAmount := IF(LEFT.special_payment_code = '02', (UNSIGNED5)LEFT.Special_Payment_Amount, 0);
														SELF.TRBalloonPaymentAmount := IF(LEFT.Special_Payment_Code = '01', (UNSIGNED5)LEFT.Special_Payment_Amount, 0);
														SELF.TRBalloonPaymentDueDate := IF(LEFT.special_payment_code = '01', FormatDate(LEFT.Special_Payment_Date), '00000000');
														Formatted_Balance_Date := FormatDate(LEFT.Balance_Date);
														SELF.TRPaymentPatternStartDate := MAP(PaymentHistory = '' => '00000000',
																																	Formatted_Balance_Date IN ['00000000', ''] => Formatted_Balance_Date,
																																	isValidYearMonth(Formatted_Balance_Date) AND Formatted_Balance_Date[7..8] = '00' => ut.month_math(Formatted_Balance_Date, -1) + 00,
																																	ut.month_math(Formatted_Balance_Date, -1));
														SELF.TDTrendedDataFlag := TRUE;																			
														SELF.TDTrendedDataStartDate := ut.month_math(FormatDate('12292012'), -(UNSIGNED2)LEFT.Months_Since_Update);
														SELF.TDTradeTrendedData := [];
														SELF.Lexid := RIGHT.Lexid), LEFT OUTER, HASH);
														
	NCF_Layout.Layout_Trade TradeTrended(NCF_Layout.Layout_Trade L, NCF_Layout.Layout_TradeTrended R,INTEGER C) := TRANSFORM
		SELF.TDTradeTrendedData := L.TDTradeTrendedData + ROW({R.TDTrendedOccurence, R.TDBalanceAmount, R.TDLoanAmountCreditLimit, R.TDScheduledPayment,
																														R.TDActualPayment, R.TDLastPaymentDate, R.TDActualPaymentNullInd}, NCF_Layout.Layout_TradeTrended_Exact); 
		SELF := L;
	END;
	
	IncludeTradeTrended := DENORMALIZE(TradeRecord, Files.TradeTrended_Input_Data,
												 LEFT.UniqueId = RIGHT.UniqueId,
												 TradeTrended(LEFT,RIGHT,COUNTER));							
												 
	NCF_Layout.Layout_Trade DoRoll(NCF_Layout.Layout_Trade L, NCF_Layout.Layout_Trade R) := TRANSFORM
		SELF.TradeKey := MAP(L.ReferenceNumber =  R.ReferenceNumber => L.TradeKey + 1,
												 1);
		SELF := R;
	END;

	IterateRecs := ITERATE(SORT(IncludeTradeTrended, ReferenceNumber, UniqueId), DoRoll(LEFT, RIGHT));												 
	
	TrendDataFlagDs := TABLE(DISTRIBUTE(Files.TradeTrended_Input_Data(tdbalanceamount = 0 AND tdloanamountcreditlimit = 0 AND tdscheduledpayment = 0 AND tdactualpayment = 0 AND tdlastpaymentdate = '00000000' AND tdactualpaymentnullind = 1), HASH32(uniqueid)),
												{uniqueid, TrendDataCount := COUNT(GROUP)}, uniqueid, LOCAL)(TrendDataCount = 25);
												
	TrendedDataFlag := JOIN(IterateRecs, TrendDataFlagDs,
										 LEFT.uniqueid = RIGHT.uniqueid,
										 TRANSFORM(NCF_Layout.Layout_Trade,
										 SELF.TDTrendedDataFlag := IF(RIGHT.TrendDataCount = 25, FALSE, TRUE),
										 SELF.TDTrendedDataStartDate := IF(RIGHT.TrendDataCount = 25, '00000000', LEFT.TDTrendedDataStartDate),
										 SELF := LEFT), LEFT OUTER, HASH);										 

	RETURN SEQUENTIAL(FileUtil.FN_OutputAndPromoteFile(HeaderRecord, Files.base_prefix, 'HeaderRecord', WORKUNIT[2..9]  + WORKUNIT[11..16]),
									FileUtil.FN_OutputAndPromoteFile(InquiryRecord, Files.base_prefix, 'InquiryRecord', WORKUNIT[2..9]  + WORKUNIT[11..16]),
									FileUtil.FN_OutputAndPromoteFile(PublicRecord, Files.base_prefix, 'PublicRecord', WORKUNIT[2..9]  + WORKUNIT[11..16]),
									FileUtil.FN_OutputAndPromoteFile(CollectionRecord, Files.base_prefix, 'CollectionRecord', WORKUNIT[2..9]  + WORKUNIT[11..16]),
									FileUtil.FN_OutputAndPromoteFile(TrendedDataFlag, Files.base_prefix, 'TradeRecord', WORKUNIT[2..9]  + WORKUNIT[11..16]));
									
END;