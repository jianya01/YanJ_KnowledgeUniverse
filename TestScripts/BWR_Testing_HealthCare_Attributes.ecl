#workunit('name', 'Testing_HealthCare_Attributes');
#option('expandSelectCreateRow', true); // Added to improve overall compile time

IMPORT KELBlackBox, KELGlobal, UT;
Import hygenics_crim;
MaxResults := 250; // The maximum number of records to show in the workunit
 
LexID := 001804121760; //194558261868;//2310229573;  //001533582051;
OffenderKey := 'DIS07242'; //'1B94700871'; //'1B94700871'
// 7A3367861900418869292G34761920130726    these are for lexid      140730426757               
// 7A821378470712453505526125DS20061227                        
// ZZ372153822780158999881256EQ20070703                        
// ZZ372153822780158999881255EQ20090703                        
// ZZ821378470712453505526125DS20061227                        
// 7A821573084270609016626131DS20061227                        
// 7A340849337705747563948466GJ20131230                        
// 7A372153822780158999881255EQ20090703                        
// 7A3408493377057475639G10239320141007                        
// 7A372153822780158999881256EQ20070703                        
// ZZ821378470712453505526131DS20061227                        


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


// FirstDegreeRelativesOutput := KELGlobal.Q_First_Degree_Relatives_And_Associates(LexID).Res0;
// OUTPUT(FirstDegreeRelativesOutput, NAMED('FirstDegreeRelativesOutput'));

SuspectRelativesAssociatesCount := KELGlobal.Q_Suspect_Relatives_Associates_Count(LexID).Res0;
OUTPUT(SuspectRelativesAssociatesCount, NAMED('SuspectRelativesAssociatesCount'));

SuspectRelativesAssociatesSecondThirdDegreeFelonycount := KELGlobal.Q_Suspect_Relatives_Associates_Second_Third_Degree_Felony_Count(LexID).Res0;
OUTPUT(SuspectRelativesAssociatesSecondThirdDegreeFelonycount, NAMED('SuspectRelativesAssociatesSecondThirdDegreeFelonycount'));

PersonByLexID := KELGlobal.Q_Person_By_Lex_I_D(LexID).Res0;
OUTPUT(PersonByLexID, NAMED('PersonByLexID'));