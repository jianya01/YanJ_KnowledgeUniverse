IMPORT _Control;

LayoutAuthorization := RECORD
  string5 insurerirdacode;
  string55 generatedkey;
  string2 claimtype;
  string2 requeststatus;
  string300 requeststatusdescription;
  string8 requestreceiveddate;
  string8 authorizationdate;
  integer3 expectedstaylength;
  string1 requestrejectionindicator;
  string300 requestrejectionreason;
 END;

fileName := '~thor::base::global::health::brazil::test::full::version2::20170726::auhtorisationdetails';//~thor::base::global::health::brazil::test::full::20170721::auhtorisationdetails';
EXPORT AuthorisationPorto := IF(COUNT(_Control.GeneratedKeyFilterSet) <= 0, 
	DATASET(fileName, LayoutAuthorization, THOR),
	JOIN(DATASET(fileName, LayoutAuthorization, THOR), _Control.GeneratedKeyFilterSet, LEFT.insurerirdacode = RIGHT.insurerirdacode AND LEFT.generatedkey = RIGHT.generatedkey AND LEFT.claimtype = RIGHT.claimtype, transform(LayoutAuthorization,self:=left)));