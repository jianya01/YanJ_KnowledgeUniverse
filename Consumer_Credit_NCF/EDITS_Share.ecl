export EDITS_Share := MODULE
			
export t_InsuranceXmlInFoBase := record
	string2 FLVersion {xpath('FLVersion')};
end;
		
export t_InsuranceBatch := record
	string SeqNumber {xpath('SeqNumber')};
	string Id {xpath('Id')};
	string MPOResults {xpath('MPOResults')};
end;
		
export t_EDITSDate := record
	string2 Month {xpath('Month')};
	string2 Day {xpath('Day')};
	string4 Year {xpath('Year')};
end;
		
export t_EDITSDateDDMMYY := record
	string2 Month {xpath('Month')};
	string2 Day {xpath('Day')};
	string2 Year {xpath('Year')};
end;
		

end;