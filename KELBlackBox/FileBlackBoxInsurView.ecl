/* BlackBox File for InsurView Attributes */

IMPORT _Control, KELBlackBox;

LayoutInsurView := RECORD
  string8 load_dt;
  string8 correlator_dt;
  string19 order_dt;
  unsigned4 order_dt_drv;
  unsigned8 lexid;
  unsigned8 hhid;
  unsigned8 hhid_indiv;
  string20 first_name;
  string15 middle_name;
  string28 last_name;
  string3 suffix;
  string9 ssn;
  string8 dob;
  string1 gender;
  string12 house_nbr;
  string47 street;
  string12 apt_nbr;
  string30 city;
  string2 state;
  string5 zip;
  string4 zip4;
  string25 dl_nbr;
  string2 dl_state;
  string2 product_code;
  string1 fcra_rpt_ind;
  string5 customer_nbr;
  string9 account_nbr;
  string2 market_code;
  string1 lob;
  string2 report_type;
  integer8 iv_link_id;
  integer8 iv_household_id;
  integer8 dedup_id;
  integer8 consumer_id;
  string16 rpt_reference_id;
  unsigned8 rid;
  string1 relexid_flag;
END;

fileName := KELBlackBox.FileBlackBoxLocation + 'thor::base::cdw::prod::insurview';
EXPORT FileBlackBoxInsurView := IF(COUNT(_Control.LexIDFilterSet) <= 0, 
	DATASET(fileName, LayoutInsurView, THOR, __COMPRESSED__) (LexID NOT IN KELBlackBox.ProblematicLexIDs),
	DATASET(fileName, LayoutInsurView, THOR, __COMPRESSED__) ((UNSIGNED8)LexID IN _Control.LexIDFilterSet));