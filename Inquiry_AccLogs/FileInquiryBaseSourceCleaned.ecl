IMPORT Inquiry_AccLogs, Str;

EXPORT FileInquiryBaseSourceCleaned := MODULE
	
	FinalInquiryLayout := RECORD
		Inquiry_AccLogs.CommonLayout - search_info__datetime;
		String source;
		String dateofinquiry;
		String timeofinquiry;
	END;
	
	FinalInquiryLayout CleanDateTimeStamp({Inquiry_AccLogs.CommonLayout, string source} l) := TRANSFORM
		SELF.dateofinquiry := l.search_info__datetime[1..8],
		SELF.timeofinquiry := l.search_info__datetime[10..17];
		SELF := l;
	END;
	
	EXPORT FileInquiryCleaned := PROJECT(Inquiry_AccLogs.File_FCRA_Inquiry_BaseSource, CleanDateTimeStamp(LEFT));
	
END;