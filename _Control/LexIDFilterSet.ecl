//EXPORT LexIDFilterSet := DATASET([], {UNSIGNED8 LexID}); // Include every single LexID in the base files (Full File Runs)
// EXPORT LexIDFilterSet := DATASET('~bpahl::suspect_addr::filterLexIDs', {UNSIGNED8 LexID}, THOR, __COMPRESSED__); // Grab a set of LexID's from a file (Filtered File Runs)
 EXPORT LexIDFilterSet := NORMALIZE(DATASET([0], {UNSIGNED8 LexID}), /*NumberOfLexIDs*/500, TRANSFORM({UNSIGNED8 LexID}, SELF.LexID := COUNTER + (/*StartingNumber*/1 - 1))); // Set up a range of LexID's to filter by (Filtered File Runs)
// EXPORT LexIDFilterSet := DATASET([3815228, 14026833], {UNSIGNED8 LexID}); // Filter the base files to only keep the records which have a LexID in this set (Filtered File Runs)
