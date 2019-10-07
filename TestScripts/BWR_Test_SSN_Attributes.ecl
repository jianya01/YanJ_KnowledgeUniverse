#workunit('name', 'TestSamplecode');
#option('expandSelectCreateRow', true); // Added to improve overall compile time
IMPORT KEL09 AS KEL;
IMPORT CFG_Graph FROM KELGlobal;
IMPORT * FROM KEL09.Null;
IMPORT * FROM KELGlobal;
IMPORT UT;
IMPORT Risk_Indicators,doxie,header_quick,Death_Master;
IMPORT _Control;

 //LexID := 2655191732;
 LexID := 2716430906;
//LexID := 206678352;
  //LexID := 729401412; // Specific Person to Search For
  // LexID := 2674150466;
  
  //SSN := 416560036; // Specific SocialSecurityNumber to Search For 
  SSN := 429110036; // Specific SocialSecurityNumber to Search For 
  //SSN := 577020024; // Specific SocialSecurityNumber to Search For 
  // SSN := 123543344; 
  
  InputAddress := PROJECT(UT.DS_OneRecord, TRANSFORM({STRING Prim_Range, STRING Predir, STRING Prim_Name, STRING Suffix, STRING Postdir, STRING Sec_Range, STRING zip},
	SELF.Prim_Range := '208';
	SELF.Predir := '';
	SELF.Prim_Name := 'JOE BRADY';
	SELF.Suffix := 'DR';
	SELF.Postdir := '';
	SELF.Sec_Range := '';
	SELF.zip := '72342'))[1];
  
  
OUTPUT(KELGlobal.Q_S_S_N_Addresses(SSN).Res0, NAMED('SSNDataAddresses'));//addrsperssn (Addresscount for socialsecuritynumber)

OUTPUT(KELGlobal.Q_Person_Data(LexID).Res0, NAMED('ssncountforlexid')); // ssns_per_adl ssncount for  person
OUTPUT(KELGlobal.Q_Person_S_S_N_S(LexID).Res0, NAMED('PersonSSNSData')); // ssns_per_adl ssncount for  person

//OUTPUT(KELGlobal.Q_Person_S_S_N_S.Res0, NAMED('PersonSSNSData')); // ssns_per_adl ssncount for  person
//OUTPUT(Risk_Indicators.Key_ADL_Risk_Table_v4_Filtered(did = LexID), NAMED('RawData'));
OUTPUT(Risk_Indicators.Key_ADL_Risk_Table_v4_Filtered((UNSIGNED8)DID IN _Control.LexIDFilterSet), NAMED('RawData'));
OUTPUT(doxie.Key_FCRA_legacy_ssn((unsigned6)DID IN _Control.LexIDFilterSet), NAMED('Rawrecords'));
OUTPUT(header_quick.Key_Did_FCRA((unsigned6)DID IN _Control.LexIDFilterSet), NAMED('headerquickRawrecords'));


  AddressEntityResults := KELGlobal.Q_Address_S_S_N_S(InputAddress.Prim_Range, InputAddress.Predir, InputAddress.Prim_Name, InputAddress.Suffix, InputAddress.Postdir, InputAddress.Sec_Range, (INTEGER)InputAddress.zip).Res0;
  OUTPUT(AddressEntityResults, NAMED('NumberofSSNS'));// ssnsperaddrs  ssncount for address


 //OUTPUT(KELGlobal.Q_Address_S_S_N_S.Res0, NAMED('NumberofSSNS')); // ssnsperaddrs
 // OUTPUT(KELGlobal.Q_Address_Data('425 ','E', 'LIVE OAK  ',' AVE  ',' ', 91006, '108' ).Res0, NAMED('NumberofSSNS')); // ssnsperaddrs

//QUERY: PersonByLexID(SearchForLexID) <= Person(UID=SearchForLexID);
OUTPUT(KELGlobal.Q_Person_By_Lex_I_D(LexID).Res0, NAMED('Personrecords')); //ssncount per lexid
OUTPUT(Death_Master.Key_ssn_ssa((unsigned6)DID IN _Control.LexIDFilterSet), NAMED('ssnssaRawrecords'));
OUTPUT(dx_Header.key_header(data_services.data_env.iFCRA)((unsigned6)DID IN _Control.LexIDFilterSet), NAMED('HeaderRawrecords'));

OUTPUT(KELGlobal.Q_S_S_N_Count_Test(LexID).Res0, NAMED('SSNCounttestrecs'));

OUTPUT(KELGlobal.Q_S_S_N_Count_Testing(LexID).Res0, NAMED('SSNCounttesting'));

OUTPUT(KELGlobal.Q_Per_S_S_N_Ass(LexID).Res0, NAMED('SSNCounttest'));
OUTPUT(KELGlobal.Q_Person_S_S_N_Test_Data(LexID).Res0, NAMED('SSNCounttestdata'));

