/**
 * Returns the number of days since 1st January 1900 (using the Gregorian Calendar)
 **/
IMPORT STD; 
EXPORT DaysSince1900(STRING4 year, STRING2 month, STRING2 day) := Std.Date.DaysSince1900((INTEGER) year,(INTEGER)month,(INTEGER)day); 
  