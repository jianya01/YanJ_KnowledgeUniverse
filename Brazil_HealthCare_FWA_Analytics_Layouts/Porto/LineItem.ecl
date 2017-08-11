IMPORT _Control;

LayoutLine := RECORD
  string5 insureruniqueid;
  string200 generatedkey;
  string2 claimtype;
  string5 customernumber;
  string9 batch_no;
  unsigned8 loaddatetime;
  unsigned8 rec_seq_no;
  string97 transactionid;
  string datasource;
  integer2 expensetype;
  string300 otherexpensetypedescription;
  string10 hospitalisationexpensesdetails;
  string10 linetype;
  string10 linecode;
  string300 linedescription;
  decimal8_2 claimedamount;
  decimal8_2 approvedamount;
  decimal8_2 rejectedreducedamount;
  string10 rejectedreducedreason;
  integer3 daysbilled;
  string2 dischargereason;
  decimal8_2 totalprocedures;
  decimal8_2 totalbedcost;
  decimal8_2 totalrentals;
  decimal8_2 totalmaterials;
  decimal8_2 totalconsidered;
  decimal8_2 totaltosuppliers;
  decimal8_2 totalchargedvsproprietarycodes;
  decimal8_2 quantitycharged;
  string50 checknumber;
  string8 checkpaiddate;
  string10 paymenttype;
  string4 reimbursementmethodtype;
  string4 reimbursementmethodversion;
  string10 reimbursementcode;
  string10 secondaryreimbursementcode;
  string18 drgpricing;
  integer2 outliercode;
  string10 revenuecode;
  string50 payeecode;
  string1 providermedicareparticipation;
  string1 maxoutofpocketmetindividualind;
  string1 maxoutofpocketmetfamilyind;
  string1 deductiblemetindividualind;
  string1 deductiblemetfamilyind;
  string1 priceindicator;
  decimal12_2 chargeamount;
  decimal12_2 reasonableandcustomaryamount;
  string1 networkindicator;
 END;

fileName := '~thor::base::health::brazil::test::full::version::20170807::lineitem';//~thor::base::global::health::brazil::test::full::20170721::lineitem'; //testdata - thor::base::global::health::brazil::201770606::lineitem
EXPORT LineItem := IF(COUNT(_Control.GeneratedKeyFilterSet) <= 0, 
	DATASET(fileName, LayoutLine, THOR),
	JOIN(DISTRIBUTE(DATASET(fileName, LayoutLine, THOR), HASH64(generatedkey)), DISTRIBUTE(_Control.GeneratedKeyFilterSet(generatedkey != ''), HASH64(generatedkey)), LEFT.generatedkey = RIGHT.generatedkey, TRANSFORM(LEFT), LOCAL));