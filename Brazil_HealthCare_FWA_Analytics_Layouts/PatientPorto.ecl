IMPORT _Control;

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
  string5 insurerirdacode;
  string55 generatedkey;
  string2 claimtype;
  string50 insurerinsuredid;
  string50 industryinsuredid;
  string10 industryinsuredidtype;
  string25 policycertificatenumber;
  string50 employeeid;
  string2 familylinkid;
  string1 patientsameasprimarymemberindicator;
  string1 patientsameasproposerindicator;
  string10 employeedoj;
  string10 employeedoe;
  string128 name;
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

fileName := '~thor::base::global::health::brazil::test::full::version2::20170726::patient';//~thor::base::global::health::brazil::test::full::20170721::patient';
EXPORT PatientPorto := IF(COUNT(_Control.GeneratedKeyFilterSet) <= 0, 
	DATASET(fileName, LayoutPatient, THOR),
	JOIN(DATASET(fileName, LayoutPatient, THOR), _Control.GeneratedKeyFilterSet, LEFT.insurerirdacode = RIGHT.insurerirdacode AND LEFT.generatedkey = RIGHT.generatedkey AND LEFT.claimtype = RIGHT.claimtype, transform(LayoutPatient,self:=left)));