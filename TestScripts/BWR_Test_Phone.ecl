#workunit('name', 'BWR_Phone_Entity');

IMPORT KELGlobal, Gong, Phoneplus_v2, _Control, Std;

HistoricalDate := (STRING)Std.Date.Today(); // Pick this to run with todays date

OUTPUT(Gong.FileGongCleaned.GongCleaned((UNSIGNED8)DID IN _Control.LexIDFilterSet), NAMED('RawGongFile'));
OUTPUT(Phoneplus_v2.File_Phoneplus_Base((UNSIGNED8)DID IN _Control.LexIDFilterSet), NAMED('RawPhoneplusFile'));
OUTPUT(KELGlobal.Q_Phone_Dump.Res0, NAMED('PhoneDump'));
OUTPUT(KELGlobal.Q_Address_Dump_Limited.Res0, NAMED('AddressDump'));
OUTPUT(KELGlobal.Q_All_Person_Entity_Data(Std.Date.Today()).Res0, NAMED('PersonDump'));
OUTPUT(KELGlobal.Q_Person_Phone_Dump.Res0, NAMED('PersonPhoneDump'));
OUTPUT(KELGlobal.Q_Address_Phone_Dump.Res0, NAMED('AddressPhoneDump'));



/*
In case for future testing

QUERY: PhoneDump <= Phone;
QUERY: PersonPhoneDump <= PersonPhone;
QUERY: AddressPhoneDump <= AddressPhone;
QUERY: AddressDumpLimited <= Address(AddressPhone.PhoneNumber IN [3306347304, 6148714046, 2397311646, 9783324492, 3304972391, 6142610152, 3309286887, 3862185308, 6067804643, 5675254901, 9783374492, 6064623342, 3308540326, 8502106580, 9786633400]);
QUERY: AllPersonEntityData(ArchiveDate) <= Person ASOF reportedby(ArchiveDate);

*/