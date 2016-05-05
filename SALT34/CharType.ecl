IMPORT SALT34;
EXPORT CharType := 
#if (SALT34.UnicodeCfg.UseUnicode)
UNICODE1
#else
STRING1
#end
;
