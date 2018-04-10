IMPORT STD, _Control;

Base_Layout:= RECORD
  string28 prim_name;
  string10 prim_range;
  string5 zip;
  string2 predir;
  string2 postdir;
  string4 suffix;
  string8 sec_range;
  string1 source_code_2;
  boolean ln_owner;
  boolean owner;
  boolean nofares_owner;
  string1 source_code_1;
  string12 ln_fares_id;
  string20 lname;
  string20 fname;
  string5 name_suffix;
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
  SELF.PartyIsBuyerOrOwner := IF(STD.Str.ToUpperCase(l.source_code_1) = 'O', TRUE, FALSE);
	SELF.PartyIsBorrower := IF(STD.Str.ToUpperCase(l.source_code_1) = 'B', TRUE, FALSE);
	SELF.PartyIsSeller := IF(STD.Str.ToUpperCase(l.source_code_1) = 'S', TRUE, FALSE);
	SELF.PartyIsCareOf := IF(STD.Str.ToUpperCase(l.source_code_1) = 'C', TRUE, FALSE);
	SELF.OwnerAddress := IF(STD.Str.ToUpperCase(l.source_code_1) = 'O', TRUE, FALSE);
	SELF.SellerAddress := IF(STD.Str.ToUpperCase(l.source_code_2) = 'S', TRUE, FALSE);
	SELF.PropertyAddress := IF(STD.Str.ToUpperCase(l.source_code_2) = 'P', TRUE, FALSE);
	SELF.BorrowerAddress := IF(STD.Str.ToUpperCase(l.source_code_2) = 'B', TRUE, FALSE);
  SELF := l;
END;


File_Base := DATASET([], Base_Layout); // Currently we don't have the base file in the Vault, only the KEY file.  As such we can't rebuild this index in the Vault - setting the base dataset to blank

ds := PROJECT(INDEX(File_Base, 
							 {prim_name, prim_range, zip, predir, postdir, suffix, sec_range, source_code_2, ln_owner, owner, nofares_owner, source_code_1},
							 {File_Base}, '~thor_data400::key::ln_propertyv2::fcra::qa::addr_search.fid'),FillFields(LEFT));

EXPORT AddressSearchFID := IF(COUNT(_Control.FaresFilterSet) <= 0, ds,
							 JOIN(DISTRIBUTE(ds, HASH64(ln_fares_id)), DISTRIBUTE(_Control.FaresFilterSet, HASH64(LNFaresID)), LEFT.ln_fares_id = RIGHT.LNFaresID, TRANSFORM(LEFT), LOCAL));