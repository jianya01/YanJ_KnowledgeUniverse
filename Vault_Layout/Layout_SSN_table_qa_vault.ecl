
 lname_var := RECORD
    string20 fname;
    string20 lname;
    unsigned3 first_seen;
    unsigned3 last_seen;
   END;

common_rec := RECORD
   unsigned3 header_first_seen;
   unsigned3 header_last_seen;
   integer8 headercount;
   integer8 eqcount;
   integer8 encount;
   integer8 tncount;
   integer8 tucount;
   integer8 srccount;
   integer8 didcount;
   integer8 didcount_c6;
   integer8 didcount_s18;
   integer8 addr_ct;
   integer8 addr_ct_c6;
   integer8 bestcount;
   integer8 recentcount;
   unsigned6 bestdid;
   lname_var lname1;
   lname_var lname2;
   lname_var lname3;
   lname_var lname4;
  END;


 EXPORT Layout_SSN_table_qa_vault := RECORD
  Vault_Layout.Layout_ECLIngest_Prefix;
  string9 ssn;
  unsigned3 official_first_seen;
  unsigned3 official_last_seen;
  boolean isvalidformat;
  boolean issequencevalid;
  boolean isbankrupt;
  unsigned8 dt_first_bankrupt;
  boolean isdeceased;
  unsigned8 dt_first_deceased;
  unsigned8 decs_dob;
  string5 decs_zip_lastres;
  string5 decs_zip_lastpayment;
  string20 decs_last;
  string20 decs_first;
  string2 issue_state;
  common_rec combo;
  common_rec eq;
  common_rec en;
  common_rec tn;
  unsigned8 __internal_fpos__;
 END;




