/* BlackBox File for RiskView Attributes */

IMPORT KELBlackBox, Utilities;

LayoutRiskView := RECORD
  unsigned4 date_first_seen;
  unsigned4 date_last_seen;
  string1 active_flag;
  unsigned8 rid;
  string6 build_period;
  unsigned4 seq;
  unsigned8 lexid;
  string1 index1;
  string1 index2;
  string1 index3;
  string1 index4;
  string1 index5;
  string3 index6;
  string3 index7;
  string3 index8;
  string3 index9;
  string3 index10;
  string1 index11;
  string3 ageoldestrecord;
  string3 agenewestrecord;
  string1 recentupdate;
  string3 srcsconfirmidaddrcount;
  string2 invaliddl;
  string1 verificationfailure;
  string2 ssnnotfound;
  string1 verifiedname;
  string2 verifiedssn;
  string2 verifiedphone;
  string2 verifiedaddress;
  string2 verifieddob;
  string3 inferredminimumage;
  string3 bestreportedage;
  string3 subjectssncount;
  string3 subjectaddrcount;
  string3 subjectphonecount;
  string3 subjectssnrecentcount;
  string3 subjectaddrrecentcount;
  string3 subjectphonerecentcount;
  string3 ssnidentitiescount;
  string3 ssnaddrcount;
  string3 ssnidentitiesrecentcount;
  string3 ssnaddrrecentcount;
  string3 inputaddrphonecount;
  string3 inputaddrphonerecentcount;
  string3 phoneidentitiescount;
  string3 phoneidentitiesrecentcount;
  string3 ssnagedeceased;
  string2 ssnrecent;
  string3 ssnlowissueage;
  string3 ssnhighissueage;
  string2 ssnissuestate;
  string2 ssnnonus;
  string2 ssn3years;
  string2 ssnafter5;
  string2 ssnproblems;
  string3 inputaddrageoldestrecord;
  string3 inputaddragenewestrecord;
  string2 inputaddrhistoricalmatch;
  string3 inputaddrlenofres;
  string2 inputaddrdwelltype;
  string2 inputaddrdelivery;
  string2 inputaddrapplicantowned;
  string2 inputaddrfamilyowned;
  string2 inputaddroccupantowned;
  string3 inputaddragelastsale;
  string10 inputaddrlastsalesprice;
  string2 inputaddrmortgagetype;
  string2 inputaddrnotprimaryres;
  string2 inputaddractivephonelist;
  string10 inputaddrtaxvalue;
  string4 inputaddrtaxyr;
  string10 inputaddrtaxmarketvalue;
  string10 inputaddravmvalue;
  string10 inputaddravmvalue12;
  string10 inputaddravmvalue60;
  string5 inputaddrcountyindex;
  string5 inputaddrtractindex;
  string5 inputaddrblockindex;
  string3 curraddrageoldestrecord;
  string3 curraddragenewestrecord;
  string3 curraddrlenofres;
  string2 curraddrdwelltype;
  string2 curraddrapplicantowned;
  string2 curraddrfamilyowned;
  string2 curraddroccupantowned;
  string3 curraddragelastsale;
  string10 curraddrlastsalesprice;
  string2 curraddrmortgagetype;
  string2 curraddractivephonelist;
  string10 curraddrtaxvalue;
  string4 curraddrtaxyr;
  string10 curraddrtaxmarketvalue;
  string10 curraddravmvalue;
  string10 curraddravmvalue12;
  string10 curraddravmvalue60;
  string5 curraddrcountyindex;
  string5 curraddrtractindex;
  string5 curraddrblockindex;
  string3 prevaddrageoldestrecord;
  string3 prevaddragenewestrecord;
  string3 prevaddrlenofres;
  string2 prevaddrdwelltype;
  string2 prevaddrapplicantowned;
  string2 prevaddrfamilyowned;
  string2 prevaddroccupantowned;
  string3 prevaddragelastsale;
  string10 prevaddrlastsalesprice;
  string10 prevaddrtaxvalue;
  string4 prevaddrtaxyr;
  string10 prevaddrtaxmarketvalue;
  string10 prevaddravmvalue;
  string5 prevaddrcountyindex;
  string5 prevaddrtractindex;
  string5 prevaddrblockindex;
  string4 addrmostrecentdistance;
  string2 addrmostrecentstatediff;
  string11 addrmostrecenttaxdiff;
  string3 addrmostrecentmoveage;
  string2 addrrecentecontrajectory;
  string2 addrrecentecontrajectoryindex;
  string1 educationattendedcollege;
  string2 educationprogram2yr;
  string2 educationprogram4yr;
  string2 educationprogramgraduate;
  string2 educationinstitutionprivate;
  string2 educationfieldofstudytype;
  string2 educationinstitutionrating;
  string1 addrstability;
  string2 statusmostrecent;
  string2 statusprevious;
  string2 statusnextprevious;
  string3 addrchangecount01;
  string3 addrchangecount03;
  string3 addrchangecount06;
  string3 addrchangecount12;
  string3 addrchangecount24;
  string3 addrchangecount60;
  string10 estimatedannualincome;
  string1 propertyowner;
  string3 propownedcount;
  string10 propownedtaxtotal;
  string3 propownedhistoricalcount;
  string3 propageoldestpurchase;
  string3 propagenewestpurchase;
  string3 propagenewestsale;
  string10 propnewestsaleprice;
  string5 propnewestsalepurchaseindex;
  string3 proppurchasedcount01;
  string3 proppurchasedcount03;
  string3 proppurchasedcount06;
  string3 proppurchasedcount12;
  string3 proppurchasedcount24;
  string3 proppurchasedcount60;
  string3 propsoldcount01;
  string3 propsoldcount03;
  string3 propsoldcount06;
  string3 propsoldcount12;
  string3 propsoldcount24;
  string3 propsoldcount60;
  string1 assetowner;
  string1 watercraftowner;
  string3 watercraftcount;
  string3 watercraftcount01;
  string3 watercraftcount03;
  string3 watercraftcount06;
  string3 watercraftcount12;
  string3 watercraftcount24;
  string3 watercraftcount60;
  string1 aircraftowner;
  string3 aircraftcount;
  string3 aircraftcount01;
  string3 aircraftcount03;
  string3 aircraftcount06;
  string3 aircraftcount12;
  string3 aircraftcount24;
  string3 aircraftcount60;
  string2 wealthindex;
  string2 businessactiveassociation;
  string2 businessinactiveassociation;
  string3 businessassociationage;
  string100 businesstitle;
  string1 derogseverityindex;
  string3 derogcount;
  string3 derogrecentcount;
  string3 derogage;
  string3 felonycount;
  string3 felonyage;
  string3 felonycount01;
  string3 felonycount03;
  string3 felonycount06;
  string3 felonycount12;
  string3 felonycount24;
  string3 felonycount60;
  string3 liencount;
  string3 lienfiledcount;
  string3 lienfiledage;
  string3 lienfiledcount01;
  string3 lienfiledcount03;
  string3 lienfiledcount06;
  string3 lienfiledcount12;
  string3 lienfiledcount24;
  string3 lienfiledcount60;
  string3 lienreleasedcount;
  string3 lienreleasedage;
  string3 lienreleasedcount01;
  string3 lienreleasedcount03;
  string3 lienreleasedcount06;
  string3 lienreleasedcount12;
  string3 lienreleasedcount24;
  string3 lienreleasedcount60;
  string10 lienfiledtotal;
  string10 lienfederaltaxfiledtotal;
  string10 lientaxotherfiledtotal;
  string10 lienforeclosurefiledtotal;
  string10 lienlandlordtenantfiledtotal;
  string10 lienjudgmentfiledtotal;
  string10 liensmallclaimsfiledtotal;
  string10 lienotherfiledtotal;
  string10 lienreleasedtotal;
  string10 lienfederaltaxreleasedtotal;
  string10 lientaxotherreleasedtotal;
  string10 lienforeclosurereleasedtotal;
  string10 lienlandlordtenantreleasedtotal;
  string10 lienjudgmentreleasedtotal;
  string10 liensmallclaimsreleasedtotal;
  string10 lienotherreleasedtotal;
  string3 lienfederaltaxfiledcount;
  string3 lientaxotherfiledcount;
  string3 lienforeclosurefiledcount;
  string3 lienlandlordtenantfiledcount;
  string3 lienjudgmentfiledcount;
  string3 liensmallclaimsfiledcount;
  string3 lienotherfiledcount;
  string3 lienfederaltaxreleasedcount;
  string3 lientaxotherreleasedcount;
  string3 lienforeclosurereleasedcount;
  string3 lienlandlordtenantreleasedcount;
  string3 lienjudgmentreleasedcount;
  string3 liensmallclaimsreleasedcount;
  string3 lienotherreleasedcount;
  string3 bankruptcycount;
  string3 bankruptcyage;
  string3 bankruptcytype;
  string35 bankruptcystatus;
  string3 bankruptcycount01;
  string3 bankruptcycount03;
  string3 bankruptcycount06;
  string3 bankruptcycount12;
  string3 bankruptcycount24;
  string3 bankruptcycount60;
  string3 evictioncount;
  string3 evictionage;
  string3 evictioncount01;
  string3 evictioncount03;
  string3 evictioncount06;
  string3 evictioncount12;
  string3 evictioncount24;
  string3 evictioncount60;
  string2 recentactivityindex;
  string3 nonderogcount;
  string3 nonderogcount01;
  string3 nonderogcount03;
  string3 nonderogcount06;
  string3 nonderogcount12;
  string3 nonderogcount24;
  string3 nonderogcount60;
  string1 voterregistrationrecord;
  string3 profliccount;
  string3 proflicage;
  string60 proflictype;
  string2 proflictypecategory;
  string2 proflicexpired;
  string3 profliccount01;
  string3 profliccount03;
  string3 profliccount06;
  string3 profliccount12;
  string3 profliccount24;
  string3 profliccount60;
  string1 inquirycollectionsrecent;
  string1 inquirypersonalfinancerecent;
  string1 inquiryotherrecent;
  string1 highriskcreditactivity;
  string3 subprimeofferrequestcount;
  string3 subprimeofferrequestcount01;
  string3 subprimeofferrequestcount03;
  string3 subprimeofferrequestcount06;
  string3 subprimeofferrequestcount12;
  string3 subprimeofferrequestcount24;
  string3 subprimeofferrequestcount60;
  string2 inputphonemobile;
  string3 phoneedaageoldestrecord;
  string3 phoneedaagenewestrecord;
  string3 phoneotherageoldestrecord;
  string3 phoneotheragenewestrecord;
  string2 inputphonehighrisk;
  string2 inputphoneproblems;
  string2 emailaddress;
  string2 inputaddrhighrisk;
  string2 curraddrcorrectional;
  string2 prevaddrcorrectional;
  string2 historicaladdrcorrectional;
  string2 inputaddrproblems;
  string1 securityfreeze;
  string1 securityalert;
  string1 idtheftflag;
  string1 consumerstatement;
  string2 prescreenoptout;
  string20 modelname1;
  string3 score1;
  string20 scorename1;
  string3 reason1;
  string3 reason2;
  string3 reason3;
  string3 reason4;
  string20 modelname2;
  string3 score2;
  string20 scorename2;
  string3 reason5;
  string3 reason6;
  string3 reason7;
  string3 reason8;
  string20 modelname3;
  string3 score3;
  string20 scorename3;
  string3 reason9;
  string3 reason10;
  string3 reason11;
  string3 reason12;
  string20 modelname4;
  string3 score4;
  string20 scorename4;
  string3 reason13;
  string3 reason14;
  string3 reason15;
  string3 reason16;
  string20 modelname5;
  string3 score5;
  string20 scorename5;
  string3 reason17;
  string3 reason18;
  string3 reason19;
  string3 reason20;
  string3 reason21;
  string3 reason22;
  string3 reason23;
  string3 reason24;
  string3 reason25;
  unsigned8 did;
END;

EXPORT FileBlackBoxRiskView := DATASET(KELBlackBox.FileBlackBoxLocation + 'thor::base::ar::prod::riskview', LayoutRiskView, THOR, __COMPRESSED__) (LexID NOT IN KELBlackBox.ProblematicLexIDs);
//EXPORT FileBlackBoxRiskView := DATASET('~bpahl::base::ar::prod::riskviewslim', LayoutRiskView, THOR, __COMPRESSED__) (LexID NOT IN KELBlackBox.ProblematicLexIDs);