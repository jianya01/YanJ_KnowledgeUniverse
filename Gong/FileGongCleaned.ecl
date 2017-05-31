IMPORT Gong;

EXPORT FileGongCleaned := MODULE

	NewGongLayout := RECORD
		string1 listing_type;
		Gong.GongNuestarHistory.LayoutGongHistory;
	END;
	
	NewGongLayout CleanListingType(Gong.GongNuestarHistory.LayoutGongHistory l) := TRANSFORM
		SELF.listing_type := MAP(l.listing_type_bus = 'B' => 'B', l.listing_type_bus = 'D' => 'D', l.listing_type_res = 'R' => 'R', l.listing_type_res = 'a' => 'a', l.listing_type_res = 'G' => 'G', l.listing_type_res = 't' => 't', '');
		SELF := l;
	END;
	
	EXPORT GongCleaned := PROJECT(Gong.GongNuestarHistory.FileGongNuestarHistory, CleanListingType(LEFT));
	
	EXPORT NormalizedNotes := NORMALIZE(Gong.GongNuestarHistory.FileGongNuestarHistory, 2, TRANSFORM({STRING Phone10, INTEGER NoteCounter, STRING100 NoteInfo},
		SELF.Phone10 := LEFT.phone10;
		SELF.NoteCounter := COUNTER;
		SELF.NoteInfo := CASE(COUNTER,
			1 => LEFT.caption_text,
			2 => LEFT.see_also_text, '')));

END;