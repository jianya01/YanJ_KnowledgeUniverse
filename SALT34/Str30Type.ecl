IMPORT SALT34;
EXPORT Str30Type := 
#if (SALT34.UnicodeCfg.UseUnicode)
UNICODE30
#else
STRING30
#end
;
