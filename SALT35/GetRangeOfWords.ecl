﻿IMPORT ut;
EXPORT STRING GetRangeOfWords(STRING s,INTEGER1 low, INTEGER1 high, STRING1 sep=' ') := 
#if (UnicodeCfg.UseUnicode AND UnicodeCfg.UseLocale)
			saltlib.UnicodeLocaleGetRangeOfWords(l, r, minlen, UnicodeCfg.LocaleName);
#elseif (UnicodeCfg.UseUnicode AND NOT UnicodeCfg.UseLocale)		
			saltlib.UnicodeGetRangeOfWords(l, r, minlen);
#else
			ut.Words(s,low,high,sep);
#end
