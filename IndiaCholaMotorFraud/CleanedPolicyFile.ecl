IMPORT STD, IndiaCholaMotorFraud;


STRING8 ParseDateFields(STRING4 Year, STRING2 Month, STRING2 Day) := INTFORMAT((INTEGER)Year, 4, 1) + INTFORMAT((INTEGER)Month, 2, 1) + INTFORMAT((INTEGER)Day, 2, 1);

EXPORT CleanedPolicyFile := PROJECT(IndiaCholaMotorFraud.PolicyFile, TRANSFORM({RECORDOF(LEFT)},
       SELF.policystartdate := ParseDateFields(LEFT.policystartyear, LEFT.policystartmonth, LEFT.policystartday);
							SELF.policyenddate   := ParseDateFields(LEFT.policyendyear, LEFT.policyendmonth, LEFT.policyendday);
       SELF.breakininspectiondate := ParseDateFields(LEFT.breakininspectionyear, LEFT.breakininspectionmonth, LEFT.breakininspectionday);
       // Just keep duplicating the above lines for each DATE you wish to parse together.  If there is no corresponding SELF.*date field already in your file layout, you can add a simple , STRING8 fieldNamedate inside of the { } following RECORDOF(LEFT) – for example {RECORDOF(LEFT), STRING8 BrandNewDate}
       SELF := LEFT));