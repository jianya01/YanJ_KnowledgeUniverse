EXPORT MAC_Collate_Uber_Matches(Key,Wds,s,uber_rec_type,in_dt_first_field='',in_dt_last_field='',asofdate=0,in_inc_dt_last_field='',in_partition_field='',in_partition='',in_efr_bmap_field='',in_efr_bmap='') := MACRO
indexOutputRecord := RECORD(uber_rec_type)
  UNSIGNED1 Weight;
	END;
#UNIQUENAME(into)
indexOutputRecord %into%(Key le,UNSIGNED2 s) := TRANSFORM
  SELF.Weight := (s+50) / 100;
  SELF := le;
  END;	
doIndexRead(UNSIGNED4 id,UNSIGNED2 fld,UNSIGNED2 spc) := STEPPED( PROJECT( key( word_id = id, field=fld 
#IF ( #TEXT(in_dt_first_field) <> '' AND #TEXT(in_dt_last_field) <> '' AND #TEXT(in_inc_dt_last_field) = '')
 ,((asofdate >= in_dt_first_field OR in_dt_first_field = 0) AND (asofdate <= in_dt_last_field OR in_dt_last_field = 0))
#END	
#IF ( #TEXT(in_dt_first_field) <> '' AND #TEXT(in_dt_last_field) <> '' AND #TEXT(in_inc_dt_last_field) <> '')
 ,((asofdate >= in_dt_first_field OR in_dt_first_field = 0) AND (asofdate <= in_dt_last_field OR in_dt_last_field = 0 OR IsIncremental) )
#END	
#IF ( #TEXT(in_partition_field) <> '' )
 , in_partition_field = in_partition OR in_partition_field = ''
#END	
#IF ( #TEXT(in_efr_bmap_field) <> '' )
 ,( in_efr_bmap=0 OR (in_efr_bmap_field & (UNSIGNED4)in_efr_bmap) >0 )
#END	
), %into%(LEFT,spc)), uid, PRIORITY(4000-spc));
doJoin(SET OF DATASET(indexOutputRecord) inputs) := FUNCTION
    indexOutputRecord createMatchRecord(indexOutputRecord firstMatch, DATASET(indexOutputRecord) allMatches) := TRANSFORM
		//eliminate poisoned uids
#UNIQUENAME(poisoned_matches)
#UNIQUENAME(good_matches)
#UNIQUENAME(no_dups)
#IF ( #TEXT(in_inc_dt_last_field) <> '' )
		    %poisoned_matches% := allmatches(IsIncremental=TRUE AND in_inc_dt_last_field<>0);          
				%good_matches% := JOIN(allmatches,%poisoned_matches%,LEFT.uid=RIGHT.uid,LEFT ONLY);
#ELSE
				%good_matches% := allmatches;
#END
#IF ( (#TEXT(in_dt_first_field) <> '' AND #TEXT(in_dt_last_field) <> '') OR #TEXT(in_inc_dt_last_field) <> ''OR #TEXT(in_partition_field) <> '' OR #TEXT(in_efr_bmap_field) <> '' )
		    %no_dups% := DEDUP(GROUP(%good_matches%,field),field);
#ELSE
				%no_dups% := allmatches;
#END				
		    SELF.weight := SUM(%no_dups%,weight);
        SELF := firstMatch;
    END;
    RETURN JOIN(inputs, STEPPED(LEFT.uid = RIGHT.uid), createMatchRecord(LEFT, ROWS(LEFT)), SORTED(uid));
END;
#uniquename(r)
%r% := RECORDOF(wds);
doAction(SET OF DATASET(indexOutputRecord) allInputs, DATASET(%r%) words, INTEGER stage) := FUNCTION
    numWords := COUNT(words);
    sillyIntegerDs := NORMALIZE(DATASET([0],{INTEGER x}), numWords, TRANSFORM({INTEGER x}, SELF.x := COUNTER));
    sillyIntegerSet := SET(sillyIntegerDs, x);
	wordInputs := RANGE(allInputs, sillyIntegerSet);		// allInputs[1..count(words)]
    result := IF (stage <= numWords,
					doIndexRead(words[noboundcheck stage].word_id,words[noboundcheck stage].field,words[noboundcheck stage].uid),
					doJoin(RANGE(allInputs, sillyIntegerSet)));
	return result;
END;
nullInput := DATASET([], indexOutputRecord);
s := GRAPH(nullInput, COUNT(wds)+1, doAction(ROWSET(LEFT), wds, COUNTER), PARALLEL);
ENDMACRO;
