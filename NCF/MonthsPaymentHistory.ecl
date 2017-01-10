EXPORT MonthsPaymentHistory(Input) := FUNCTIONMACRO

   LOADXML('<xml/>');
	 #UNIQUENAME(i) 
	 #SET(i, 1)	 
   #DECLARE(Fieldlist)	 
	 #LOOP
   #IF(%i% < 84)
			 #SET(i, %i% + 1)
		 	 #APPEND(Fieldlist, 'Constants.PaymentProfileConversionTable(Exp_Payment_Profile_Indicator = LEFT.Payment_Grid_V8[' + %i% +'..' + %i% + '])[1].LN_Standardized_Code + ')			 
	 #ELSE
	   #BREAK
	 #END
	 #END
   RETURN %'Fieldlist'%;

ENDMACRO;