IMPORT _Control;

LayoutUD := RECORD
  string5 insurerirdacode;
  string55 generatedkey;
  string2 claimtype;
  string med_user_def_01;
  string med_user_def_02;
  string med_user_def_03;
  string med_user_def_04;
  string med_user_def_05;
  string med_user_def_06;
  string med_user_def_07;
  string med_user_def_08;
  string med_user_def_09;
  string med_user_def_10;
  string pat_latest_update_date;
  string pat_user_def_01;
  string pat_user_def_02;
  string pat_user_def_03;
  string pat_user_def_04;
  string pat_user_def_05;
  string pat_user_def_06;
  string pat_user_def_07;
  string pat_user_def_08;
  string pat_user_def_09;
  string pat_user_def_10;
  string prov_latest_update_date;
  string prov_user_def_01;
  string prov_user_def_02;
  string prov_user_def_03;
  string prov_user_def_04;
  string prov_user_def_05;
  string prov_user_def_06;
  string prov_user_def_07;
  string prov_user_def_08;
  string prov_user_def_09;
 END;


fileName := '~thor::base::health::brazil::test::full::version::20170802::miscellaneous';
EXPORT UserDefinitions := IF(COUNT(_Control.GeneratedKeyFilterSet) <= 0, 
	DATASET(fileName, LayoutUD, THOR),
	DATASET(fileName, LayoutUD, THOR) (generatedkey IN _Control.GeneratedKeyFilterSet));
// EXPORT LineItemPorto := IF(COUNT(_Control.GeneratedKeyFilterSet) <= 0, 
	// DATASET(fileName, LayoutLine, THOR),
	// JOIN(DATASET(fileName, LayoutLine, THOR), _Control.GeneratedKeyFilterSet, LEFT.insurerirdacode = RIGHT.insurerirdacode AND LEFT.generatedkey = RIGHT.generatedkey AND LEFT.claimtype = RIGHT.claimtype, transform(LayoutLine,self:=left)));