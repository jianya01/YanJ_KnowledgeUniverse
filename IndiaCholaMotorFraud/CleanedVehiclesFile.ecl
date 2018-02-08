IMPORT STD, IndiaCholaMotorFraud;


STRING8 ParseDateFields(STRING4 Year, STRING2 Month, STRING2 Day) := INTFORMAT((INTEGER)Year, 4, 1) + INTFORMAT((INTEGER)Month, 2, 1) + INTFORMAT((INTEGER)Day, 2, 1);

EXPORT CleanedVehiclesFile := PROJECT(IndiaCholaMotorFraud.VehicleFile, TRANSFORM({RECORDOF(LEFT), STRING8 RegistrationDate},
       SELF.RegistrationDate := ParseDateFields(LEFT.year_of_registration, 
																					 MAP((LEFT.month_of_registration = 'JAN') => '01',
																							 (LEFT.month_of_registration = 'FEB') => '02',
																							 (LEFT.month_of_registration = 'MAR') => '03',
																							 (LEFT.month_of_registration = 'APR') => '04',
																							 (LEFT.month_of_registration = 'MAY') => '05',
																							 (LEFT.month_of_registration = 'JUN') => '06',
																							 (LEFT.month_of_registration = 'JUL') => '07',
																							 (LEFT.month_of_registration = 'AUG') => '08',
																							 (LEFT.month_of_registration = 'SEP') => '09',
																							 (LEFT.month_of_registration = 'OCT') => '10',
																							 (LEFT.month_of_registration = 'NOV') => '11',
																							 (LEFT.month_of_registration = 'DEC') => '12',
																							 '00'),
																							LEFT.day_of_registration);
       SELF := LEFT));
