﻿EXPORT Mac_Field_To_UberStream(fld,fieldno,k,os) := MACRO
#uniquename(kr)
%kr% := k(word=(SALT34.StrType)fld)[1];
#uniquename(d)
%d% := DATASET([{%kr%.id,fieldno,(UNSIGNED)(%kr%.field_specificity*100)}],SALT34.layout_uber_record0);
os := IF ( fld = (TYPEOF(fld))'',DATASET([],SALT34.layout_uber_record0),%d% );
ENDMACRO;
