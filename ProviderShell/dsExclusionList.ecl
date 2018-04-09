Layout_ExclusionList := RECORD
		STRING ExclusionFacilityName; //LABEL(Exclusion Facility Name),DESCRIPTION(Exclusion Facility Name),OPTIONAL,NULL();
		STRING ExclusionPrimaryRange; //LABEL(Primary Range), DESCRIPTION(Primary Range, street number),OPTIONAL,NULL();
		STRING ExclusionPreDirectional; //LABEL(Pre-Direction), DESCRIPTION(Pre-Directional),OPTIONAL,NULL();
		STRING ExclusionPrimaryName; //LABEL(Primary Name), DESCRIPTION(Primary Name, street name),OPTIONAL,NULL();
		STRING ExclusionPostDirectional; //LABEL(Post-Direction), DESCRIPTION(Post-Directional),OPTIONAL,NULL();
		STRING ExclusionAddressSuffix; //LABEL(Address Suffix), DESCRIPTION(Address Suffix),OPTIONAL,NULL();
		STRING ExclusionSecondaryRange; //LABEL(Secondary Range), DESCRIPTION(Secondary Range, Apt or Suite),OPTIONAL,NULL();
		STRING ExclusionCity ; // LABEL(City), DESCRIPTION(City),OPTIONAL,NULL();
		STRING ExclusionState ; // LABEL(State), DESCRIPTION(Two-letter state abbreviation),OPTIONAL,NULL();
		STRING ExclusionZip5; //LABEL(Zip Code), DESCRIPTION(Zip Code),OPTIONAL,NULL();     
END;

EXPORT dsExclusionList := DATASET([],Layout_ExclusionList);