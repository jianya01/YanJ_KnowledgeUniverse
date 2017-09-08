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

fileName := '~thor::base::global::health::brazil::201770606::auhtorisationdetails';
EXPORT Authorisation := IF(COUNT(_Control.GeneratedKeyFilterSet) <= 0, 
	DATASET(fileName, LayoutAuthorization, THOR),
	DATASET(fileName, LayoutAuthorization, THOR) (generatedkey IN _Control.GeneratedKeyFilterSet));