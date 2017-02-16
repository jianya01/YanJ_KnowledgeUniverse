EXPORT Layout_TradeTrended_Input := RECORD
	UNSIGNED8 UniqueId;
	UNSIGNED8 TradeKey;
	UNSIGNED1	TDTrendedOccurence;
	UNSIGNED4	TDBalanceAmount;
	UNSIGNED4	TDLoanAmountCreditLimit;
	UNSIGNED4	TDScheduledPayment;
	UNSIGNED4	TDActualPayment;
	STRING8	TDLastPaymentDate;
	UNSIGNED1	TDActualPaymentNullInd;
END;