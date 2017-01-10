// The following is to compare the Mock Data ingested from TIP data to Data processed using SAS

IMPORT NCF_Layout;

COUNT(JOIN(NCF.Files.Header_Data, NCF.Files.Header_Testinput_Data, LEFT = RIGHT, HASH));
COUNT(JOIN(NCF.Files.Header_Data, NCF.Files.Header_Testinput_Data, LEFT = RIGHT, LEFT ONLY, HASH));
COUNT(JOIN(NCF.Files.Header_Data, NCF.Files.Header_Testinput_Data, LEFT = RIGHT, RIGHT ONLY, HASH));

COUNT(JOIN(NCF.Files.Inquiry_Data, NCF.Files.Inquiry_Testinput_Data, LEFT = RIGHT, HASH));
COUNT(JOIN(NCF.Files.Inquiry_Data, NCF.Files.Inquiry_Testinput_Data, LEFT = RIGHT, LEFT ONLY, HASH));
COUNT(JOIN(NCF.Files.Inquiry_Data, NCF.Files.Inquiry_Testinput_Data, LEFT = RIGHT, RIGHT ONLY, HASH));

COUNT(JOIN(NCF.Files.PublicRecord_Data, NCF.Files.PublicRecord_Testinput_Data, LEFT = RIGHT, HASH));
COUNT(JOIN(NCF.Files.PublicRecord_Data, NCF.Files.PublicRecord_Testinput_Data, LEFT = RIGHT, LEFT ONLY, HASH));
COUNT(JOIN(NCF.Files.PublicRecord_Data, NCF.Files.PublicRecord_Testinput_Data, LEFT = RIGHT, RIGHT ONLY, HASH));

COUNT(JOIN(NCF.Files.Collection_Data, NCF.Files.Collection_Testinput_Data, LEFT = RIGHT, HASH));
COUNT(JOIN(NCF.Files.Collection_Data, NCF.Files.Collection_Testinput_Data, LEFT = RIGHT, LEFT ONLY, HASH));
COUNT(JOIN(NCF.Files.Collection_Data, NCF.Files.Collection_Testinput_Data, LEFT = RIGHT, RIGHT ONLY, HASH));

COUNT(JOIN(PROJECT(NCF.Files.Trade_Data, {NCF_Layout.Layout_Trade - [UniqueId, TDTrendedDataFlag, TDTrendedDataStartDate, TDTradeTrendedData]}), NCF.Files.Trade_Testinput_Data, LEFT = RIGHT, HASH));
COUNT(JOIN(PROJECT(NCF.Files.Trade_Data, {NCF_Layout.Layout_Trade - [UniqueId, TDTrendedDataFlag, TDTrendedDataStartDate, TDTradeTrendedData]}), NCF.Files.Trade_Testinput_Data, LEFT = RIGHT, LEFT ONLY, HASH));
COUNT(JOIN(PROJECT(NCF.Files.Trade_Data, {NCF_Layout.Layout_Trade - [UniqueId, TDTrendedDataFlag, TDTrendedDataStartDate, TDTradeTrendedData]}), NCF.Files.Trade_Testinput_Data, LEFT = RIGHT, RIGHT ONLY, HASH));

COUNT(JOIN(NCF.Files.TradeTrendedFormatted_Data, NCF.Files.TradeTrended_Testinput_Data, LEFT = RIGHT, HASH));
COUNT(JOIN(NCF.Files.TradeTrendedFormatted_Data, NCF.Files.TradeTrended_Testinput_Data, LEFT = RIGHT, LEFT ONLY, HASH));
COUNT(JOIN(NCF.Files.TradeTrendedFormatted_Data, NCF.Files.TradeTrended_Testinput_Data, LEFT = RIGHT, RIGHT ONLY, HASH));