EXPORT Layout_Header := RECORD
	STRING5	RecordId;
	STRING3	BureauCode;
	STRING2	HDBureauVersion;
	STRING8	HDDateOfReport;
	STRING30 ReferenceNumber;
	STRING1	HDPaymentHistoryType;
	STRING8	HDFileSinceDate;
	STRING8	HDBirthDate;
	STRING8	HDDeathDate;
	UNSIGNED1	HDConsumerStatementOnFileFlag;
	UNSIGNED8	LexID;
	STRING	Name;
	STRING	Address;
	STRING	CityStateZip;
END;