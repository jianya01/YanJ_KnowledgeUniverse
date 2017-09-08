﻿EXPORT MAC_WordBag_AppendSpecs_Rx(instring,keyname,keyfield,o) := MACRO
#UNIQUENAME(r)
%r% := RECORD
  UNSIGNED2 pos;
  SALT38.Str4000Type s;
  END;
	
#UNIQUENAME(d)
%d% := DATASET([{SALT38.WordCount(instring),instring}],%r%);
	
#UNIQUENAME(tr)
%r% %tr%(%r% s_in, UNSIGNED2 c) := TRANSFORM
  SELF.pos := c;
	SELF.s := SALT38.GetNthWord(s_in.s,c);
  END;
	
#UNIQUENAME(n)
%n% := NORMALIZE(	%d%, LEFT.pos, %tr%(LEFT,COUNTER) );
#UNIQUENAME(r2)
%r2% := RECORD(%r%)
  INTEGER2 spec;
	END;
	
#UNIQUENAME(tr2)
%r2% %tr2%(%n% le, keyname ri) := TRANSFORM
	sLen := LENGTH(TRIM(le.s));
  SELF.spec := IF(TRIM(ri.keyfield) > '', ri.field_specificity, IF(sLen < 4, 3*sLen, 10));
  SELF := le;
  END;	
#UNIQUENAME(j)
%j% := JOIN( %n%, keyname, LEFT.s = RIGHT.keyfield, %tr2%(LEFT,RIGHT), LEFT OUTER, LIMIT(SALT38._Config.Constants.JoinLimit) );
#UNIQUENAME(bse)
%bse% := DATASET([{0,(SALT38.StrType)(100*SUM(%j%,spec))}],%r%);
//%bse% := dataset([{0,(SALT38.StrType) 0}],%r%);
#UNIQUENAME(addw)
%r% %addw%(%r% le, %r2% ri) := TRANSFORM
  SELF.s := TRIM(le.s)+' '+TRIM(ri.s)+' '+(SALT38.StrType)ri.spec;
  SELF := le;
  END;
SALT38.StrType o := IF ( instring='','',TRIM(DENORMALIZE(%bse%,SORT(%j%,pos),TRUE,%addw%(LEFT,RIGHT),ALL)[1].s) );
  ENDMACRO;
