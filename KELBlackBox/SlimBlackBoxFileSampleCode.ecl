// This code is an example of how to "slim down" an attributes file to make development run more quickly

#workunit('name', 'Slim Black Box File');

#option('minimizeSpillSize', true);
#option('outputLimit', 25);

IMPORT KELBlackBox;

// Step 1.) Define the file layout
LayoutLengthOfResidency := RECORD
  unsigned4 date_first_seen;
  unsigned4 date_last_seen;
  string1 active_flag;
  unsigned8 rid;
  unsigned8 lexid;
  unsigned2 length_of_residency;
  unsigned4 addr_dt_first_seen;
  unsigned4 addr_dt_last_seen;
 END;

// Step 2.) Read in the full file
FullRecords := DISTRIBUTE(PULL(DATASET(KELBlackBox.FileBlackBoxLocation + 'thor::base::ar::prod::length_of_residency', LayoutLengthOfResidency, THOR)), HASH64(LexID));

// Step 3.) Slim it down using whatever selection criteria you want - in this case we are picking out LexID's between 1 and 10,001 to keep around since that is how we also slimmed the RiskView file
SlimmedRecords := FullRecords ((INTEGER)LexID BETWEEN 1 AND 10001);

// Step 4.) Output your slimmed down file to THOR
OUTPUT(SlimmedRecords,, '~bpahl::ar::prod::length_of_residencyslim', THOR, OVERWRITE, __COMPRESSED__);