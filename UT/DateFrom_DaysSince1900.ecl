/**
 * Converts the number days since 1st January 1900 to a date in the Julian calendar.
 **/
IMPORT STD; 
EXPORT DateFrom_DaysSince1900(INTEGER days) := (STRING)Std.Date.FromDaysSince1900(days);