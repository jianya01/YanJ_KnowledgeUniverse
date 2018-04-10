IMPORT STD, _Control;

Base_Layout:= RECORD
  unsigned8 s_did;
  string1 source_code_2;
  string12 ln_fares_id;
  string2 source_code;
  string20 lname;
  string20 fname;
  string10 prim_range;
  string2 predir;
  string28 prim_name;
  string4 suffix;
  string2 postdir;
  string8 sec_range;
  string2 st;
  string25 p_city_name;
  string5 zip;
  string5 county;
  string7 geo_blk;
  unsigned8 __internal_fpos__;
END;	

SourceCodeExpanded := RECORD
  Base_Layout;
  BOOLEAN PartyIsBuyerOrOwner;
	BOOLEAN PartyIsBorrower;
	BOOLEAN PartyIsSeller;
	BOOLEAN PartyIsCareOf;
	BOOLEAN OwnerAddress;
	BOOLEAN SellerAddress;
	BOOLEAN PropertyAddress;
	BOOLEAN BorrowerAddress;
END;

SourceCodeExpanded FillFields(Base_Layout l) := TRANSFORM
  SELF.PartyIsBuyerOrOwner := IF(STD.Str.ToUpperCase(l.source_code[1]) = 'O', TRUE, FALSE);
	SELF.PartyIsBorrower := IF(STD.Str.ToUpperCase(l.source_code[1]) = 'B', TRUE, FALSE);
	SELF.PartyIsSeller := IF(STD.Str.ToUpperCase(l.source_code[1]) = 'S', TRUE, FALSE);
	SELF.PartyIsCareOf := IF(STD.Str.ToUpperCase(l.source_code[1]) = 'C', TRUE, FALSE);
	SELF.OwnerAddress := IF(STD.Str.ToUpperCase(l.source_code[1]) = 'O', TRUE, FALSE);
	SELF.SellerAddress := IF(STD.Str.ToUpperCase(l.source_code[2]) = 'S', TRUE, FALSE);
	SELF.PropertyAddress := IF(STD.Str.ToUpperCase(l.source_code[2]) = 'P', TRUE, FALSE);
	SELF.BorrowerAddress := IF(STD.Str.ToUpperCase(l.source_code[2]) = 'B', TRUE, FALSE);
  SELF := l;
END;

File_Base := DATASET([], Base_Layout); // Currently we don't have the base file in the Vault, only the KEY file.  As such we can't rebuild this index in the Vault - setting the base dataset to blank

ds := PROJECT(INDEX(File_Base, 
							 {s_did, source_code_2},
							 {File_Base}, '~thor_data400::key::ln_propertyv2::fcra::qa::search.did'),FillFields(LEFT));

EXPORT SearchDID := IF(COUNT(_Control.FaresFilterSet) <= 0, ds,
							 JOIN(DISTRIBUTE(ds, HASH64(ln_fares_id)), DISTRIBUTE(_Control.FaresFilterSet, HASH64(LNFaresID)), LEFT.ln_fares_id = RIGHT.LNFaresID, TRANSFORM(LEFT), LOCAL));