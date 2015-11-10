// This code is an example of how to "slim down" an attributes file to make development run more quickly

#workunit('name', 'Slim Black Box File');

IMPORT KELBlackBox;

// Specifically this code is slimming down the MarketView attributes file into something more managable on hthor


// Step 1.) Define the file layout
LayoutBlackBoxFile := RECORD
  unsigned4 date_first_seen;
  unsigned4 date_last_seen;
  string1 active_flag;
  unsigned8 rid;
  unsigned4 build_period;
  unsigned2 lexidrank;
  string1 relexid_flag;
  string3 ace_county;
  string2 ace_postdir;
END;

// Step 2.) Read in the full file
FullRecords := DATASET(KELBlackBox.FileBlackBoxLocation + 'thor::base::cdw::prod::blackboxfile', LayoutBlackBoxFile, THOR);

// Step 3.) Slim it down using whatever selection criteria you want - in this case we are picking out LexID's between 1 and 10,001 to keep around since that is how we also slimmed the RiskView file
SlimmedRecords := FullRecords ((INTEGER)LexID BETWEEN 1 AND 10001);

// Step 4.) Output your slimmed down file to THOR
OUTPUT(SlimmedRecords,, '~bpahl::base::cdw::prod::blackboxfile', THOR, OVERWRITE);