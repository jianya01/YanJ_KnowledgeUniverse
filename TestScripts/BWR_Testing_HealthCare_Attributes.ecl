#workunit('name', 'Testing_HealthCare_Attributes');
#option('expandSelectCreateRow', true); // Added to improve overall compile time

IMPORT KELBlackBox, KELGlobal, UT;
Import hygenics_crim;
MaxResults := 250; // The maximum number of records to show in the workunit
 
LexID := 001533582051;
OffenderKey := 'PB11100056135066658220CR201009147220100908'; 
//CreditReport := DATASET([{'8778015R13971833', 1514226899}], {STRING TransactionID, UNSIGNED6 LexID}); // Bankruptcies/Collections
//CreditReport := DATASET([{'0F19ADA9C0X3382', 1514226899}], {STRING TransactionID, UNSIGNED6 LexID}); // Bankruptcies/Collections/Tradeline/Inquiries

//HistoryDate := (INTEGER)UT.GetDate; // Run with Today's Date

//CreditReportSummary := KELGlobal.Q_Credit_Report_Attributes(CreditReport[1].TransactionID).Res0;
//OUTPUT(CreditReportSummary, NAMED('Credit_Report'));

HealthCareCriminalOffenses := KELGlobal.Q_Criminal_Offenses(OffenderKey).Res0;
OUTPUT(HealthCareCriminalOffenses, NAMED('CriminalOffenses'));

//HCPersons := KELGlobal.Q_Person_By_Lex_I_D(LexID).Res0;
//OUTPUT(HCPersons, NAMED('PersonsQ'));

HealthCarePersonOffenses := KELGlobal.Q_Persons_Offenses(LexID).Res0;
OUTPUT(HealthCarePersonOffenses, NAMED('PersonOffenses'));

SuspectSecondThirdDegreeFelonyCounts := KELGlobal.Q_Person_Second_Third_Degree_Felony_Count_By_Lex_I_D(LexID).Res0;
OUTPUT(SuspectSecondThirdDegreeFelonyCounts, NAMED('SecondThirdDegreeFelonyCount'));

SuspectLastConvictedDate := KELGlobal.Q_Person_Last_Convicted_Date(LexID).Res0;
OUTPUT(SuspectLastConvictedDate, NAMED('SuspectLastConvictedDate'));

OUTPUT(hygenics_crim.File_Moxie_Court_Offenses_Dev(Offender_key=OffenderKey), NAMED('RawOffensesData'));
OUTPUT(hygenics_crim.File_Moxie_Crim_Offender2_Dev(Offender_key=OffenderKey), NAMED('RawSpecificOffendersData'));
OUTPUT(hygenics_crim.File_Moxie_Court_Offenses_Dev(court_off_lev in ['F2', 'F3']), NAMED('RawFelonyOffensesData'));

OffenderResults := hygenics_crim.File_Moxie_Crim_Offender2_Dev((UNSIGNED)did=(UNSIGNED)LexID);
OUTPUT(OffenderResults, NAMED('OffenderResults'));
OUTPUT(TABLE(OffenderResults,{Offender_key,did,UNSIGNED8 recordcount:=COUNT(GROUP)},Offender_key,did), NAMED('RawOffendersData'));