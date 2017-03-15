IMPORT ut,_Control;
EXPORT FILES := MODULE

    EXPORT TrimString (STRING x)  			 		:= TRIM(x, LEFT, RIGHT);
		EXPORT USER_PREFIX                   		:= '';		
		EXPORT SPRAYED_PREFIX_NAME    			 		:= '~THOR::SPRAYED::CLRF' + USER_PREFIX;		
		// EXPORT BASE_PREFIX_NAME       			 		:= '~THOR::BASE::CLRF' + USER_PREFIX; 
		EXPORT BASE_PREFIX_NAME       			 		:= '~foreign::10.194.12.1:7070::THOR::BASE::CLRF' + USER_PREFIX; 
																					
		EXPORT SUFFIX_NAME_DAILY						 		:= 'DAILY';
		EXPORT SUFFIX_NAME_CLAIM						 		:= 'CLAIM';
		EXPORT SUFFIX_NAME_PARTY						 		:= 'PARTY';		
		EXPORT SUFFIX_NAME_NOTES							  := 'NOTES';
		EXPORT SUFFIX_NAME_PAYMENT					 		:= 'PAYMENT';
		EXPORT SUFFIX_NAME_SIUREFERRAL			 		:= 'SIUREFERRAL';
		EXPORT SUFFIX_NAME_SUBROGATION			 		:= 'SUBROGATION';
		EXPORT SUFFIX_NAME_POLICY     					:= 'POLICY';
		EXPORT SUFFIX_NAME_CLAIMINVOLVEDUNIT 		:= 'CLAIMINVOLVEDUNIT';
		
		EXPORT SUFFIX_NAME_RESERVES					 		:= 'RESERVES'; 												//newly added
		EXPORT SUFFIX_NAME_MEDICALBILLS					:= 'MEDICALBILLS';										//newly added
		EXPORT SUFFIX_NAME_PHARMACYBILLS				:= 'PHARMACYBILLS';										//newly added
		EXPORT SUFFIX_NAME_MEDICALPROVIDERS			:= 'MEDICALPROVIDERS';								//newly added
		EXPORT SUFFIX_NAME_PROVIDER							:= 'PROVIDERS';												//newly added
		EXPORT SUFFIX_NAME_PERSON							  := 'PERSON';													//newly added
		EXPORT SUFFIX_NAME_VEHCILES 						:= 'VEHICLES' ;												//newly added
		EXPORT SUFFIX_NAME_POLICYHOLDERS				:= 'POLICYHOLDERS';										//newly added
	
		EXPORT FILE_BASE_CLAIM_SF									 := BASE_PREFIX_NAME + '::QA::' + SUFFIX_NAME_CLAIM;
		EXPORT FILE_BASE_PARTY_SF						 			 := BASE_PREFIX_NAME + '::QA::' + SUFFIX_NAME_PARTY;
		EXPORT FILE_BASE_NOTES_SF						 			 := BASE_PREFIX_NAME + '::QA::' + SUFFIX_NAME_NOTES;
		EXPORT FILE_BASE_PAYMENT_SF				   			 := BASE_PREFIX_NAME + '::QA::' + SUFFIX_NAME_PAYMENT;
		EXPORT FILE_BASE_SIUREFERRAL_SF			 			 := BASE_PREFIX_NAME + '::QA::' + SUFFIX_NAME_SIUREFERRAL;
		EXPORT FILE_BASE_SUBROGATION_SF			 			 := BASE_PREFIX_NAME + '::QA::' + SUFFIX_NAME_SUBROGATION;
		EXPORT FILE_BASE_POLICY_SF				   			 := BASE_PREFIX_NAME + '::QA::' + SUFFIX_NAME_POLICY;
		EXPORT FILE_BASE_CLAIMINVOLVEDUNIT_SF			 := BASE_PREFIX_NAME + '::QA::' + SUFFIX_NAME_CLAIMINVOLVEDUNIT;
		
		EXPORT FILE_BASE_RESERVES_SF						 	 := BASE_PREFIX_NAME + '::QA::' + SUFFIX_NAME_RESERVES;					//newly added
		EXPORT FILE_BASE_MEDICALBILLS_SF					 := BASE_PREFIX_NAME + '::QA::' + SUFFIX_NAME_MEDICALBILLS;			//newly added
		EXPORT FILE_BASE_PHARMACYBILLS_SF					 := BASE_PREFIX_NAME + '::QA::' + SUFFIX_NAME_PHARMACYBILLS;		//newly added
		EXPORT FILE_BASE_MEDICALPROVIDERS_SF			 := BASE_PREFIX_NAME + '::QA::' + SUFFIX_NAME_MEDICALPROVIDERS;	//newly added
		EXPORT FILE_BASE_PROVIDER_SF						 	 := BASE_PREFIX_NAME + '::QA::' + SUFFIX_NAME_PROVIDER;					//newly added
		EXPORT FILE_BASE_PERSON_SF					 			 := BASE_PREFIX_NAME + '::QA::' + SUFFIX_NAME_PERSON;						//newly added
		EXPORT FILE_BASE_VEHICLES_SF							 := BASE_PREFIX_NAME + '::QA::' + SUFFIX_NAME_VEHCILES;					//newly added
		EXPORT FILE_BASE_POLICYHOLDERS_SF			 		 := BASE_PREFIX_NAME + '::QA::' + SUFFIX_NAME_POLICYHOLDERS;		//newly added

		EXPORT DS_BASE_CLAIM								 := DATASET(FILE_BASE_CLAIM_SF, Layouts.CLAIM_Rec_new, thor, opt);																				
		EXPORT DS_BASE_PARTY								 := DATASET(FILE_BASE_PARTY_SF, Layouts.Parties_Rec_new, thor, opt);    					//Need to CHANGE LAYOUT FROM PARTIES_Rec TO Parties_Rec_new
		EXPORT DS_BASE_NOTES								 := DATASET(FILE_BASE_NOTES_SF, Layouts.NOTES_Rec, thor, opt);																				
		EXPORT DS_BASE_PAYMENT							 := DATASET(FILE_BASE_PAYMENT_SF, Layouts.PAYMENTS_Rec_new, thor, opt);																				
		EXPORT DS_BASE_SIUREFERRAL					 := DATASET(FILE_BASE_SIUREFERRAL_SF, Layouts.SIUREFERRAL_Rec, thor, opt);																				
		EXPORT DS_BASE_SUBROGATION					 := DATASET(FILE_BASE_SUBROGATION_SF, Layouts.SUBROGATIONS_Rec, thor, opt);																				
		EXPORT DS_BASE_POLICY					 			 := DATASET(FILE_BASE_POLICY_SF, Layouts.POLICIES_Rec_new, thor, opt);																				
		EXPORT DS_BASE_CLAIMINVOLVEDUNIT		 := DATASET(FILE_BASE_CLAIMINVOLVEDUNIT_SF, Layouts.CLAIMINVOLVEDUNIT_Rec_new, thor, opt);		
		
		EXPORT DS_BASE_RESERVES						 	 := DATASET(FILE_BASE_RESERVES_SF, Layouts.Reserve_Rec_new, thor, opt);											
		EXPORT DS_BASE_MEDICALBILLS					 := DATASET(FILE_BASE_MEDICALBILLS_SF, Layouts.MedicalBills_Rec_new, thor, opt);									
		EXPORT DS_BASE_PHARMACYBILLS				 := DATASET(FILE_BASE_PHARMACYBILLS_SF, Layouts.PharmacyBills_Rec, thor, opt);								
		EXPORT DS_BASE_MEDICALPROVIDERS			 := DATASET(FILE_BASE_MEDICALPROVIDERS_SF, Layouts.MedicalProviders_Rec, thor, opt);						
		// EXPORT DS_BASE_PROVIDER						 	 := DATASET(FILE_BASE_PROVIDER_SF, Layouts.Provider_LNPID_layout, thor, opt);											
		EXPORT DS_BASE_PERSON								 := DATASET(FILE_BASE_PERSON_SF, Layouts.Person_header, thor, opt);									
		EXPORT DS_BASE_VEHICLES							 := DATASET(FILE_BASE_VEHICLES_SF, Layouts.Vehicle_Rec_new, thor, opt);								
		EXPORT DS_BASE_POLICYHOLDERS				 := DATASET(FILE_BASE_POLICYHOLDERS_SF, Layouts.PolicyHolder_Rec_new1, thor, opt);					

		EXPORT FILE_DAILY_SF_IN				       := '~thor::base::clrf::daily::scrub';
		EXPORT FILE_DAILY_SF_BUILT		       := '~THOR::COMPLETED::CLRF::QA::' + SUFFIX_NAME_DAILY;
		EXPORT FILE_DAILY_SPRAY				       := '~thor::base::clrf::daily::scrub';
		// EXPORT DS_DAILY_CCCONTRIB			       := DATASET(FILE_DAILY_SF_IN, ContributionScrubClaimsCompass.Layouts.CDFCContribWithBatch, thor, opt);//commented it only for Dev testing purpose. Please uncomment this before you checkin the code
		// EXPORT FILE_DAILY_DEV_TEST			       := '~thor::base::clrf::DEV::daily::scrub';
		// EXPORT DS_DAILY_CCCONTRIB			       := DATASET(FILE_DAILY_DEV_TEST, ContributionScrubClaimsDatafill.Layouts.CDFCContribWithBatch, thor, opt);
		
		
END;