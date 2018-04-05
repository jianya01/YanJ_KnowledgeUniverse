LayoutSeller := RECORD
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
  string5 sellerref;
  string5 insurerirdacode;
  string10 claimnumber;
  string9 claimregistrationdate;
  string10 claim_no;
  string3 policysellerstatus;
  string5 sellerindicator;
  string30 sellercompanycodeinsurer;
  string25 sellercategory;
 END;
			
fileName := '~thor::chola::base::motor::sept::masked::seller';
		
	
EXPORT SellerFile := DATASET(fileName, LayoutSeller, THOR);