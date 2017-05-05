﻿EXPORT MAC_Specificity_Values(values_file,infield,fieldname,field_level_specificity,o) := MACRO
#uniquename(Value_Specificity_Layout)
%Value_Specificity_Layout% := RECORD
SALT37.StrType val;
UNSIGNED8 cnt;
REAL8 specificity;
END;
#uniquename(intoval)
%Value_Specificity_Layout% %intoval%(values_file le) := TRANSFORM
                        SELF.val := (SALT37.StrType)le.infield;
                        SELF.cnt := le.cnt;
                        SELF.specificity := le.field_specificity;
  END;
#uniquename(ResultLine_Layout)
%ResultLine_Layout% := RECORD
SALT37.StrType field_name;               
REAL8 field_specificity;
DATASET(%Value_Specificity_Layout%) value_specificities;
END;
#uniquename(vls)
// Create examples of highest and lowest specificity values
%vls% := PROJECT ( TOPN (values_file,SALT37.Config.Specificity_Profile_MaxExamples,-field_specificity),%intoval%(LEFT) ) +
         SORT ( PROJECT ( TOPN (values_file,SALT37.Config.Specificity_Profile_MaxExamples,field_specificity),%intoval%(LEFT) ),cnt );
EXPORT o := DATASET( [{fieldname,field_level_specificity,GLOBAL(%vls%,FEW)}], %ResultLine_Layout% );
  ENDMACRO;
