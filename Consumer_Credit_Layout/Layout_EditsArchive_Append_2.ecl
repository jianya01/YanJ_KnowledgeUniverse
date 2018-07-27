EXPORT Layout_EditsArchive_Append_2 := RECORD
	STRING16    Transaction_id;
	UNSIGNED8   LexID;
	STRING8     HDDateOfReport;
	UNSIGNED2	JulianDate;				// yyddd format
	UNSIGNED4	RemainingRefNo;			// Remaining 9 bytes of reference number
	UNSIGNED1	ReportSource;			// 0 = HPCC, 1 = Mainframe (note: 400 offset removed from yydddd)
	                                    // 2 = Bookscore, First character was 8, replaced with 5 to fit UNSIGNED2
										// 10+ = duplicate referencenumber
	UNSIGNED2	LineNumber;				// Edits Sequence within this report
	UNSIGNED6	OriginalRefNo;			// Original Reference Number considering HPCC and Mainframe
	UNSIGNED1	ReportTypeCounter;		// Primary Subject = 1, Secondary Subject = 2 
	UNSIGNED2	RecordTypeCounter;		// Eligible Record Types assigned a sequence number across a reference number
	UNSIGNED3	NarrativeRemarkCounter; // Eligible NR51 Records assigned a sequence number across a reference number and a Record Type
	UNSIGNED1	SH51Type;				// INQRY Section = 1, IDENT Section = 2
	UNSIGNED2	SH51TypeSeq;			// Sequence number among INQRY AND IDENT Section records
	STRING3 BureauCode; // Experian - XPN ; Transunion - TRU ; Equifax - EFX
	UNSIGNED1 FI90Seq; //Sequence number for FI90
	UNSIGNED1 FI93Seq; //Sequence number for FI93
	STRING230	Edits;					// Edits Record
END;