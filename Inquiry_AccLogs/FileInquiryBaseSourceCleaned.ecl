IMPORT Inquiry_AccLogs, _Control;

EXPORT FileInquiryBaseSourceCleaned := MODULE
	
	FinalInquiryLayout := RECORD
		Inquiry_AccLogs.CommonLayout;
		String source;
		String dateofinquiry;
		String timeofinquiry;
	END;
	
	FinalInquiryLayout CleanDateTimeStamp({Inquiry_AccLogs.CommonLayout, string source} l) := TRANSFORM
		SELF.dateofinquiry := l.search_info.datetime[1..8],
		SELF.timeofinquiry := l.search_info.datetime[10..17];
		SELF := l;
	END;
	
	EXPORT FileInquiryCleaned := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, 
		PROJECT(Inquiry_AccLogs.File_FCRA_Inquiry_BaseSource, CleanDateTimeStamp(LEFT)),
		PROJECT(Inquiry_AccLogs.File_FCRA_Inquiry_BaseSource, CleanDateTimeStamp(LEFT)) (search_info.transaction_id IN _Control.TransactionIDFilterSet));
	
END;