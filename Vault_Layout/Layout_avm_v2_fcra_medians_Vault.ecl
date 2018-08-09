layout_median_history_slim := RECORD
   string8 history_date;
   integer8 median_valuation;
  END;

EXPORT Layout_avm_v2_fcra_medians_Vault := RECORD
Vault_Layout.Layout_ECLIngest_Prefix;
  string12 fips_geo_12;
  string8 history_date;
  integer8 median_valuation;
  DATASET(layout_median_history_slim) history{maxcount(100)};
  unsigned8 __internal_fpos__;
 END;
