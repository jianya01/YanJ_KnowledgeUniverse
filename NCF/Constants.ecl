EXPORT Constants := MODULE
	EXPORT STRING TIPFileLandingZonePath := '/ap/p/archive5/NCF/data/exp.archive.sf1212exp';
	EXPORT STRING HeaderFileLandingZonePath := '/ap/archive5/NCF/data/exp.archive.sf1212scr';
	EXPORT STRING HeaderFinalLandingZonePath := '/ap/archive5/NCF/data/TIPmockData03/sf1212hdmock.txt';
	EXPORT STRING TradeFinalLandingZonePath := '/ap/archive5/NCF/data/TIPmockData03/SF1212TIPTR.txt';
	EXPORT STRING InquiryFinalLandingZonePath := '/ap/archive5/NCF/data/TIPmockData03/sf1212xpniq.txt';
	EXPORT STRING PublicRecordFinalLandingZonePath := '/ap/archive5/NCF/data/TIPmockData03/SF1212TIPPR.txt';
	EXPORT STRING CollectionFinalLandingZonePath := '/ap/archive5/NCF/data/TIPmockData03/SF1212TIPCO.txt';
	EXPORT STRING TradeTrendedFinalLandingZonePath := '/ap/archive5/NCF/data/TIPmockData03/SF1212TIPTD.txt';
	EXPORT STRING ModelingIP := '10.195.97.26'; // alalpmod003
	EXPORT STRING IVUnixSourceIP := '172.25.253.17'; // alauppnc055
	EXPORT STRING srcCSVPipeseparator := '|';
	EXPORT STRING srcCSVterminator := '\n';
	EXPORT STRING devDestinationgroup := 'analyt_thor400_90_a';
	EXPORT STRING prodDestinationgroup := 'analyt_thor400_90_prod';
	EXPORT CurrentRateCodeConversionTable := DATASET([{'0','0'},
																										{'N','N'},
																										{'C','1'},
																										{'1','2'},
																										{'2','3'},
																										{'3','4'},
																										{'4','5'},
																										{'5','6'},
																										{'6','7'},
																										{'G','Y'},
																										{'7','M'},
																										{'K','8'},
																										{'8','I'},
																										{'J','8A'},
																										{'L','9'},
																										{'9','9A'},
																										{'B','X'},
																										{'H','G'},
																										{'-','-'}],
																										{STRING1 Exp_Payment_Profile_Indicator, STRING2 LN_Standardized_Code});
																										
	EXPORT PaymentProfileConversionTable := DATASET([{'0','0'},
																									 {'N','N'},
																									 {'C','1'},
																									 {'1','2'},
																									 {'2','3'},
																									 {'3','4'},
																									 {'4','5'},
																									 {'5','6'},
																									 {'6','7'},
																									 {'G','Y'},
																									 {'7','M'},
																									 {'K','8'},
																									 {'8','I'},
																									 {'H','G'},
																									 {'L','9'},
																									 {'9','9'},
																									 {'B','X'},
																									 {'J','8'},
																									 {'-','-'}],
																									 {STRING1 Exp_Payment_Profile_Indicator, STRING1 LN_Standardized_Code});
 																									
END;