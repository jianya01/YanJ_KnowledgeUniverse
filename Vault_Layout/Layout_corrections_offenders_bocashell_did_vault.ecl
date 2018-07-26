layout_date := RECORD
  unsigned4 date;
  string60 offender_key;
  string35 case_num;
  string1 fcra_conviction_flag;
  string1 fcra_traffic_flag;
  string2 offense_score;
 END;

EXPORT Layout_corrections_offenders_bocashell_did_vault := RECORD
Vault_Layout.Layout_ECLIngest_Prefix;
unsigned6 did;
 DATASET(layout_date) criminal_count{maxcount(100)};
 unsigned8 __internal_fpos__ ;
END;