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
 
fileName := '~thor::base::global::health::brazil::test::full::version2::20170726::claimpolicy';//~thor::base::global::health::brazil::test::full::20170721::claimpolicy'; //testdata - thor::base::global::health::brazil::201770606::claimpolicy
EXPORT PolicyPorto :=  IF(COUNT(_Control.GeneratedKeyFilterSet) <= 0, 
	DATASET(fileName, LayoutPolicy, THOR),
	JOIN(DATASET(fileName, LayoutPolicy, THOR), _Control.GeneratedKeyFilterSet, LEFT.insurerirdacode = RIGHT.insurerirdacode AND LEFT.generatedkey = RIGHT.generatedkey AND LEFT.claimtype = RIGHT.claimtype, transform(LayoutPolicy,self:=left)));