﻿
 EXPORT Source :=  project(I_Crim_Offenses.Constants.Sourcefile, transform(I_Crim_Offenses.Layout_Vault, 
   																																								SELF.vault_date_first_seen := 20170801;
   																																								SELF.vault_date_last_seen := 	0;
   																																								SELF.vault_rid := 	0;
																																									SELF.vault_UID_Hash := HASHMD5(left.process_date,left.offender_key,left.vendor,left.state_origin,left.source_file,left.data_type,left.off_comp,left.off_delete_flag,left.off_date,left.arr_date,left.num_of_counts,left.le_agency_cd,left.le_agency_desc,left.le_agency_case_number,left.traffic_ticket_number,left.traffic_dl_no,left.traffic_dl_st,left.arr_off_code,left.arr_off_desc_1,left.arr_off_desc_2,left.arr_off_type_cd,left.arr_off_type_desc,left.arr_off_lev,left.arr_statute,left.arr_statute_desc,left.arr_disp_date,left.arr_disp_code,left.arr_disp_desc_1,left.arr_disp_desc_2,left.pros_refer_cd,left.pros_refer,left.pros_assgn_cd,left.pros_assgn,left.pros_chg_rej,left.pros_off_code,left.pros_off_desc_1,left.pros_off_desc_2,left.pros_off_type_cd,left.pros_off_type_desc,left.pros_off_lev,left.pros_act_filed,left.court_case_number,left.court_cd,left.court_desc,left.court_appeal_flag,left.court_final_plea,left.court_off_code,left.court_off_desc_1,left.court_off_desc_2,left.court_off_type_cd,left.court_off_type_desc,left.court_off_lev,left.court_statute,left.court_additional_statutes,left.court_statute_desc,left.court_disp_date,left.court_disp_code,left.court_disp_desc_1,left.court_disp_desc_2,left.sent_date,left.sent_jail,left.sent_susp_time,left.sent_court_cost,left.sent_court_fine,left.sent_susp_court_fine,left.sent_probation,left.sent_addl_prov_code,left.sent_addl_prov_desc_1,left.sent_addl_prov_desc_2,left.sent_consec,left.sent_agency_rec_cust_ori,left.sent_agency_rec_cust,left.appeal_date,left.appeal_off_disp,left.appeal_final_decision,left.convict_dt,left.offense_town,left.cty_conv,left.restitution,left.community_service,left.parole,left.addl_sent_dates,left.probation_desc2,left.court_dt,left.court_county,left.arr_off_lev_mapped,left.court_off_lev_mapped,left.fcra_offense_key,left.fcra_conviction_flag,left.fcra_traffic_flag,left.fcra_date,left.fcra_date_type,left.conviction_override_date,left.conviction_override_date_type,left.offense_score,left.offense_persistent_id,left.offense_category,left.hyg_classification_code,left.old_ln_offense_score

);
   																																								SELF := LEFT;
   																																								SELF:=[];
   																																								));
																																									
