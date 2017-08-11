IMPORT _Control;
insurer_rec := RECORD
   string25 insureruniqueid;
   string128 insurername;
  END;

tpa_rec := RECORD
   string25 tpacode;
   string128 tpaname;
  END;

claimreopendetails_rec := RECORD
   string10 reopendate;
   string128 reopenremarks;
  END;

LayoutClaim := RECORD
  string5 insureruniqueid;
  string200 generatedkey;
  string2 claimtype;
  string5 customernumber;
  string9 batch_no;
  unsigned8 loaddatetime;
  unsigned8 rec_seq_no;
  insurer_rec insurer;
  tpa_rec tpa;
  claimreopendetails_rec claimreopendetails;
  string1 authorizationrequestedindicator;
  string1 domiciliaryhospitalisationindicator;
  string97 transactionid;
  string7 transactiontype;
  string1 datacontributortype;
  string20 transactioncreationdatetime;
  string35 authorizationnumber;
  string35 claimintimationnumber;
  string10 claimintimationdate;
  string55 claimnumber;
  string2 claimstatus;
  string10 admittancedate;
  string10 dischargedate;
  string1 daycaretreatmentindicator;
  string1 extendedcareinpatientrehabilitationindicator;
  string1 claimnature;
  string5 rejectreasoncode;
  string300 claimrejectionreductionreasondescription;
  string1 claimreopenindicator;
  string1 copayapplicabilityindicator;
  string20 copayapplicabilityreason;
  string2 copayapplicabilityreasonotherdescription;
  decimal12_2 copayamount;
  string1 deductibleexcessindicator;
  decimal12_2 deductibleexcessamount;
  decimal12_2 totalclaimedamount;
  decimal12_2 totalsanctionedamount;
  decimal12_2 totaloutofpocketexpenseamount;
  decimal12_2 totalcorporateamountfloaterusedamount;
  decimal12_2 totaldisallowedamount;
  decimal12_2 totalpaidamount;
  decimal12_2 deductibleamount;
  decimal12_2 coordinationofbenefitsamount;
  decimal12_2 coinsuranceamount;
  string1000 tparemarks;
  string12 policysi;
  string12 policybsi;
  string12 membersi;
  string12 memberbsi;
  string12 corporatefloatersi;
  string12 corporatefloaterbsi;
  string12 opdsi;
  string12 opdbsi;
  string20 claimprovidernumber;
  string20 claiminsurernumber;
  string10 billingstartdate;
  string10 billingenddate;
  string11 birthregistration;
  string11 deathregistration;
  string5 adjustmentcode;
  string2 adjustmentnumber;
  string2 source_ae_or_ca;
  string25 tranreferencenumber;
  string50 pcpproviderkey;
  string50 billingproviderkey;
  string50 referingproviderkey;
  string51 primaryinsuredkey;
  string10 facilitynpi;
  string9 companyid;
  string10 claimlinenumber;
  string8 servicedate;
  string20 agreementid;
  string12 lineofbusiness;
  string20 typeofplan;
  string20 benefitplan;
  string8 claimreceiveddate;
  string22 claimdateandtimestamp;
  string2 securitycode;
 END;

 
fileName := '~thor::base::health::brazil::test::full::version::20170807::claims';//~thor::base::global::health::brazil::test::full::20170721::claims'; //testdata - thor::base::global::health::brazil::201770606::claims
EXPORT Claims := IF(COUNT(_Control.GeneratedKeyFilterSet) <= 0, 
	DATASET(fileName, LayoutClaim, THOR),
	JOIN(DISTRIBUTE(DATASET(fileName, LayoutClaim, THOR), HASH64(generatedkey)), DISTRIBUTE(_Control.GeneratedKeyFilterSet(generatedkey != ''), HASH64(generatedkey)), LEFT.generatedkey = RIGHT.generatedkey, TRANSFORM(LEFT), LOCAL));
	// DATASET(fileName, LayoutClaim, THOR) (generatedkey IN _Control.GeneratedKeyFilterSet));