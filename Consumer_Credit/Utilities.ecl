IMPORT STD;
IMPORT KEL07 AS KEL;

EXPORT Utilities := MODULE
	EXPORT CleanDate(STRING Date) := FUNCTION
		YYYY := Date[1..4];
		MM := DATE[5..6];
		DD := DATE[7..8];

		RETURN(MAP(KEL.Routines.IsValidDate((UNSIGNED4)(YYYY + MM + DD))										=> YYYY + MM + DD, // Full date is valid
				KEL.Routines.IsValidDate((UNSIGNED4)(YYYY + MM + '01')) AND (INTEGER)DD = 0						=> YYYY + MM + '01', // YYYYMM valid and DD is 00
				KEL.Routines.IsValidDate((UNSIGNED4)(YYYY + '0101')) AND (INTEGER)MM = 0 AND (INTEGER)DD = 0	=> YYYY + '0101', // YYYY valid and MMDD is 0000
						   																							'0')); // Invalid date, set to 0
	END;
END;