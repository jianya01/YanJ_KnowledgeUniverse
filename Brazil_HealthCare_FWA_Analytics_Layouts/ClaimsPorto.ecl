IMPORT _Control;

insurer_rec := RECORD
   string25 insurerirdacode;
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
  string5 insurerirdacode;
  string55 generatedkey;
  string2 claimtype;
  insurer_rec insurer;
  tpa_rec tpa;
  claimreopendetails_rec claimreopendetails;
  string1 authorizationrequestedindicator;
  string1 domiciliaryhospitalisationindicator;
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
  string2 authorizationcode;
  string2 source_ae_or_ca;
  string25 tranreferencenumber;
  string10 requestreceiveddate;
  string1 requestimpact;
  string2 requeststatus;
  string20 requeststatusdescription;
 END;
 
fileName := '~thor::base::global::health::brazil::test::full::version2::20170726::claims';//~thor::base::global::health::brazil::test::full::20170721::claims'; //testdata - thor::base::global::health::brazil::201770606::claims
EXPORT ClaimsPorto := IF(COUNT(_Control.GeneratedKeyFilterSet) <= 0, 
	DATASET(fileName, LayoutClaim, THOR),
	JOIN(DATASET(fileName, LayoutClaim, THOR), _Control.GeneratedKeyFilterSet, LEFT.insurerirdacode = RIGHT.insurerirdacode AND LEFT.generatedkey = RIGHT.generatedkey AND LEFT.claimtype = RIGHT.claimtype, transform(LayoutClaim,self:=left)));