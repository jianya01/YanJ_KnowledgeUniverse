HouseholdLayout :=
record
	unsigned6 hhid_relat;
	unsigned1 ver;
	unsigned6 did;
end;
BlankDataset := dataset([], HouseholdLayout);
EXPORT Key_HHID_Did := index(
	BlankDataset,	{hhid_relat, ver}, {BlankDataset},
	'~thor_data400::key::hhid_did_qa');