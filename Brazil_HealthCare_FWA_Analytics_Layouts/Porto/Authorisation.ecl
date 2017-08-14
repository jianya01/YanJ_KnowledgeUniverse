IMPORT _Control;
requestrejectioncode_rec := RECORD
   string requestrejectioncode;
  END;

LayoutAuthorization := RECORD
  string5 insureruniqueid;
  string200 generatedkey;
  string2 claimtype;
  string5 customernumber;
  string9 batch_no;
  unsigned8 loaddatetime;
  unsigned8 rec_seq_no;
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


fileName := '~thor::base::health::brazil::test::full::version::20170807::authorisationdetails';//~thor::base::global::health::brazil::test::full::20170721::auhtorisationdetails';
EXPORT Authorisation := IF(COUNT(_Control.GeneratedKeyFilterSet) <= 0, 
	DATASET(fileName, LayoutAuthorization, THOR),
	JOIN(DISTRIBUTE(DATASET(fileName, LayoutAuthorization, THOR), HASH64(generatedkey)), DISTRIBUTE(_Control.GeneratedKeyFilterSet(generatedkey != ''), HASH64(generatedkey)), LEFT.generatedkey = RIGHT.generatedkey, TRANSFORM(LEFT), LOCAL));