IMPORT SALTRoutines;
IMPORT DriversLicense_Data;


dl_did := DriversLicense_Data.dl_did;
dl_number := DriversLicense_Data.dl_number;
insuranceheadder_did := DriversLicense_Data.insuranceheader_did;
insuranceheader_dln := DriversLicense_Data.insuranceheader_dln;

//W20180627-092815
// OUTPUT(SALTRoutines.SALT_Profile_Run_Everything(dl_did, 'DL_DID'),NAMED('DL_Did_SALT_profile'));

//W20180627-140517
// OUTPUT(SALTRoutines.SALT_Profile_Run_Everything(dl_number, 'DL_NUMBER'),NAMED('DL_Number_SALT_Profile'));

//W20180627-164400
// OUTPUT(SALTRoutines.SALT_Profile_Run_Everything(insuranceheadder_did, 'IH_DID'),NAMED('IH_Did_SALT_profile'));

//W20180629-152301
// OUTPUT(SALTRoutines.SALT_Profile_Run_Everything(insuranceheader_dln, 'IH_DLN'),NAMED('IH_Dln_SALT_profile'));