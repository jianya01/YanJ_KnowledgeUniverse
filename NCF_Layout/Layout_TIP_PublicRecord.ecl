EXPORT Layout_TIP_PublicRecord := RECORD
		STRING8 Credit_Report_Date;
		STRING10 Record_Number;
		STRING17 Encrypted_PIN;
		STRING1 Record_Type;
		STRING3 Enhanced_Legal_Status;
		STRING8 Legal_Status_Date;
		STRING8 Asset_Amount;
		STRING8 Liabilities_Amount;
		STRING8 Original_Filing_Date;
		STRING8 Public_Record_Amount;
		STRING1 Public_Record_ECOA;
		STRING2 Public_Record_SCC;
END;