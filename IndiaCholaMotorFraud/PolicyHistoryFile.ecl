LayoutPolicyHistory := RECORD
  unsigned8 sequenceid;
  string9 batch_id;
  unsigned8 recordnumber;
  unsigned8 claimgroupnumber;
  string9 contributor_id;
  unsigned1 file_seq;
  string generatedkey;
  unsigned4 parententityseqnumber;
  unsigned4 entityseqnumber;
  string5 claimtype;
  string5 policyhistoryref;
  string50 policynumber;
  string10 claimnumber;
  string9 claimregistrationdate;
  string5 insurerirdacode;
  string100 insurername;
  string100 policytype;
  string150 policytypeotherdetails;
  string2 policystartdate_day;
  string2 policystartdate_month;
  string4 policystartdate_year;
  string2 policyenddate_day;
  string2 policyenddate_month;
  string4 policyenddate_year;
  string1 ncdindicator;
  string10 ncdpercentage;
  string1 claimslodgedindicator;
  string3 countofclaims;
  string8 totalamountclaimed;
 END;
			
 fileName := '~thor::chola::base::motor::sept::masked::policyhistory';
		
 EXPORT PolicyHistoryFile := DATASET(fileName, LayoutPolicyHistory, THOR);
			



