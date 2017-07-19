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
  string9 specialitydetails;
  addresslayout address;
 END;

fileName := '~thor::base::global::health::brazil::201770606::provider';
EXPORT ProviderIntermedica := DATASET(fileName, LayoutProvider, THOR);