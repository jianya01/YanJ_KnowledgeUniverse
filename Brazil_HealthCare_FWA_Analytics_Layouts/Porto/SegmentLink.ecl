LayoutSegmentLink := RECORD
	string50 providerkey,
	string10 segmentid;
	string10 entitytype;
END;


fileName := '~thor::base::health::brazil::test::full::version::qa::segmentlink';
EXPORT SegmentLink := DATASET(fileName, LayoutSegmentLink, THOR);