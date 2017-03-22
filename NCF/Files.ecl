IMPORT ut, NCF_Layout;

EXPORT Files := MODULE

  EXPORT prefix := '~';
  EXPORT base_prefix := prefix + 'thor::base::ncf';
	
	EXPORT Tip_Input_Spray_File := DATASET(base_prefix + '::prod::tipfile_csv', {STRING InputFile}, CSV(HEADING(0), SEPARATOR('|'), TERMINATOR('\n'), MAXLENGTH(8192)));
	
	EXPORT Header_Input_Spray_File := DATASET(base_prefix + '::prod::header_name_address_csv', {STRING InputHeaderFile}, CSV(HEADING(0), SEPARATOR('|'), TERMINATOR('\n'), MAXLENGTH(8192)));
	
	EXPORT Tip_Input_Data := DATASET(base_prefix + '::prod::tipfile', {STRING InputFile}, THOR);
	
	EXPORT Tip_Trade_Data := DATASET(base_prefix + '::prod::tip_trade', NCF_Layout.Layout_TIP_Trade, THOR);
	
	EXPORT Tip_Inquiry_Data := DATASET(base_prefix + '::prod::tip_inquiry', NCF_Layout.Layout_TIP_Inquiry, THOR);
	
	EXPORT Tip_PublicRecord_Data := DATASET(base_prefix + '::prod::tip_publicrecord', NCF_Layout.Layout_TIP_PublicRecord, THOR);
	
	EXPORT Header_Name_Adress_Data := DATASET(base_prefix + '::prod::header_name_address', NCF_Layout.Layout_Header_InputFile, THOR);
	
	EXPORT Header_Input_Data := DATASET(base_prefix + '::prod::header_input', NCF_Layout.Layout_Header_InputFile, THOR);
	
	EXPORT Header_Data := DATASET(base_prefix + '::prod::HeaderRecord', NCF_Layout.Layout_Header, THOR);
	
	EXPORT Inquiry_Data := DATASET(base_prefix + '::prod::InquiryRecord', NCF_Layout.Layout_Inquiry, THOR);

	EXPORT PublicRecord_Data := DATASET(base_prefix + '::prod::PublicRecord', NCF_Layout.Layout_PublicRecord, THOR);

	EXPORT Collection_Data := DATASET(base_prefix + '::prod::CollectionRecord', NCF_Layout.Layout_Collection, THOR);

	EXPORT Trade_Data := DATASET(base_prefix + '::prod::TradeRecord', NCF_Layout.Layout_Trade, THOR);
	
	EXPORT TradeTrended_Data := DATASET(base_prefix + '::prod::TradeTrendedRecord', NCF_Layout.Layout_TradeTrended, THOR);

	EXPORT TradeTrended_Input_Data := DATASET(base_prefix + '::prod::TradeTrended_Input', NCF_Layout.Layout_TradeTrended_Input, THOR);
	
	EXPORT TradeTrendedFormatted_Data := DATASET(base_prefix + '::prod::TradeTrendedRecordFormatted', NCF_Layout.Layout_TradeTrended_TestInput, THOR);
	
	EXPORT Header_Testinput_Data := DATASET(base_prefix + '::prod::testinput::HeaderRecord', NCF_Layout.Layout_Header, THOR);
	
	EXPORT Inquiry_Testinput_Data := DATASET(base_prefix + '::prod::testinput::InquiryRecord', NCF_Layout.Layout_Inquiry, THOR);

	EXPORT PublicRecord_Testinput_Data := DATASET(base_prefix + '::prod::testinput::PublicRecord', NCF_Layout.Layout_PublicRecord, THOR);

	EXPORT Collection_Testinput_Data := DATASET(base_prefix + '::prod::testinput::CollectionRecord', NCF_Layout.Layout_Collection, THOR);

	EXPORT Trade_Testinput_Data := DATASET(base_prefix + '::prod::testinput::TradeRecord', {NCF_Layout.Layout_Trade - [UniqueId, TDTrendedDataFlag, TDTradeTrendedData, TDTrendedDataStartDate]}, THOR);

	EXPORT TradeTrended_Testinput_Data := DATASET(base_prefix + '::prod::testinput::TradeTrendedRecord', NCF_Layout.Layout_TradeTrended_TestInput, THOR);
	
  EXPORT TransactionLogLiensJudgements  := DATASET(base_prefix + '::laj::transaction_log_lien_judgment', NCF_Layout.Layout_Transaction_Log_Lien_Judgement.t_Transaction_Log_Lien_JudgementRecord_csv, CSV(heading(0), SEPARATOR('|'), TERMINATOR('\n'))); 
			
	EXPORT Lien_JudgementsData := DATASET(base_prefix + '::Prod::Liens_JudgementsData', NCF_Layout.Layout_Log_NCF_Transaction_Log_Liens_Judgements, THOR,OPT);
	
	END;