num_Subject := 1;
num_Husband := 2;
num_Wife  := 3;
num_Spouse := 4;
set_Spouse := [num_Husband, num_Wife, num_Spouse];
num_ExHusband := 5;
num_ExWife := 6;
num_ExSpouse := 7;
set_ExSpouse := [num_ExHusband, num_ExWife, num_ExSpouse];
num_widow := 8;
num_widower := 9;
num_Father  := 10;
num_Mother  := 11;
set_SpecificParent := [num_Father, num_Mother];
num_Parent  := 12;
num_Grandfather  := 13;
num_Grandmother  := 14;
num_Grandparent  := 15;
num_Brother  := 16;
num_Sister  := 17;
num_Sibling  := 18;
num_Son := 19;
num_Daughter := 20;
num_Child := 21;
num_Grandson  := 22;
num_Granddaughter  := 23;
num_Gradchild  := 24;
num_Inlaw  := 25;
num_SisterInlaw := 26;
num_BrotherInlaw := 27;
num_SiblingInlaw := 28;
num_MotherInlaw := 29;
num_FatherInlaw := 30;
num_ParentInlaw := 31;
num_StepFather := 32;
num_StepMother := 33;
num_StepParent := 34;
num_StepBrother := 35;
num_StepSister := 36;
num_StepSibling := 37;
num_aunt := 38;
num_auncle := 39;
num_niece :=  40;
num_nephew := 41;
num_cousin := 42;
num_relative := 43;
num_associate := 44;
num_Neighbor := 45;
num_Business := 46;

set_Parent := [num_Father, num_Mother, num_Parent];
set_Sibling := [num_Brother, num_Sister, num_Sibling];	
set_Child := [num_Son, num_Daughter, num_Child];
set_FirstDegreeRelative := set_Spouse + set_Parent + set_Sibling + set_Child;

EXPORT getRelativeTitles(unsigned num_title) := FUNCTION
	str_title := map(num_title = num_Subject => 'Subject',
			num_title = num_Husband => 'Husband',
			num_title = num_Wife => 'Wife',
			num_title = num_Spouse => 'Spouse',
			num_title = num_ExHusband => 'Ex-Husband',
			num_title = num_ExWife => 'Ex-Wife',
			num_title = num_ExSpouse => 'Ex-Spouse',
			num_title = num_widow => 'Widow',
			num_title = num_widower => 'Widower',
			num_title = num_Father => 'Father',
			num_title = num_Mother => 'Mother',
			num_title = num_Parent => 'Parent',
			num_title = num_Grandfather => 'Grandfather',
			num_title = num_Grandmother => 'Grandmother',
			num_title = num_Grandparent => 'Grandparent',
			num_title = num_Brother => 'Brother',
			num_title = num_Sister => 'Sister',
			num_title = num_Sibling => 'Sibling',
			num_title = num_Son  => 'Son',
			num_title = num_Daughter => 'Daughter',
			num_title = num_Child => 'Child',
			num_title = num_Grandson => 'Grandson',
			num_title = num_Granddaughter => 'Granddaughter',
			num_title = num_Gradchild  => 'Grandchild',
			num_title = num_Inlaw  => 'In-law',
			num_title = num_SisterInlaw  => 'Sister-in-law',
			num_title = num_BrotherInlaw  => 'Brother-in-law',
			num_title = num_SiblingInlaw  => 'Sibling-in-law',
			num_title = num_MotherInlaw => 'Mother-in-law',
			num_title = num_FatherInlaw => 'Father-in-law',
			num_title = num_ParentInlaw  => 'Parent-in-law',
			num_title = num_StepFather => 'Stepfather',
			num_title = num_StepMother => 'Stepmother',
			num_title = num_StepParent  => 'Stepparent',
			num_title = num_StepBrother => 'Stepbrother',
			num_title = num_StepSister  => 'Stepsister',
			num_title = num_StepSibling   => 'Stepsibling',
			num_title = num_aunt => 'Aunt',
			num_title = num_auncle => 'Uncle',
			num_title = num_niece => 'Niece',
			num_title = num_nephew  => 'Nephew',
			num_title = num_cousin  => 'Cousin',
			num_title = num_relative  => 'Relative',
			num_title = num_associate  => 'Associate',
			num_title = num_Neighbor => 'Neighbor',
			num_title = num_Business  => 'Business',
			'Uncertain');
	RETURN str_title;
END;