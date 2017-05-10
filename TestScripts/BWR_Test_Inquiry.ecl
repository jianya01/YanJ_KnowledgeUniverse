#workunit('name', 'BWR_Inquiry_Entity');

IMPORT KELGlobal, Inquiry_AccLogs, _Control;

OUTPUT(Inquiry_AccLogs.File_FCRA_Inquiry_BaseSource(search_info.transaction_id IN _Control.TransactionIDFilterSet), NAMED('RawInquiryFile'));
OUTPUT(KELGlobal.Q_Inquiry_Dump.Res0, NAMED('InquiryDump'));
// OUTPUT(KELGlobal.Q_Limited_Person_Dump.Res0, NAMED('LimitedPersonDump'));
// OUTPUT(KELGlobal.Q_Limited_Address_Dump.Res0, NAMED('LimitedAddressDump'));
// OUTPUT(KELGlobal.Q_Limited_Phone_Dump.Res0, NAMED('LimitedPhoneDump'));
// OUTPUT(KELGlobal.Q_Limited_Drivers_License_Dump.Res0, NAMED('LimitedDriversLicenseDump'));
// OUTPUT(KELGlobal.Q_Limited_Social_Security_Number_Dump.Res0, NAMED('LimitedSocialSecurityNumberDump'));
// OUTPUT(KELGlobal.Q_Person_Inquiry_Dump.Res0, NAMED('PersonInquiryDump'));
// OUTPUT(KELGlobal.Q_Address_Inquiry_Dump.Res0, NAMED('AddressInquiryDump'));
// OUTPUT(KELGlobal.Q_S_S_N_Inquiry_Dump.Res0, NAMED('SSNInquiryDump'));
// OUTPUT(KELGlobal.Q_Phone_Inquiry_Dump.Res0, NAMED('PhoneInquiryDump'));
// OUTPUT(KELGlobal.Q_Drivers_License_Inquiry_Dump.Res0, NAMED('DriversLicenseInquiryDump'));




/*
QUERY: InquiryDump <= Inquiry;
QUERY: LimitedPersonDump <= Person(PersonInquiry.Inquiry.TransactionID IN ['61619680', '478826333B278608', '61707460']);
QUERY: LimitedAddressDump <= Address(AddressInquiry.Inquiry.TransactionID IN ['61619680', '478826333B278608', '61707460']);
QUERY: LimitedPhoneDump <= Phone(PhoneInquiry.Inquiry.TransactionID IN ['61619680', '478826333B278608', '61707460']);
QUERY: LimitedDriversLicenseDump <= DriversLicense(DriversLicenseInquiry.Inquiry.TransactionID IN ['61619680', '478826333B278608', '61707460']);
QUERY: LimitedSocialSecurityNumberDump <= SocialSecurityNumber(SSNInquiry.Inquiry.TransactionID IN ['61619680', '478826333B278608', '61707460']);
QUERY: PersonInquiryDump <= PersonInquiry(Inquiry.TransactionID IN ['61619680', '478826333B278608', '61707460']);
QUERY: AddressInquiryDump <= AddressInquiry(Inquiry.TransactionID IN ['61619680', '478826333B278608', '61707460']);
QUERY: SSNInquiryDump <= SSNInquiry(Inquiry.TransactionID IN ['61619680', '478826333B278608', '61707460']);
QUERY: PhoneInquiryDump <= PhoneInquiry(Inquiry.TransactionID IN ['61619680', '478826333B278608', '61707460']);
QUERY: DriversLicenseInquiryDump <= DriversLicenseInquiry(Inquiry.TransactionID IN ['61619680', '478826333B278608', '61707460']);

*/