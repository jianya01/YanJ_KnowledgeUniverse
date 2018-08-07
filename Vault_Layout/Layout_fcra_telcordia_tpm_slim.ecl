EXPORT Layout_fcra_telcordia_tpm_slim := RECORD,maxlength(9999)
Vault_Layout.Layout_ECLIngest_Prefix;
  string3 npa;
  string3 nxx;
  string1 tb;
  string1 dial_ind;
  string1 point_id;
  string2 nxx_type;
  DATASET({ string5 zip }) zipcodes;
  unsigned8 __internal_fpos__;
 END;
