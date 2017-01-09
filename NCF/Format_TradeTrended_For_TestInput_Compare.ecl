IMPORT NCF_Layout;

EXPORT Format_TradeTrended_For_TestInput_Compare := FUNCTION

	FormatDate(STRING8 Indate) := FUNCTION
		STRING8 OutDate := IF(Indate = '', '00000000', Indate);
		RETURN OutDate;	
	END;
	
	NormalizedRecLayout := RECORD
		UNSIGNED8 UniqueId;
		UNSIGNED2 TradeKey;
		STRING5 RecordId;
		STRING3 BureauCode;
		STRING8 HDDateOfReport;
		STRING30 ReferenceNumber;
		UNSIGNED8	LexID;
		STRING8 TDTrendedDataStartDate;
		UNSIGNED1	TDTrendedOccurence;
		UNSIGNED4	TDBalanceAmount;
		UNSIGNED4	TDLoanAmountCreditLimit;
		UNSIGNED4	TDScheduledPayment;
		UNSIGNED4	TDActualPayment;
		STRING8	TDLastPaymentDate;
		UNSIGNED1	TDActualPaymentNullInd;
	END;

	NormalizedRecLayout NormIt(NCF_Layout.Layout_Trade L, INTEGER C) := TRANSFORM
		SELF.TDTrendedOccurence := L.TDTradeTrendedData[C].TDTrendedOccurence;
		SELF.TDBalanceAmount := L.TDTradeTrendedData[C].TDBalanceAmount;
		SELF.TDLoanAmountCreditLimit := L.TDTradeTrendedData[C].TDLoanAmountCreditLimit;
		SELF.TDScheduledPayment := L.TDTradeTrendedData[C].TDScheduledPayment;
		SELF.TDActualPayment := L.TDTradeTrendedData[C].TDActualPayment;
		SELF.TDLastPaymentDate := L.TDTradeTrendedData[C].TDLastPaymentDate;
		SELF.TDActualPaymentNullInd := L.TDTradeTrendedData[C].TDActualPaymentNullInd;
		SELF := L;
	END;

	NormTrade := NORMALIZE(NCF.Files.Trade_Data(TDTrendedDataFlag),25,NormIt(LEFT,COUNTER));
																
	DenormRec := RECORD
		{UNSIGNED8 Uniqueid, NCF_Layout.Layout_TradeTrended_TestInput};
	END;
						 
	TradeUnique := PROJECT(DEDUP(SORT(DISTRIBUTE(NormTrade, HASH32(UniqueId)), UniqueId, LOCAL), UniqueId, LOCAL),
								 TRANSFORM(DenormRec,
								 SELF := LEFT,
								 SELF := []));								 
								 
	DenormRec DeNormThem(DenormRec L, NormalizedRecLayout R, INTEGER C) := TRANSFORM
		SELF.TDBalanceAmountM01 := IF(R.TDTrendedOccurence=1, R.TDBalanceAmount, L.TDBalanceAmountM01);
		SELF.TDLoanAmountCreditLimitM01 := IF(R.TDTrendedOccurence=1, R.TDLoanAmountCreditLimit, L.TDLoanAmountCreditLimitM01);
		SELF.TDScheduledPaymentM01 := IF(R.TDTrendedOccurence=1, R.TDScheduledPayment, L.TDScheduledPaymentM01);
		SELF.TDActualPaymentM01 := IF(R.TDTrendedOccurence=1, R.TDActualPayment, L.TDActualPaymentM01);
		SELF.TDLastPaymentDateM01 := IF(R.TDTrendedOccurence=1, FormatDate(R.TDLastPaymentDate), L.TDLastPaymentDateM01);
		SELF.TDActualPaymentNullIndM01 := IF(R.TDTrendedOccurence=1, R.TDActualPaymentNullInd, L.TDActualPaymentNullIndM01);	
		SELF.TDBalanceAmountM02 := IF(R.TDTrendedOccurence=2, R.TDBalanceAmount, L.TDBalanceAmountM02);
		SELF.TDLoanAmountCreditLimitM02 := IF(R.TDTrendedOccurence=2, R.TDLoanAmountCreditLimit, L.TDLoanAmountCreditLimitM02);
		SELF.TDScheduledPaymentM02 := IF(R.TDTrendedOccurence=2, R.TDScheduledPayment, L.TDScheduledPaymentM02);
		SELF.TDActualPaymentM02 := IF(R.TDTrendedOccurence=2, R.TDActualPayment, L.TDActualPaymentM02);
		SELF.TDLastPaymentDateM02 := IF(R.TDTrendedOccurence=2, FormatDate(R.TDLastPaymentDate), L.TDLastPaymentDateM02);
		SELF.TDActualPaymentNullIndM02 := IF(R.TDTrendedOccurence=2, R.TDActualPaymentNullInd, L.TDActualPaymentNullIndM02);
		SELF.TDBalanceAmountM03 := IF(R.TDTrendedOccurence=3, R.TDBalanceAmount, L.TDBalanceAmountM03);
		SELF.TDLoanAmountCreditLimitM03 := IF(R.TDTrendedOccurence=3, R.TDLoanAmountCreditLimit, L.TDLoanAmountCreditLimitM03);
		SELF.TDScheduledPaymentM03 := IF(R.TDTrendedOccurence=3, R.TDScheduledPayment, L.TDScheduledPaymentM03);
		SELF.TDActualPaymentM03 := IF(R.TDTrendedOccurence=3, R.TDActualPayment, L.TDActualPaymentM03);
		SELF.TDLastPaymentDateM03 := IF(R.TDTrendedOccurence=3, FormatDate(R.TDLastPaymentDate), L.TDLastPaymentDateM03);
		SELF.TDActualPaymentNullIndM03 := IF(R.TDTrendedOccurence=3, R.TDActualPaymentNullInd, L.TDActualPaymentNullIndM03);
		SELF.TDBalanceAmountM04 := IF(R.TDTrendedOccurence=4, R.TDBalanceAmount, L.TDBalanceAmountM04);
		SELF.TDLoanAmountCreditLimitM04 := IF(R.TDTrendedOccurence=4, R.TDLoanAmountCreditLimit, L.TDLoanAmountCreditLimitM04);
		SELF.TDScheduledPaymentM04 := IF(R.TDTrendedOccurence=4, R.TDScheduledPayment, L.TDScheduledPaymentM04);
		SELF.TDActualPaymentM04 := IF(R.TDTrendedOccurence=4, R.TDActualPayment, L.TDActualPaymentM04);
		SELF.TDLastPaymentDateM04 := IF(R.TDTrendedOccurence=4, FormatDate(R.TDLastPaymentDate), L.TDLastPaymentDateM04);
		SELF.TDActualPaymentNullIndM04 := IF(R.TDTrendedOccurence=4, R.TDActualPaymentNullInd, L.TDActualPaymentNullIndM04);
		SELF.TDBalanceAmountM05 := IF(R.TDTrendedOccurence=5, R.TDBalanceAmount, L.TDBalanceAmountM05);
		SELF.TDLoanAmountCreditLimitM05 := IF(R.TDTrendedOccurence=5, R.TDLoanAmountCreditLimit, L.TDLoanAmountCreditLimitM05);
		SELF.TDScheduledPaymentM05 := IF(R.TDTrendedOccurence=5, R.TDScheduledPayment, L.TDScheduledPaymentM05);
		SELF.TDActualPaymentM05 := IF(R.TDTrendedOccurence=5, R.TDActualPayment, L.TDActualPaymentM05);
		SELF.TDLastPaymentDateM05 := IF(R.TDTrendedOccurence=5, FormatDate(R.TDLastPaymentDate), L.TDLastPaymentDateM05);
		SELF.TDActualPaymentNullIndM05 := IF(R.TDTrendedOccurence=5, R.TDActualPaymentNullInd, L.TDActualPaymentNullIndM05);
		SELF.TDBalanceAmountM06 := IF(R.TDTrendedOccurence=6, R.TDBalanceAmount, L.TDBalanceAmountM06);
		SELF.TDLoanAmountCreditLimitM06 := IF(R.TDTrendedOccurence=6, R.TDLoanAmountCreditLimit, L.TDLoanAmountCreditLimitM06);
		SELF.TDScheduledPaymentM06 := IF(R.TDTrendedOccurence=6, R.TDScheduledPayment, L.TDScheduledPaymentM06);
		SELF.TDActualPaymentM06 := IF(R.TDTrendedOccurence=6, R.TDActualPayment, L.TDActualPaymentM06);
		SELF.TDLastPaymentDateM06 := IF(R.TDTrendedOccurence=6, FormatDate(R.TDLastPaymentDate), L.TDLastPaymentDateM06);
		SELF.TDActualPaymentNullIndM06 := IF(R.TDTrendedOccurence=6, R.TDActualPaymentNullInd, L.TDActualPaymentNullIndM06);
		SELF.TDBalanceAmountM07 := IF(R.TDTrendedOccurence=7, R.TDBalanceAmount, L.TDBalanceAmountM07);
		SELF.TDLoanAmountCreditLimitM07 := IF(R.TDTrendedOccurence=7, R.TDLoanAmountCreditLimit, L.TDLoanAmountCreditLimitM07);
		SELF.TDScheduledPaymentM07 := IF(R.TDTrendedOccurence=7, R.TDScheduledPayment, L.TDScheduledPaymentM07);
		SELF.TDActualPaymentM07 := IF(R.TDTrendedOccurence=7, R.TDActualPayment, L.TDActualPaymentM07);
		SELF.TDLastPaymentDateM07 := IF(R.TDTrendedOccurence=7, FormatDate(R.TDLastPaymentDate), L.TDLastPaymentDateM07);
		SELF.TDActualPaymentNullIndM07 := IF(R.TDTrendedOccurence=7, R.TDActualPaymentNullInd, L.TDActualPaymentNullIndM07);
		SELF.TDBalanceAmountM08 := IF(R.TDTrendedOccurence=8, R.TDBalanceAmount, L.TDBalanceAmountM08);
		SELF.TDLoanAmountCreditLimitM08 := IF(R.TDTrendedOccurence=8, R.TDLoanAmountCreditLimit, L.TDLoanAmountCreditLimitM08);
		SELF.TDScheduledPaymentM08 := IF(R.TDTrendedOccurence=8, R.TDScheduledPayment, L.TDScheduledPaymentM08);
		SELF.TDActualPaymentM08 := IF(R.TDTrendedOccurence=8, R.TDActualPayment, L.TDActualPaymentM08);
		SELF.TDLastPaymentDateM08 := IF(R.TDTrendedOccurence=8, FormatDate(R.TDLastPaymentDate), L.TDLastPaymentDateM08);
		SELF.TDActualPaymentNullIndM08 := IF(R.TDTrendedOccurence=8, R.TDActualPaymentNullInd, L.TDActualPaymentNullIndM08);
		SELF.TDBalanceAmountM09 := IF(R.TDTrendedOccurence=9, R.TDBalanceAmount, L.TDBalanceAmountM09);
		SELF.TDLoanAmountCreditLimitM09 := IF(R.TDTrendedOccurence=9, R.TDLoanAmountCreditLimit, L.TDLoanAmountCreditLimitM09);
		SELF.TDScheduledPaymentM09 := IF(R.TDTrendedOccurence=9, R.TDScheduledPayment, L.TDScheduledPaymentM09);
		SELF.TDActualPaymentM09 := IF(R.TDTrendedOccurence=9, R.TDActualPayment, L.TDActualPaymentM09);
		SELF.TDLastPaymentDateM09 := IF(R.TDTrendedOccurence=9, FormatDate(R.TDLastPaymentDate), L.TDLastPaymentDateM09);
		SELF.TDActualPaymentNullIndM09 := IF(R.TDTrendedOccurence=9, R.TDActualPaymentNullInd, L.TDActualPaymentNullIndM09);
		SELF.TDBalanceAmountM10 := IF(R.TDTrendedOccurence=10, R.TDBalanceAmount, L.TDBalanceAmountM10);
		SELF.TDLoanAmountCreditLimitM10 := IF(R.TDTrendedOccurence=10, R.TDLoanAmountCreditLimit, L.TDLoanAmountCreditLimitM10);
		SELF.TDScheduledPaymentM10 := IF(R.TDTrendedOccurence=10, R.TDScheduledPayment, L.TDScheduledPaymentM10);
		SELF.TDActualPaymentM10 := IF(R.TDTrendedOccurence=10, R.TDActualPayment, L.TDActualPaymentM10);
		SELF.TDLastPaymentDateM10 := IF(R.TDTrendedOccurence=10, FormatDate(R.TDLastPaymentDate), L.TDLastPaymentDateM10);
		SELF.TDActualPaymentNullIndM10 := IF(R.TDTrendedOccurence=10, R.TDActualPaymentNullInd, L.TDActualPaymentNullIndM10);
		SELF.TDBalanceAmountM11 := IF(R.TDTrendedOccurence=11, R.TDBalanceAmount, L.TDBalanceAmountM11);
		SELF.TDLoanAmountCreditLimitM11 := IF(R.TDTrendedOccurence=11, R.TDLoanAmountCreditLimit, L.TDLoanAmountCreditLimitM11);
		SELF.TDScheduledPaymentM11 := IF(R.TDTrendedOccurence=11, R.TDScheduledPayment, L.TDScheduledPaymentM11);
		SELF.TDActualPaymentM11 := IF(R.TDTrendedOccurence=11, R.TDActualPayment, L.TDActualPaymentM11);
		SELF.TDLastPaymentDateM11 := IF(R.TDTrendedOccurence=11, FormatDate(R.TDLastPaymentDate), L.TDLastPaymentDateM11);
		SELF.TDActualPaymentNullIndM11 := IF(R.TDTrendedOccurence=11, R.TDActualPaymentNullInd, L.TDActualPaymentNullIndM11);
		SELF.TDBalanceAmountM12 := IF(R.TDTrendedOccurence=12, R.TDBalanceAmount, L.TDBalanceAmountM12);
		SELF.TDLoanAmountCreditLimitM12 := IF(R.TDTrendedOccurence=12, R.TDLoanAmountCreditLimit, L.TDLoanAmountCreditLimitM12);
		SELF.TDScheduledPaymentM12 := IF(R.TDTrendedOccurence=12, R.TDScheduledPayment, L.TDScheduledPaymentM12);
		SELF.TDActualPaymentM12 := IF(R.TDTrendedOccurence=12, R.TDActualPayment, L.TDActualPaymentM12);
		SELF.TDLastPaymentDateM12 := IF(R.TDTrendedOccurence=12, FormatDate(R.TDLastPaymentDate), L.TDLastPaymentDateM12);
		SELF.TDActualPaymentNullIndM12 := IF(R.TDTrendedOccurence=12, R.TDActualPaymentNullInd, L.TDActualPaymentNullIndM12);
		SELF.TDBalanceAmountM13 := IF(R.TDTrendedOccurence=13, R.TDBalanceAmount, L.TDBalanceAmountM13);
		SELF.TDLoanAmountCreditLimitM13 := IF(R.TDTrendedOccurence=13, R.TDLoanAmountCreditLimit, L.TDLoanAmountCreditLimitM13);
		SELF.TDScheduledPaymentM13 := IF(R.TDTrendedOccurence=13, R.TDScheduledPayment, L.TDScheduledPaymentM13);
		SELF.TDActualPaymentM13 := IF(R.TDTrendedOccurence=13, R.TDActualPayment, L.TDActualPaymentM13);
		SELF.TDLastPaymentDateM13 := IF(R.TDTrendedOccurence=13, FormatDate(R.TDLastPaymentDate), L.TDLastPaymentDateM13);
		SELF.TDActualPaymentNullIndM13 := IF(R.TDTrendedOccurence=13, R.TDActualPaymentNullInd, L.TDActualPaymentNullIndM13);
		SELF.TDBalanceAmountM14 := IF(R.TDTrendedOccurence=14, R.TDBalanceAmount, L.TDBalanceAmountM14);
		SELF.TDLoanAmountCreditLimitM14 := IF(R.TDTrendedOccurence=14, R.TDLoanAmountCreditLimit, L.TDLoanAmountCreditLimitM14);
		SELF.TDScheduledPaymentM14 := IF(R.TDTrendedOccurence=14, R.TDScheduledPayment, L.TDScheduledPaymentM14);
		SELF.TDActualPaymentM14 := IF(R.TDTrendedOccurence=14, R.TDActualPayment, L.TDActualPaymentM14);
		SELF.TDLastPaymentDateM14 := IF(R.TDTrendedOccurence=14, FormatDate(R.TDLastPaymentDate), L.TDLastPaymentDateM14);
		SELF.TDActualPaymentNullIndM14 := IF(R.TDTrendedOccurence=14, R.TDActualPaymentNullInd, L.TDActualPaymentNullIndM14);
		SELF.TDBalanceAmountM15 := IF(R.TDTrendedOccurence=15, R.TDBalanceAmount, L.TDBalanceAmountM15);
		SELF.TDLoanAmountCreditLimitM15 := IF(R.TDTrendedOccurence=15, R.TDLoanAmountCreditLimit, L.TDLoanAmountCreditLimitM15);
		SELF.TDScheduledPaymentM15 := IF(R.TDTrendedOccurence=15, R.TDScheduledPayment, L.TDScheduledPaymentM15);
		SELF.TDActualPaymentM15 := IF(R.TDTrendedOccurence=15, R.TDActualPayment, L.TDActualPaymentM15);
		SELF.TDLastPaymentDateM15 := IF(R.TDTrendedOccurence=15, FormatDate(R.TDLastPaymentDate), L.TDLastPaymentDateM15);
		SELF.TDActualPaymentNullIndM15 := IF(R.TDTrendedOccurence=15, R.TDActualPaymentNullInd, L.TDActualPaymentNullIndM15);
		SELF.TDBalanceAmountM16 := IF(R.TDTrendedOccurence=16, R.TDBalanceAmount, L.TDBalanceAmountM16);
		SELF.TDLoanAmountCreditLimitM16 := IF(R.TDTrendedOccurence=16, R.TDLoanAmountCreditLimit, L.TDLoanAmountCreditLimitM16);
		SELF.TDScheduledPaymentM16 := IF(R.TDTrendedOccurence=16, R.TDScheduledPayment, L.TDScheduledPaymentM16);
		SELF.TDActualPaymentM16 := IF(R.TDTrendedOccurence=16, R.TDActualPayment, L.TDActualPaymentM16);
		SELF.TDLastPaymentDateM16 := IF(R.TDTrendedOccurence=16, FormatDate(R.TDLastPaymentDate), L.TDLastPaymentDateM16);
		SELF.TDActualPaymentNullIndM16 := IF(R.TDTrendedOccurence=16, R.TDActualPaymentNullInd, L.TDActualPaymentNullIndM16);
		SELF.TDBalanceAmountM17 := IF(R.TDTrendedOccurence=17, R.TDBalanceAmount, L.TDBalanceAmountM17);
		SELF.TDLoanAmountCreditLimitM17 := IF(R.TDTrendedOccurence=17, R.TDLoanAmountCreditLimit, L.TDLoanAmountCreditLimitM17);
		SELF.TDScheduledPaymentM17 := IF(R.TDTrendedOccurence=17, R.TDScheduledPayment, L.TDScheduledPaymentM17);
		SELF.TDActualPaymentM17 := IF(R.TDTrendedOccurence=17, R.TDActualPayment, L.TDActualPaymentM17);
		SELF.TDLastPaymentDateM17 := IF(R.TDTrendedOccurence=17, FormatDate(R.TDLastPaymentDate), L.TDLastPaymentDateM17);
		SELF.TDActualPaymentNullIndM17 := IF(R.TDTrendedOccurence=17, R.TDActualPaymentNullInd, L.TDActualPaymentNullIndM17);
		SELF.TDBalanceAmountM18 := IF(R.TDTrendedOccurence=18, R.TDBalanceAmount, L.TDBalanceAmountM18);
		SELF.TDLoanAmountCreditLimitM18 := IF(R.TDTrendedOccurence=18, R.TDLoanAmountCreditLimit, L.TDLoanAmountCreditLimitM18);
		SELF.TDScheduledPaymentM18 := IF(R.TDTrendedOccurence=18, R.TDScheduledPayment, L.TDScheduledPaymentM18);
		SELF.TDActualPaymentM18 := IF(R.TDTrendedOccurence=18, R.TDActualPayment, L.TDActualPaymentM18);
		SELF.TDLastPaymentDateM18 := IF(R.TDTrendedOccurence=18, FormatDate(R.TDLastPaymentDate), L.TDLastPaymentDateM18);
		SELF.TDActualPaymentNullIndM18 := IF(R.TDTrendedOccurence=18, R.TDActualPaymentNullInd, L.TDActualPaymentNullIndM18);
		SELF.TDBalanceAmountM19 := IF(R.TDTrendedOccurence=19, R.TDBalanceAmount, L.TDBalanceAmountM19);
		SELF.TDLoanAmountCreditLimitM19 := IF(R.TDTrendedOccurence=19, R.TDLoanAmountCreditLimit, L.TDLoanAmountCreditLimitM19);
		SELF.TDScheduledPaymentM19 := IF(R.TDTrendedOccurence=19, R.TDScheduledPayment, L.TDScheduledPaymentM19);
		SELF.TDActualPaymentM19 := IF(R.TDTrendedOccurence=19, R.TDActualPayment, L.TDActualPaymentM19);
		SELF.TDLastPaymentDateM19 := IF(R.TDTrendedOccurence=19, FormatDate(R.TDLastPaymentDate), L.TDLastPaymentDateM19);
		SELF.TDActualPaymentNullIndM19 := IF(R.TDTrendedOccurence=19, R.TDActualPaymentNullInd, L.TDActualPaymentNullIndM19);
		SELF.TDBalanceAmountM20 := IF(R.TDTrendedOccurence=20, R.TDBalanceAmount, L.TDBalanceAmountM20);
		SELF.TDLoanAmountCreditLimitM20 := IF(R.TDTrendedOccurence=20, R.TDLoanAmountCreditLimit, L.TDLoanAmountCreditLimitM20);
		SELF.TDScheduledPaymentM20 := IF(R.TDTrendedOccurence=20, R.TDScheduledPayment, L.TDScheduledPaymentM20);
		SELF.TDActualPaymentM20 := IF(R.TDTrendedOccurence=20, R.TDActualPayment, L.TDActualPaymentM20);
		SELF.TDLastPaymentDateM20 := IF(R.TDTrendedOccurence=20, FormatDate(R.TDLastPaymentDate), L.TDLastPaymentDateM20);
		SELF.TDActualPaymentNullIndM20 := IF(R.TDTrendedOccurence=20, R.TDActualPaymentNullInd, L.TDActualPaymentNullIndM20);
		SELF.TDBalanceAmountM21 := IF(R.TDTrendedOccurence=21, R.TDBalanceAmount, L.TDBalanceAmountM21);
		SELF.TDLoanAmountCreditLimitM21 := IF(R.TDTrendedOccurence=21, R.TDLoanAmountCreditLimit, L.TDLoanAmountCreditLimitM21);
		SELF.TDScheduledPaymentM21 := IF(R.TDTrendedOccurence=21, R.TDScheduledPayment, L.TDScheduledPaymentM21);
		SELF.TDActualPaymentM21 := IF(R.TDTrendedOccurence=21, R.TDActualPayment, L.TDActualPaymentM21);
		SELF.TDLastPaymentDateM21 := IF(R.TDTrendedOccurence=21, FormatDate(R.TDLastPaymentDate), L.TDLastPaymentDateM21);
		SELF.TDActualPaymentNullIndM21 := IF(R.TDTrendedOccurence=21, R.TDActualPaymentNullInd, L.TDActualPaymentNullIndM21);
		SELF.TDBalanceAmountM22 := IF(R.TDTrendedOccurence=22, R.TDBalanceAmount, L.TDBalanceAmountM22);
		SELF.TDLoanAmountCreditLimitM22 := IF(R.TDTrendedOccurence=22, R.TDLoanAmountCreditLimit, L.TDLoanAmountCreditLimitM22);
		SELF.TDScheduledPaymentM22 := IF(R.TDTrendedOccurence=22, R.TDScheduledPayment, L.TDScheduledPaymentM22);
		SELF.TDActualPaymentM22 := IF(R.TDTrendedOccurence=22, R.TDActualPayment, L.TDActualPaymentM22);
		SELF.TDLastPaymentDateM22 := IF(R.TDTrendedOccurence=22, FormatDate(R.TDLastPaymentDate), L.TDLastPaymentDateM22);
		SELF.TDActualPaymentNullIndM22 := IF(R.TDTrendedOccurence=22, R.TDActualPaymentNullInd, L.TDActualPaymentNullIndM22);
		SELF.TDBalanceAmountM23 := IF(R.TDTrendedOccurence=23, R.TDBalanceAmount, L.TDBalanceAmountM23);
		SELF.TDLoanAmountCreditLimitM23 := IF(R.TDTrendedOccurence=23, R.TDLoanAmountCreditLimit, L.TDLoanAmountCreditLimitM23);
		SELF.TDScheduledPaymentM23 := IF(R.TDTrendedOccurence=23, R.TDScheduledPayment, L.TDScheduledPaymentM23);
		SELF.TDActualPaymentM23 := IF(R.TDTrendedOccurence=23, R.TDActualPayment, L.TDActualPaymentM23);
		SELF.TDLastPaymentDateM23 := IF(R.TDTrendedOccurence=23, FormatDate(R.TDLastPaymentDate), L.TDLastPaymentDateM23);
		SELF.TDActualPaymentNullIndM23 := IF(R.TDTrendedOccurence=23, R.TDActualPaymentNullInd, L.TDActualPaymentNullIndM23);
		SELF.TDBalanceAmountM24 := IF(R.TDTrendedOccurence=24, R.TDBalanceAmount, L.TDBalanceAmountM24);
		SELF.TDLoanAmountCreditLimitM24 := IF(R.TDTrendedOccurence=24, R.TDLoanAmountCreditLimit, L.TDLoanAmountCreditLimitM24);
		SELF.TDScheduledPaymentM24 := IF(R.TDTrendedOccurence=24, R.TDScheduledPayment, L.TDScheduledPaymentM24);
		SELF.TDActualPaymentM24 := IF(R.TDTrendedOccurence=24, R.TDActualPayment, L.TDActualPaymentM24);
		SELF.TDLastPaymentDateM24 := IF(R.TDTrendedOccurence=24, FormatDate(R.TDLastPaymentDate), L.TDLastPaymentDateM24);
		SELF.TDActualPaymentNullIndM24 := IF(R.TDTrendedOccurence=24, R.TDActualPaymentNullInd, L.TDActualPaymentNullIndM24);
		SELF.TDBalanceAmountM25 := IF(R.TDTrendedOccurence=25, R.TDBalanceAmount, L.TDBalanceAmountM25);
		SELF.TDLoanAmountCreditLimitM25 := IF(R.TDTrendedOccurence=25, R.TDLoanAmountCreditLimit, L.TDLoanAmountCreditLimitM25);
		SELF.TDScheduledPaymentM25 := IF(R.TDTrendedOccurence=25, R.TDScheduledPayment, L.TDScheduledPaymentM25);
		SELF.TDActualPaymentM25 := IF(R.TDTrendedOccurence=25, R.TDActualPayment, L.TDActualPaymentM25);
		SELF.TDLastPaymentDateM25 := IF(R.TDTrendedOccurence=25, FormatDate(R.TDLastPaymentDate), L.TDLastPaymentDateM25);
		SELF.TDActualPaymentNullIndM25 := IF(R.TDTrendedOccurence=25, R.TDActualPaymentNullInd, L.TDActualPaymentNullIndM25);
		SELF := L;
		SELF := [];
	END;
											
	DeNormedRecs := PROJECT(DENORMALIZE(TradeUnique, NormTrade,
									LEFT.UniqueId = RIGHT.UniqueId,
									DeNormThem(LEFT,RIGHT,25)),
									TRANSFORM(NCF_Layout.Layout_TradeTrended_TestInput, 
									SELF.RecordId := IF(LEFT.RecordId = '357', '357T1', LEFT.RecordId),
									SELF := LEFT));

	RETURN FileUtil.FN_OutputAndPromoteFile(DeNormedRecs, Files.base_prefix, 'TradeTrendedRecordFormatted', WORKUNIT[2..9]  + WORKUNIT[11..16]);
	
END;