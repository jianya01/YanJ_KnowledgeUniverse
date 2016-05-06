//
// This Layout is used for the Archive of NCF reports
//
export Layout_EditsArchive := Record
	unsigned2		JulianDate;						// yyddd format
	unsigned4		RemainingRefNo;				// Remaining 9 bytes of reference number
	unsigned1		ReportSource;					// 0 = HPCC, 1 = Mainframe (note: 400 offset removed from yydddd)
	                                  // 2 = Bookscore, First character was 8, replaced with 5 to fit unsigned2
																		// 10+ = duplicate referencenumber
	unsigned2		LineNumber;						// Edits Sequence within this report
	string230		Edits;								// Edits Record
end;

