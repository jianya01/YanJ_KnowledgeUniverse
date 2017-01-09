EXPORT Layout_Inquiry := RECORD
	STRING5	RecordID;
	STRING3	BureauCode;
	STRING8	HDDateOfReport;
	STRING30 ReferenceNumber;
	STRING8	IQInquiryDate;
	STRING10 IQMemberNumber;
	STRING2	IQKOB;
	STRING30 IQMemberName;
	UNSIGNED4	IQAmount;
	STRING2	IQType;
	STRING8	IQAbbreviation;
	STRING4	IQTerms;
	UNSIGNED8	LexID;	
END;