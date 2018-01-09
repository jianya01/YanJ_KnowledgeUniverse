LayoutSegment := RECORD
	string10 segmentid;
	string50 segmentdesc;
	string10 entitytype;
END;


fileName := '~thor::base::health::brazil::test::full::version::qa::segmentmaster';
EXPORT SegmentMaster := DATASET(fileName, LayoutSegment, THOR);