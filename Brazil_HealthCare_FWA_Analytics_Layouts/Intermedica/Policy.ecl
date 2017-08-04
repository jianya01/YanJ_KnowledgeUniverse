IMPORT _Control;

LayoutPolicy := RECORD
  string5 insurerirdacode;
  string55 generatedkey;
  string2 claimtype;
  string35 applicationnumber;
  string35 policynumber;
  string2 policystatus;
  string1 policyclassification;
  string1 grouppolicyclassification;
  string20 plantype;
  string2 irdaproducttype;
  string9 policystartdate;
  string8 policyenddate;
  string8 policycancellationterminationdate;
  string6 coveragetype;
  string4 coveragestatus;
  string15 employergroupnumber;
  string11 primaryinsureddivisionnumber;
 END;
 
fileName := '~thor::base::global::health::brazil::201770606::claimpolicy';
EXPORT Policy := IF(COUNT(_Control.GeneratedKeyFilterSet) <= 0, 
	DATASET(fileName, LayoutPolicy, THOR),
	DATASET(fileName, LayoutPolicy, THOR) (generatedkey IN _Control.GeneratedKeyFilterSet));