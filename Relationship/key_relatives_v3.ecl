IMPORT _Control;

relativeLayoutOutputTitled := RECORD
	string15 type;
	string10 confidence;
	unsigned6 did1;
	unsigned6 did2;
	integer2 cohabit_score;
	integer2 cohabit_cnt;
	integer2 coapt_score;
	integer2 coapt_cnt;
	integer2 copobox_score;
	integer2 copobox_cnt;
	integer2 cossn_score;
	integer2 cossn_cnt;
	integer2 copolicy_score;
	integer2 copolicy_cnt;
	integer2 coclaim_score;
	integer2 coclaim_cnt;
	integer2 coproperty_score;
	integer2 coproperty_cnt;
	integer2 bcoproperty_score;
	integer2 bcoproperty_cnt;
	integer2 coforeclosure_score;
	integer2 coforeclosure_cnt;
	integer2 bcoforeclosure_score;
	integer2 bcoforeclosure_cnt;
	integer2 colien_score;
	integer2 colien_cnt;
	integer2 bcolien_score;
	integer2 bcolien_cnt;
	integer2 cobankruptcy_score;
	integer2 cobankruptcy_cnt;
	integer2 bcobankruptcy_score;
	integer2 bcobankruptcy_cnt;
	integer2 covehicle_score;
	integer2 covehicle_cnt;
	integer2 coexperian_score;
	integer2 coexperian_cnt;
	integer2 cotransunion_score;
	integer2 cotransunion_cnt;
	integer2 coenclarity_score;
	integer2 coenclarity_cnt;
	integer2 coecrash_score;
	integer2 coecrash_cnt;
	integer2 bcoecrash_score;
	integer2 bcoecrash_cnt;
	integer2 cowatercraft_score;
	integer2 cowatercraft_cnt;
	integer2 coaircraft_score;
	integer2 coaircraft_cnt;
	integer2 comarriagedivorce_score;
	integer2 comarriagedivorce_cnt;
	integer2 coucc_score;
	integer2 coucc_cnt;
	integer2 lname_score;
	integer2 phone_score;
	integer2 dl_nbr_score;
	unsigned2 total_cnt;
	integer2 total_score;
	string10 cluster;
	string2  generation;
	string1  gender;
	unsigned4 lname_cnt;
	unsigned4 rel_dt_first_seen;
	unsigned4 rel_dt_last_seen;
	unsigned2 overlap_months;
	unsigned4 hdr_dt_first_seen;
	unsigned4 hdr_dt_last_seen;
	unsigned2 age_first_seen;
	boolean   isAnyLnameMatch;
	boolean   isAnyPhoneMatch;
	boolean   isEarlyLnameMatch;
	boolean   isCurrLnameMatch;
	boolean   isMixedLnameMatch;
	string9   ssn1;
	string9   ssn2;
	unsigned4 dob1;
	unsigned4 dob2;
	string28 current_lname1,
	string28 current_lname2,
	string28 early_lname1,
	string28 early_lname2,
	string2 addr_ind1;
	string2 addr_ind2;
	unsigned6 r2rdid;
	unsigned6 r2cnt;
	boolean Personal;
	boolean Business;
	boolean Other;
	unsigned1 title;
END;

location := '~';
prefix := location + 'thor_data400::base::insurance_header::';
Relative_File := prefix + 'RELATIVE';
Relative_ds := DATASET(Relative_File, relativeLayoutOutputTitled, FLAT, OPT);

fRelatives := Relative_ds(NOT (type = 'FRAGMENT' OR confidence IN ['LOW','NOISE']));
drop_pobox_only := frelatives(not(cohabit_cnt=0        AND
                                             coapt_cnt=0          AND
							                               copobox_cnt>0        AND
							                               cossn_cnt=0          AND
							                               copolicy_cnt=0       AND
							                               coclaim_cnt=0        AND
							                               coproperty_cnt=0     AND
							                               bcoproperty_cnt=0    AND
							                               coforeclosure_cnt=0  AND
							                               bcoforeclosure_cnt=0 AND
							                               colien_cnt=0         AND
							                               bcolien_cnt=0        AND
							                               cobankruptcy_cnt=0   AND
							                               bcobankruptcy_cnt=0  AND
							                               covehicle_cnt=0      AND
							                               coexperian_cnt=0     AND
							                               cotransunion_cnt=0   AND
							                               coenclarity_cnt=0    AND
							                               coecrash_cnt=0       AND
							                               bcoecrash_cnt=0      AND
							                               cowatercraft_cnt=0   AND
							                               coaircraft_cnt=0     AND
							                               comarriagedivorce_cnt=0 AND
							                               coucc_cnt=0          AND
							                               lname_score<=0       AND
							                               phone_score<=0       AND
							                               dl_nbr_score<=0      AND
							                               r2rdid=0));
	
trec := record
	drop_pobox_only;
	unsigned8 cnt;
	unsigned8 maxscore;
	boolean   ismatch;
end;

prep := project(drop_pobox_only,transform(trec,self.cnt:=1,self.maxscore:=0,self.ismatch:=FALSE,self:=left));
t1 := rollup(sort(distribute(prep,hash(did1)),did1,local),
                 left.did1 = right.did1,             
						     transform(trec,
								           self.cohabit_cnt := max(left.cohabit_cnt,right.cohabit_cnt),
													 self.coapt_cnt := max(left.coapt_cnt,right.coapt_cnt),
													 self.copobox_cnt := max(left.copobox_cnt,right.copobox_cnt),
													 self.cossn_cnt := max(left.cossn_cnt,right.cossn_cnt),
													 self.copolicy_cnt := max(left.copolicy_cnt,right.copolicy_cnt),
													 self.coclaim_cnt := max(left.coclaim_cnt,right.coclaim_cnt),
													 self.coproperty_cnt := max(left.coproperty_cnt,right.coproperty_cnt),
													 self.bcoproperty_cnt := max(left.bcoproperty_cnt,right.bcoproperty_cnt),
													 self.coforeclosure_cnt := max(left.coforeclosure_cnt,right.coforeclosure_cnt),
													 self.bcoforeclosure_cnt := max(left.bcoforeclosure_cnt,right.bcoforeclosure_cnt),
													 self.colien_cnt := max(left.colien_cnt,right.colien_cnt),
													 self.bcolien_cnt := max(left.bcolien_cnt,right.bcolien_cnt),
													 self.cobankruptcy_cnt := max(left.cobankruptcy_cnt,right.cobankruptcy_cnt),
													 self.bcobankruptcy_cnt := max(left.bcobankruptcy_cnt,right.bcobankruptcy_cnt),
													 self.covehicle_cnt := max(left.covehicle_cnt,right.covehicle_cnt),
													 self.coexperian_cnt := max(left.coexperian_cnt,right.coexperian_cnt),
													 self.cotransunion_cnt := max(left.cotransunion_cnt,right.cotransunion_cnt),
													 self.coenclarity_cnt := max(left.coenclarity_cnt,right.coenclarity_cnt),
													 self.coecrash_cnt := max(left.coecrash_cnt,right.coecrash_cnt),
													 self.bcoecrash_cnt := max(left.bcoecrash_cnt,right.bcoecrash_cnt),
													 self.cowatercraft_cnt := max(left.cowatercraft_cnt,right.cowatercraft_cnt),
													 self.coaircraft_cnt := max(left.coaircraft_cnt,right.coaircraft_cnt),
													 self.comarriagedivorce_cnt := max(left.comarriagedivorce_cnt,right.comarriagedivorce_cnt),
													 self.coucc_cnt := max(left.coucc_cnt,right.coucc_cnt),
													 self.total_cnt := max(left.total_cnt,right.total_cnt),
                           self.maxscore := max(left.total_score,right.total_score),						              
													 self.ismatch := left.lname_score>0 OR left.phone_score>0 OR left.dl_nbr_score>0 OR right.lname_score>0 OR right.phone_score>0 OR right.dl_nbr_score>0,												
                           self.ssn1 := max(left.ssn1,right.ssn1),
													 self.dob1 := max(left.dob1,right.dob1), 
													 self.cnt := left.cnt + right.cnt,
											     self := left),local);

valid_large         := t1(cnt>499 AND (ssn1<>'' OR dob1>0 OR isMatch OR maxscore>=40));
valid_large_allrecs := join(drop_pobox_only,valid_large,left.did1=right.did1,hash);
drop_veh_only       := valid_large_allrecs(not(cohabit_cnt=0       AND
                                             coapt_cnt=0             AND
							                               copobox_cnt=0           AND
							                               cossn_cnt=0             AND
							                               copolicy_cnt=0          AND
							                               coclaim_cnt=0           AND
							                               coproperty_cnt=0        AND
							                               bcoproperty_cnt=0       AND
							                               coforeclosure_cnt=0     AND
							                               bcoforeclosure_cnt=0    AND
							                               colien_cnt=0            AND
							                               bcolien_cnt=0           AND
							                               cobankruptcy_cnt=0      AND
							                               bcobankruptcy_cnt=0     AND
							                               covehicle_cnt>0         AND
							                               coexperian_cnt=0        AND
							                               cotransunion_cnt=0      AND
							                               coenclarity_cnt=0       AND
							                               coecrash_cnt=0          AND
							                               bcoecrash_cnt=0         AND
							                               cowatercraft_cnt=0      AND
							                               coaircraft_cnt=0        AND
							                               comarriagedivorce_cnt=0 AND
							                               coucc_cnt=0             AND
							                               lname_score<=0          AND
							                               phone_score<=0          AND
							                               dl_nbr_score<=0         AND
							                               r2rdid=0));

drop_realestate_only  := drop_veh_only(not(cohabit_cnt=0 AND
                                         coapt_cnt=0 AND
							                           copobox_cnt=0 AND
							                           cossn_cnt=0 AND
							                           copolicy_cnt=0 AND
							                           coclaim_cnt=0 AND
							                           coproperty_cnt=0 AND
							                           bcoproperty_cnt>0 AND
							                           coforeclosure_cnt=0 AND
							                           bcoforeclosure_cnt=0 AND
							                           colien_cnt=0 AND
							                           bcolien_cnt=0 AND
							                           cobankruptcy_cnt=0 AND
							                           bcobankruptcy_cnt=0 AND
							                           covehicle_cnt=0 AND
							                           coexperian_cnt=0 AND
							                           cotransunion_cnt=0 AND
							                           coenclarity_cnt=0 AND
							                           coecrash_cnt=0 AND
							                           bcoecrash_cnt=0 AND
							                           cowatercraft_cnt=0 AND
							                           coaircraft_cnt=0 AND
							                           comarriagedivorce_cnt=0 AND
							                           coucc_cnt=0 AND
							                           lname_score<=0 AND
							                           phone_score<=0 AND
							                           dl_nbr_score<=0 AND
							                           r2rdid=0));  
	
combo := project(join(drop_pobox_only,t1(cnt<500),left.did1=right.did1,hash),transform(recordof(drop_pobox_only),self:=left)) + 
                  project(drop_realestate_only,transform(recordof(drop_pobox_only),self:=left));	
	
cleaned := project(combo,
	                             transform(recordof(left),
															           self.ssn1 := [];
																				 self.ssn2 := [];
																				 self.dob1 := 0;
																				 self.dob2 := 0;
																				 self.age_first_seen := 0;
																				 self := left));

fileName := '~thor_data400::key::relatives_v3_qa';
EXPORT key_relatives_v3 := IF(COUNT(_Control.LexIDFilterSet) <= 0, 
	INDEX(cleaned, {did1}, {cleaned}, fileName),
	INDEX(cleaned, {did1}, {cleaned}, fileName) (KEYED((UNSIGNED8)DID1 IN _Control.LexIDFilterSet)));