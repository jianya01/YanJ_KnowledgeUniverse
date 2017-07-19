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
  string10 iligibledate;
  string50 planname;
  string10 eligibledate;
  string50 plannumber;
 END;

fileName := '~thor::base::global::health::brazil::201770606::patient';
EXPORT PatientIntermedica := DATASET(fileName, LayoutPatient, THOR);