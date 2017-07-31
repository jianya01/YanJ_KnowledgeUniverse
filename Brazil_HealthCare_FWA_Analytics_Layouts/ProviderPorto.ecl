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

LayoutProvider := RECORD
  string5 insurerirdacode;
  string55 generatedkey;
  string2 claimtype;
  string50 insurerprovidernumber;
  string50 industryprovidernumber;
  string10 industryprovideridtype;
  string20 providertype;
  string10 providertaxid;
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
 END;


fileName := '~analyt_thor400_90_dev::thor::base::global::health::brazil::test::full::version2::20170726::provider';//~thor::base::global::health::brazil::test::full::20170721::provider'; //testdata - thor::base::global::health::brazil::201770606::provider
EXPORT ProviderPorto := IF(COUNT(_Control.GeneratedKeyFilterSet) <= 0, 
	DATASET(fileName, LayoutProvider, THOR),
	JOIN(DATASET(fileName, LayoutProvider, THOR), _Control.GeneratedKeyFilterSet, LEFT.insurerirdacode = RIGHT.insurerirdacode AND LEFT.generatedkey = RIGHT.generatedkey AND LEFT.claimtype = RIGHT.claimtype, transform(LayoutProvider,self:=left)));
	
