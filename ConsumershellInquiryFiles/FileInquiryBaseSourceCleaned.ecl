﻿IMPORT ConsumershellInquiryfiles, _Control;

EXPORT FileInquiryBaseSourceCleaned := MODULE
	
	FinalInquiryLayout := RECORD
		ConsumershellInquiryfiles.CommonLayout;
		String source;
		String dateofinquiry;
		String timeofinquiry;
	END;
	
	FinalInquiryLayout CleanDateTimeStamp({ConsumershellInquiryfiles.CommonLayout, string source} l) := TRANSFORM
		SELF.dateofinquiry := l.search_info.datetime[1..8],
		SELF.timeofinquiry := l.search_info.datetime[10..17];
		SELF := l;
	END;
	
	CleanedBaseSource := PROJECT(ConsumershellInquiryfiles.File_FCRA_Inquiry_BaseSource, CleanDateTimeStamp(LEFT));
	
	EXPORT FileInquiryCleaned := IF(COUNT(_Control.TransactionIDFilterSet) <= 0, 
		CleanedBaseSource,
		JOIN(DISTRIBUTE(CleanedBaseSource, HASH64((STRING75)search_info.transaction_id)), DISTRIBUTE(_Control.TransactionIDFilterSet(TRIM(TransactionID) != ''), HASH64(TransactionID)), (STRING75)LEFT.search_info.transaction_id = RIGHT.TransactionID, TRANSFORM(LEFT), LOCAL));
END;