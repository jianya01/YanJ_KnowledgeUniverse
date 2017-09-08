IMPORT _Control;

LayoutPolicy := RECORD
  string5 insureruniqueid;
  string200 generatedkey;
  string2 claimtype;
  string5 customernumber;
  string9 batch_no;
  unsigned8 loaddatetime;
  unsigned8 rec_seq_no;
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
  string8 insuredeffectiveeligibilitydate;
  string8 insuredexpirationeligibilitydate;
  string8 insuredeligibilitystatus;
  string8 primaryinsuredsubscriberidentificationnumber;
  string35 primaryinsuredsubscriberpolicynumber;
  string primaryinsuredsubscriberempgrpnumber;
 END;
 
fileName := '~thor::base::health::brazil::test::full::version::20170807::claimpolicy';//~thor::base::global::health::brazil::test::full::20170721::claimpolicy'; //testdata - thor::base::global::health::brazil::201770606::claimpolicy
EXPORT Policy := IF(COUNT(_Control.GeneratedKeyFilterSet) <= 0, 
	DATASET(fileName, LayoutPolicy, THOR),
	JOIN(DISTRIBUTE(DATASET(fileName, LayoutPolicy, THOR), HASH64(generatedkey)), DISTRIBUTE(_Control.GeneratedKeyFilterSet(generatedkey != ''), HASH64(generatedkey)), LEFT.generatedkey = RIGHT.generatedkey, TRANSFORM(LEFT), LOCAL));