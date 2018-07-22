﻿ common_adl_risk := RECORD
   unsigned1 addr_ct;
   unsigned1 addr_ct_last30days;
   unsigned1 addr_ct_last90days;
   unsigned1 addr_ct_c6;
   unsigned1 addr_ct_last1year;
   unsigned1 addr_ct_last2years;
   unsigned1 addr_ct_last3years;
   unsigned1 addr_ct_last5years;
   unsigned1 addr_ct_last10years;
   unsigned1 addr_ct_last15years;
   unsigned1 ssn_ct;
   unsigned1 ssn_ct_c6;
   unsigned1 ssn_ct_s18;
   unsigned1 lname_ct;
   unsigned1 lname_ct30;
   unsigned1 lname_ct90;
   unsigned1 lname_ct180;
   unsigned1 lname_ct12;
   unsigned1 lname_ct24;
   unsigned1 lname_ct36;
   unsigned1 lname_ct60;
   string20 newest_lname;
   string20 newest_lname2;
   unsigned3 newest_lname_dt_first_seen;
   unsigned2 dl_addrs_per_adl;
   unsigned2 vo_addrs_per_adl;
   unsigned2 pl_addrs_per_adl;
   unsigned2 invalid_ssns_per_adl;
   unsigned2 invalid_ssns_per_adl_created_6months;
   unsigned2 invalid_addrs_per_adl;
   unsigned2 invalid_addrs_per_adl_created_6months;
   unsigned1 stability;
   unsigned4 reported_dob;
   string2 reported_dob_src;
   integer8 inferred_age;
   unsigned4 reported_dob_no_dppa;
   string2 reported_dob_src_no_dppa;
   integer8 inferred_age_no_dppa;
  END;

EXPORT Layout_adl_risk_table_qa_vault := RECORD
Vault_Layout.Layout_ECLIngest_Prefix;
  unsigned8 did;
  string15 adl_category;
  boolean college_address_in_history;
  unsigned1 phone_ct;
  unsigned1 phone_ct_c6;
  common_adl_risk combo;
  common_adl_risk eq;
  common_adl_risk en;
  common_adl_risk tn;
  unsigned8 __internal_fpos__;
 END;


