IMPORT NCF_Layout;

EXPORT Format_TradeTrended_NormalizeData := FUNCTION

	NCF_Layout.Layout_TradeTrended NormIt(NCF_Layout.Layout_Trade L, INTEGER C) := TRANSFORM
		SELF.TDTrendedOccurence := L.TDTradeTrendedData[C].TDTrendedOccurence;
		SELF.TDBalanceAmount := L.TDTradeTrendedData[C].TDBalanceAmount;
		SELF.TDLoanAmountCreditLimit := L.TDTradeTrendedData[C].TDLoanAmountCreditLimit;
		SELF.TDScheduledPayment := L.TDTradeTrendedData[C].TDScheduledPayment;
		SELF.TDActualPayment := L.TDTradeTrendedData[C].TDActualPayment;
		SELF.TDLastPaymentDate := L.TDTradeTrendedData[C].TDLastPaymentDate;
		SELF.TDActualPaymentNullInd := L.TDTradeTrendedData[C].TDActualPaymentNullInd;
		SELF := L;
	END;

	NormTrade := NORMALIZE(NCF.Files.Trade_Data,25,NormIt(LEFT,COUNTER));

	RETURN FileUtil.FN_OutputAndPromoteFile(NormTrade, Files.base_prefix, 'TradeTrendedRecord', WORKUNIT[2..9]  + WORKUNIT[11..16]);
	
END;