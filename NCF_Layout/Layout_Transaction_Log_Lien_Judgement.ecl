EXPORT Layout_Transaction_Log_Lien_Judgement := MODULE

	EXPORT t_Transaction_Log_Lien_JudgementRecord_csv := RECORD
  STRING20 Transaction_ID {xpath('transaction_id')};
	STRING filler1;
	STRING Date_Loaded; // need to change this to Date Added
	STRING filler2;
	STRING20 Lex_ID {xpath('lex_id')};
	STRING filler3;
	STRING20 Vendor {xpath('vendor')};
	STRING filler4;
  STRING4 Process_Type {xpath('process_type')};
	STRING filler5;
	STRING20 Content_Type {xpath('Content_Type')};
	STRING filler6;
	STRING Content {xpath('Content'), maxlength(2000000)};
END;

END;



	