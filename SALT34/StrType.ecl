IMPORT SALT34;
EXPORT StrType := 
#if (SALT34.UnicodeCfg.UseUnicode)
UNICODE
#else
STRING
#end
;
