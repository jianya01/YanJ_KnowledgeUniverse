EXPORT Layout_PublicRecord := RECORD
	STRING5	RecordID;
	STRING3	BureauCode;
	STRING8	HDDateOfReport;
	STRING30 ReferenceNumber;
	STRING3	PRTypeStatus;
	STRING8	PRDateFiled;
	UNSIGNED4	PRPublicRecordAmount;
	STRING1	PRECOA;
	STRING3	PRNarrativeCode1;
	STRING3	PRNarrativeCode2;
	STRING8	PRStatusDate;
	STRING1	PRConsumerDisputeFlag;
	STRING40 PRPlaintiff;
	STRING40 PRDefendant;
	STRING10 PRCourtNumber;
	STRING30 PRCaseNumber;
	UNSIGNED8	LexID;	
END;