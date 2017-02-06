IMPORT ut, STD;

EXPORT getJulianDate(STRING8 Date = (STRING8)STD.Date.Today()) := FUNCTION
	
	Julian_Date := ut.DayofYear((INTEGER)Date[1..4],(INTEGER)Date[5..6],(INTEGER)Date[7..8]);
	
	RETURN Date[1..4] + INTFORMAT(Julian_Date,3,1);
	
END;