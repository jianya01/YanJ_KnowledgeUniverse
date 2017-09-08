﻿Generated by SALT V3.8.1
Command line options: -MI_Crim_Offenses -eC:\Users\parevi02\AppData\Local\Temp\TFRB81D.tmp 
File being processed :-
OPTIONS:-gn
MODULE:I_Crim_Offenses
FILENAME:Vault
INGESTFILE:OFPU:NAMED(Source)
RIDFIELD:vault_rid
SOURCERIDFIELD:vault_UID_Hash
FIELD:vault_date_first_seen:RECORDDATE(FIRST):
FIELD:vault_date_last_seen:RECORDDATE(LAST):
INGESTMODE:NONCONTIGUOUS(vault_date_first_seen,vault_date_last_seen)
 
FIELD:vault_uid_hash:TYPE(INTEGER8):0,0
FIELD:process_date:TYPE(STRING8):0,0
FIELD:offender_key:TYPE(STRING60):0,0
FIELD:vendor:TYPE(STRING5):0,0
FIELD:state_origin:TYPE(STRING2):0,0
FIELD:source_file:TYPE(STRING20):0,0
FIELD:data_type:TYPE(STRING1):0,0
FIELD:off_comp:TYPE(STRING4):0,0
FIELD:off_delete_flag:TYPE(STRING1):0,0
FIELD:off_date:TYPE(STRING8):0,0
FIELD:arr_date:TYPE(STRING8):0,0
FIELD:num_of_counts:TYPE(STRING3):0,0
FIELD:le_agency_cd:TYPE(STRING10):0,0
FIELD:le_agency_desc:TYPE(STRING50):0,0
FIELD:le_agency_case_number:TYPE(STRING35):0,0
FIELD:traffic_ticket_number:TYPE(STRING35):0,0
FIELD:traffic_dl_no:TYPE(STRING25):0,0
FIELD:traffic_dl_st:TYPE(STRING2):0,0
FIELD:arr_off_code:TYPE(STRING20):0,0
FIELD:arr_off_desc_1:TYPE(STRING75):0,0
FIELD:arr_off_desc_2:TYPE(STRING50):0,0
FIELD:arr_off_type_cd:TYPE(STRING5):0,0
FIELD:arr_off_type_desc:TYPE(STRING30):0,0
FIELD:arr_off_lev:TYPE(STRING5):0,0
FIELD:arr_statute:TYPE(STRING20):0,0
FIELD:arr_statute_desc:TYPE(STRING70):0,0
FIELD:arr_disp_date:TYPE(STRING8):0,0
FIELD:arr_disp_code:TYPE(STRING5):0,0
FIELD:arr_disp_desc_1:TYPE(STRING30):0,0
FIELD:arr_disp_desc_2:TYPE(STRING30):0,0
FIELD:pros_refer_cd:TYPE(STRING10):0,0
FIELD:pros_refer:TYPE(STRING50):0,0
FIELD:pros_assgn_cd:TYPE(STRING10):0,0
FIELD:pros_assgn:TYPE(STRING50):0,0
FIELD:pros_chg_rej:TYPE(STRING1):0,0
FIELD:pros_off_code:TYPE(STRING20):0,0
FIELD:pros_off_desc_1:TYPE(STRING75):0,0
FIELD:pros_off_desc_2:TYPE(STRING50):0,0
FIELD:pros_off_type_cd:TYPE(STRING5):0,0
FIELD:pros_off_type_desc:TYPE(STRING30):0,0
FIELD:pros_off_lev:TYPE(STRING5):0,0
FIELD:pros_act_filed:TYPE(STRING30):0,0
FIELD:court_case_number:TYPE(STRING35):0,0
FIELD:court_cd:TYPE(STRING10):0,0
FIELD:court_desc:TYPE(STRING40):0,0
FIELD:court_appeal_flag:TYPE(STRING1):0,0
FIELD:court_final_plea:TYPE(STRING30):0,0
FIELD:court_off_code:TYPE(STRING20):0,0
FIELD:court_off_desc_1:TYPE(STRING75):0,0
FIELD:court_off_desc_2:TYPE(STRING50):0,0
FIELD:court_off_type_cd:TYPE(STRING5):0,0
FIELD:court_off_type_desc:TYPE(STRING30):0,0
FIELD:court_off_lev:TYPE(STRING5):0,0
FIELD:court_statute:TYPE(STRING20):0,0
FIELD:court_additional_statutes:TYPE(STRING50):0,0
FIELD:court_statute_desc:TYPE(STRING70):0,0
FIELD:court_disp_date:TYPE(STRING8):0,0
FIELD:court_disp_code:TYPE(STRING5):0,0
FIELD:court_disp_desc_1:TYPE(STRING40):0,0
FIELD:court_disp_desc_2:TYPE(STRING40):0,0
FIELD:sent_date:TYPE(STRING8):0,0
FIELD:sent_jail:TYPE(STRING50):0,0
FIELD:sent_susp_time:TYPE(STRING50):0,0
FIELD:sent_court_cost:TYPE(STRING8):0,0
FIELD:sent_court_fine:TYPE(STRING9):0,0
FIELD:sent_susp_court_fine:TYPE(STRING9):0,0
FIELD:sent_probation:TYPE(STRING50):0,0
FIELD:sent_addl_prov_code:TYPE(STRING5):0,0
FIELD:sent_addl_prov_desc_1:TYPE(STRING40):0,0
FIELD:sent_addl_prov_desc_2:TYPE(STRING40):0,0
FIELD:sent_consec:TYPE(STRING2):0,0
FIELD:sent_agency_rec_cust_ori:TYPE(STRING10):0,0
FIELD:sent_agency_rec_cust:TYPE(STRING50):0,0
FIELD:appeal_date:TYPE(STRING8):0,0
FIELD:appeal_off_disp:TYPE(STRING40):0,0
FIELD:appeal_final_decision:TYPE(STRING40):0,0
FIELD:convict_dt:TYPE(STRING8):0,0
FIELD:offense_town:TYPE(STRING30):0,0
FIELD:cty_conv:TYPE(STRING30):0,0
FIELD:restitution:TYPE(STRING12):0,0
FIELD:community_service:TYPE(STRING30):0,0
FIELD:parole:TYPE(STRING20):0,0
FIELD:addl_sent_dates:TYPE(STRING30):0,0
FIELD:probation_desc2:TYPE(STRING60):0,0
FIELD:court_dt:TYPE(STRING8):0,0
FIELD:court_county:TYPE(STRING40):0,0
FIELD:arr_off_lev_mapped:TYPE(STRING35):0,0
FIELD:court_off_lev_mapped:TYPE(STRING35):0,0
FIELD:fcra_offense_key:TYPE(STRING60):0,0
FIELD:fcra_conviction_flag:TYPE(STRING1):0,0
FIELD:fcra_traffic_flag:TYPE(STRING1):0,0
FIELD:fcra_date:TYPE(STRING8):0,0
FIELD:fcra_date_type:TYPE(STRING1):0,0
FIELD:conviction_override_date:TYPE(STRING8):0,0
FIELD:conviction_override_date_type:TYPE(STRING1):0,0
FIELD:offense_score:TYPE(STRING2):0,0
FIELD:offense_persistent_id:TYPE(UNSIGNED8):0,0
FIELD:offense_category:TYPE(UNSIGNED8):0,0
FIELD:hyg_classification_code:TYPE(STRING8):0,0
FIELD:old_ln_offense_score:TYPE(STRING8):0,0
 
 
Total available specificity:0
Search Threshold set at -4
Use of PERSISTs in code set at:3
 
__Glossary__
Edit Distance: An edit distance of (say) one implies that one string can be converted into another by doing one of
  - Changing one character
  - Deleting one character
  - Transposing two characters
 
Forcing Criteria: In addition to the general 'best match' logic it is possible to insist that
one particular field must match to some degree or the whole record is considered a bad match.
The criterial applied to that one field is the forcing criteria.
 
Cascade: Best Type rules are applied in such a way that the rules are applied one by one UNTIL the first rule succeeds; subsequent rules are then skipped.
 
__General Notes__
How is it decided how much to subtract for a bad match?
SALT computes for each field the percentage likelihood that a valid cluster will have two or more values for a given field
this value (called the switch value in the SALT literature) is then used to produce the subtraction value from the match value.
The value in this document is the one typed into the SPC file; the code will use a value computed at run-time.
 
