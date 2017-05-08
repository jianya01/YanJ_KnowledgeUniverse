// Code taken from TX_Drivers.Fn
// import lib_date;
import STD;

export string8 julToYYYYMMDD(string7 julian_date):= FUNCTION
year:=julian_date[1..4];
integer3 day:=(integer3)julian_date[5..7];
// boolean is_LeapYear := lib_date.LeapYear((integer)year);
boolean is_LeapYear := STD.Date.IsLeapYear((integer)year);
integer2 febdays:=IF(is_LeapYear,60,59);

set of integer2 leap_year_set := [0,31,60,91,121,152,182,213,244,274,305,335];
set of integer2 non_leap_year_set := [0,31,59,90,120,151,181,212,243,273,304,334];

year_set := if (is_LeapYear,leap_year_set,non_leap_year_set);

integer month:= map (day > year_set [12] => 12, 
											day > year_set [11] => 11,
											day > year_set [10] => 10,
											day > year_set [9] => 9,
											day > year_set [8] => 8,
											day > year_set [7] => 7,
											day > year_set [6] => 6,
											day > year_set [5] => 5,
											day > year_set [4] => 4,
											day > year_set [3] => 3,
											day > year_set [2] => 2,
											day > year_set [1] => 1,
											-1);


integer days:= (integer)day -	year_set[month]; 

									
return if(month < 0,'**ERROR',year+INTFORMAT(month,2,1)+INTFORMAT(days,2,1));
END;  