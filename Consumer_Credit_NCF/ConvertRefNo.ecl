EXPORT ConvertRefNo(UNSIGNED2 JulianDate, UNSIGNED4 RemainingRefNo, UNSIGNED1 ReportSource) := FUNCTION
	
	Reference_Number := INTFORMAT(JulianDate + IF(ReportSource = 1,400,00), 5, 1) + INTFORMAT(RemainingRefNo, 9, 1);
	
	RETURN Reference_Number;
END;
