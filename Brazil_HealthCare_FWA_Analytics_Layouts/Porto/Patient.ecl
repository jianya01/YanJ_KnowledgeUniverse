IMPORT _Control;

namelayout := RECORD
   string35 firstname;
   string35 middlename;
   string35 lastname;
  END;

addresslayout := RECORD
   string20 countryname;
   string20 statename;
   string25 cityname;
   string25 homecitycode;
   string128 address;
   string128 addresscomplementary;
   string5 homenumber;
   string10 zipcode;
  END;

identityproofdetailslayout := RECORD
   string3 documenttype;
   string25 documentid;
   string128 description;
  END;

telephonelayout := RECORD
   string3 countrycode;
   string3 statecode;
   string15 phonenumber;
   string20 phonetype;
  END;

LayoutPatient := RECORD
  string5 insureruniqueid;
  string200 generatedkey;
  string2 claimtype;
  string5 customernumber;
  string9 batch_no;
  unsigned8 loaddatetime;
  unsigned8 rec_seq_no;
  string50 insurerinsuredid;
  string50 industryinsuredid;
  string10 industryinsuredidtype;
  string25 policycertificatenumber;
  string12 patientnumber;
  string50 medicalrecnumber;
  string patientacctnumber;
  string1 patientstatus;
  string50 employeeid;
  string2 familylinkid;
  string1 patientsameasprimarymemberindicator;
  string1 patientsameasproposerindicator;
  string10 employeedoj;
  string10 employeedoe;
  namelayout name;
  string10 dateofbirth;
  string10 dateofdeath;
  string1 gender;
  addresslayout address;
  identityproofdetailslayout identityproofdetails;
  telephonelayout telephones;
  string100 email;
  string2 relationshipcode;
  string500 medicalhistory;
  string2 authorizationcode;
  string50 primaryinsuredmemberkey;
  string25 tpainsuredid;
  string50 planname;
  string10 eligibledate;
  string50 plannumber;
 END;

fileName := '~thor::base::health::brazil::test::full::version::20170914::patient';//~thor::base::global::health::brazil::test::full::20170721::patient';
EXPORT Patient := IF(COUNT(_Control.GeneratedKeyFilterSet) <= 0, 
	DATASET(fileName, LayoutPatient, THOR),
	JOIN(DISTRIBUTE(DATASET(fileName, LayoutPatient, THOR), HASH64(generatedkey)), DISTRIBUTE(_Control.GeneratedKeyFilterSet(generatedkey != ''), HASH64(generatedkey)), LEFT.generatedkey = RIGHT.generatedkey, TRANSFORM(LEFT), LOCAL));