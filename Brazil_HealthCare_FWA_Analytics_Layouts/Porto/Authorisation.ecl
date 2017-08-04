IMPORT _Control;
requestrejectioncode_rec := RECORD
   string requestrejectioncode;
  END;

LayoutAuthorization := RECORD
  string5 insurerirdacode;
  string55 generatedkey;
  string2 claimtype;
  string2 requeststatus;
  string1 requestimpact;
  string300 requeststatusdescription;
  string8 requestreceiveddate;
  string8 authorizationdate;
  string2 authorizationcode;
  integer3 expectedstaylength;
  string1 requestrejectionindicator;
  DATASET(requestrejectioncode_rec) requestrejectioncode;
  string300 requestrejectionreason;
 END;

fileName := '~thor::base::health::brazil::test::full::version::20170802::authorisationdetails';//~thor::base::global::health::brazil::test::full::20170721::auhtorisationdetails';
EXPORT Authorisation := IF(COUNT(_Control.GeneratedKeyFilterSet) <= 0, 
	DATASET(fileName, LayoutAuthorization, THOR),
	DATASET(fileName, LayoutAuthorization, THOR) (generatedkey IN _Control.GeneratedKeyFilterSet));
// EXPORT AuthorisationPorto := IF(COUNT(_Control.GeneratedKeyFilterSet) <= 0, 
	// DATASET(fileName, LayoutAuthorization, THOR),
	// DATASET(fileName, LayoutAuthorization, THOR), _Control.GeneratedKeyFilterSet, LEFT.insurerirdacode = RIGHT.insurerirdacode AND LEFT.generatedkey = RIGHT.generatedkey AND LEFT.claimtype = RIGHT.claimtype, transform(LayoutAuthorization,self:=left)));