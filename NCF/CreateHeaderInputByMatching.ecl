IMPORT NCF_Layout;

EXPORT CreateHeaderInputByMatching := FUNCTION

		Unique_Record := DEDUP(SORT(DISTRIBUTE(Files.Tip_Input_Data, HASH32(InputFile[9..18])), InputFile[9..18], LOCAL), InputFile[9..18], LOCAL);

		MatchingHeaderRecords := JOIN(Files.Header_Name_Adress_Data, Unique_Record, LEFT.Record_Number = RIGHT.InputFile[9..18], 
														 TRANSFORM(NCF_Layout.Layout_Header_InputFile, SELF := LEFT), HASH);
													
		RETURN FileUtil.FN_OutputAndPromoteFile(MatchingHeaderRecords, Files.base_prefix, 'header_input', WORKUNIT[2..9] + WORKUNIT[11..16]);
		
END;		