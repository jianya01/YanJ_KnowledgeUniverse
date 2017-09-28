IMPORT _Control;
specialitydetail_rec := RECORD
   string10 specialitycode;
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

namelayout := RECORD
   string35 firstname;
   string35 middlename;
   string35 lastname;
  END;

LayoutProvider := RECORD
  string5 insureruniqueid;
  string200 generatedkey;
  string2 claimtype;
  string5 customernumber;
  string9 batch_no;
  unsigned8 loaddatetime;
  unsigned8 rec_seq_no;
  string50 providerkey;
  string50 insurerprovidernumber;
  string50 insurerprovidernumbersuffix;
  string50 insurerprovidernumberqualifier;
  string50 industryprovidernumber;
  string10 industryprovideridtype;
  string20 providertype;
  string10 providertaxid;
  string10 providertaxidsuffix;
  string50 networkcode;
  string128 providername;
  string1 recentbirthindicator;
  string1 regimeofhospitalisation;
  string14 providercpforcnpj;
  string2 authorizationcode;
  string12 drugenforcementadministrationnumberdea;
  string10 taxonomy;
  string12 providerfacilitynumber;
  string1 watchcode;
  DATASET(specialitydetail_rec) specialitydetails;
  addresslayout address;
  namelayout providerindividualname;
 END;

fileName := '~thor::base::health::brazil::test::full::version::20170914::provider';//~thor::base::global::health::brazil::test::full::20170721::provider'; //testdata - thor::base::global::health::brazil::201770606::provider
EXPORT Provider := IF(COUNT(_Control.GeneratedKeyFilterSet) <= 0, 
	DATASET(fileName, LayoutProvider, THOR),
	JOIN(DISTRIBUTE(DATASET(fileName, LayoutProvider, THOR), HASH64(generatedkey)), DISTRIBUTE(_Control.GeneratedKeyFilterSet(generatedkey != ''), HASH64(generatedkey)), LEFT.generatedkey = RIGHT.generatedkey, TRANSFORM(LEFT), LOCAL));