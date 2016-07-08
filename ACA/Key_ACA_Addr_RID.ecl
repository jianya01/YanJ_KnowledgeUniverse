IMPORT ACA;

// Due to a KEL language limitation need to temporarily add a unique identifier to the file.  This little ECL snippet can hopefully go away in the future.
EXPORT Key_ACA_Addr_RID := PROJECT(ACA.Key_ACA_Addr, TRANSFORM({RECORDOF(LEFT), UNSIGNED8 UniqueID}, SELF.UniqueID := COUNTER; SELF := LEFT));