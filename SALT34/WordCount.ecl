IMPORT lib_unicodelib, ut, SALT34;
EXPORT UNSIGNED4 WordCount(SALT34.StrType s, STRING1 sep=' ') := 
#if (SALT34.UnicodeCfg.UseUnicode)
			unicodelib.UnicodeLocaleWordCount(s, SALT34.UnicodeCfg.LocaleName);
#else
			ut.NoWords(s, sep);
#end
;

