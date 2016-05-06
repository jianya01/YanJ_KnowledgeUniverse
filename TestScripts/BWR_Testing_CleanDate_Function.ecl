#workunit('name', 'Testing_CleanDate_Function');

IMPORT STD, Consumer_Credit;

date1 := '20060203';	// 20060203
date2 := '20060232';	// 0
date3 := '';			// 0
date4 := '20060300';	// 20060301
date5 := '20060000';	// 20060101
date6 := '1';			// 0

OUTPUT(Consumer_Credit.Utilities.CleanDate(date1), NAMED('Res1_20060203'));
OUTPUT(Consumer_Credit.Utilities.CleanDate(date2), NAMED('Res2_0'));
OUTPUT(Consumer_Credit.Utilities.CleanDate(date3), NAMED('Res3_0'));
OUTPUT(Consumer_Credit.Utilities.CleanDate(date4), NAMED('Res4_20060301'));
OUTPUT(Consumer_Credit.Utilities.CleanDate(date5), NAMED('Res5_20060101'));
OUTPUT(Consumer_Credit.Utilities.CleanDate(date6), NAMED('Res6_0'));