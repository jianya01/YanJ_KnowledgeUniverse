/**
 * Returns a number representing the day of the year indicated by the given date.
 **/
IMPORT STD; 
EXPORT INTEGER2 DayOfYear(INTEGER4 year,INTEGER1 month,INTEGER1 day) := STD.Date.DayOfYear(STD.Date.DateFromParts(YEAR,MONTH,DAY));


