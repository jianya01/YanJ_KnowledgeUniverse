#workunit('name', 'BWR_Bankruptcy_Test_Script');
#option('expandSelectCreateRow', true); // Added to improve overall compile time

IMPORT KELGlobal,BankruptcyV3;

MainKey := BankruptcyV3.key_BankruptcyV3_main_full;
SearchKey := BankruptcyV3.Key_BankruptcyV3_Search_Full;

InputTmsID := 'BKAK0011500053'; 
LexID := 1783676644;

// Search the raw Bankruptcy Main file for a specific TMSID and output those records
RawBankruptcyMainData := MainKey (tmsid = InputTmsID);
OUTPUT(RawBankruptcyMainData, NAMED('Raw_Bankruptcy_Main_Records_For_Single_TMSID'));

// Search the raw Bankruptcy Search file for a specific TMSID and output those records
RawBankruptcySearchData := SearchKey (tmsid = InputTmsID);
OUTPUT(RawBankruptcySearchData, NAMED('Raw_Bankruptcy_Search_Records_For_Single_TMSID'));

// Output the KEL Bankruptcy ENTITY results for a specific TMSID
BankruptcyEntity := KELGlobal.Q_Bankruptcy(InputTmsID).Res0;
OUTPUT(BankruptcyEntity, NAMED('Bankruptcy_Entity_Records_For_Single_TMSID'));


// Search the raw Bankrutpcy Main file for a specific LexID - this will output all of the TMSID's associated with the LexID
RawBankruptcyMainPerson := MainKey ((UNSIGNED)did = LexID);
OUTPUT(COUNT(RawBankruptcyMainPerson), NAMED('Raw_Person_Bankruptcy_Main_Record_Count'));
OUTPUT(RawBankruptcyMainPerson, NAMED('Raw_Person_Bankruptcy_Main_Records'));

// Search the raw Bankrutpcy Search file for a specific LexID - this will output all of the TMSID's associated with the LexID
RawBankruptcySearchPerson := SearchKey ((UNSIGNED)did = LexID);
OUTPUT(COUNT(RawBankruptcySearchPerson), NAMED('Raw_Person_Bankruptcy_Search_Record_Count'));
OUTPUT(RawBankruptcySearchPerson, NAMED('Raw_Person_Bankruptcy_Search_Records'));

// Search the raw Bankrutpcy Search file for a specific LexID - this will output all of the TMSID's associated with the LexID
RawBankruptcySearchPersonNameTypeD := RawBankruptcySearchPerson (name_type = 'D');
OUTPUT(COUNT(RawBankruptcySearchPersonNameTypeD), NAMED('Raw_Person_Bankruptcy_Search_NameTypeD_Record_Count'));
OUTPUT(RawBankruptcySearchPersonNameTypeD, NAMED('Raw_Person_Bankruptcy_Search_NameTypeD_Records'));

// Find out which bankruptcies in the Main file have associated TMSID records in the Search file, where the Search file records have name_type = 'D'
RawBankruptcyMainPersonRecordsWhereSearchNameTypeD := JOIN(DISTRIBUTE(RawBankruptcyMainPerson, HASH64(TMSID)), DISTRIBUTE(RawBankruptcySearchPerson, HASH64(TMSID)),
				LEFT.TMSID = RIGHT.TMSID AND RIGHT.Name_Type = 'D', TRANSFORM(LEFT));
OUTPUT(COUNT(RawBankruptcyMainPersonRecordsWhereSearchNameTypeD), NAMED('Raw_Bk_Main_Person_Records_Where_Search_NameTypeD_Count'));
OUTPUT(RawBankruptcyMainPersonRecordsWhereSearchNameTypeD, NAMED('Raw_Bk_Main_Person_Records_Where_Search_NameTypeD'));

// Output the KEL Person ENTITY results for a specific LexID
PersonEntity := KELGlobal.Q_Person_Dump(LexID).Res0;
OUTPUT(PersonEntity, NAMED('Person_Entity_Records')); 


// Attempt to find viable bankruptcy test cases
// First find the MainKey records which have a corresponding SearchKey TMSID where the name_type = 'D'
MainKeyRecordNameTypeD := JOIN(DISTRIBUTE(MainKey, HASH64(TMSID)), DISTRIBUTE(SearchKey, HASH64(TMSID)),
				LEFT.TMSID = RIGHT.TMSID AND RIGHT.Name_Type = 'D', TRANSFORM(LEFT));

// Next do a TABLE on the MainKey results from above to find out which LexID's have a bunch of Bankruptcy Records where NameType = 'D'.  These LexID's are potential test cases for us.
PersonTestCases := TABLE(DISTRIBUTE(MainKeyRecordNameTypeD, HASH64(DID)), // I want to create a new table from the MainKeyRecordNameTypeD 	{UNSIGNED8 LexID := DID, // One column in the new table will be LexID
 		{UNSIGNED8 LexID := DID, // One column in the new table will be LexID
	UNSIGNED8 BankruptcyRecordCount := COUNT(GROUP)}, // The second column in the new table will be a count of how many records each LexID has
 DID); // Lastly, I want to "group" this new table by LexID (This is how the COUNT(GROUP) from the line above knows what to count

PersonTestCasesSorted := SORT(PersonTestCases, -BankruptcyRecordCount); // Sort the records with the highest BankruptcyRecordCount (So the largest numbers of bankruptcy records) to the top, this will help us to find test cases with a lot of bankruptcy records, but hopefully not hundreds of thousands of records
OUTPUT(PersonTestCasesSorted, NAMED('PersonTestCasesSorted')); // Output the LexID's + BankruptcyRecordCounts that have now been sorted 
OUTPUT(PersonTestCasesSorted (BankruptcyRecordCount < 50), NAMED('Bankruptcy_Test_Cases_Less_Than_50'));
OUTPUT(PersonTestCasesSorted (BankruptcyRecordCount < 5), NAMED('Bankruptcy_Test_Cases_Less_Than_5'));
OUTPUT(PersonTestCasesSorted (BankruptcyRecordCount < 5), NAMED('Bankruptcy_Test_Cases_Less_Than_3'));


