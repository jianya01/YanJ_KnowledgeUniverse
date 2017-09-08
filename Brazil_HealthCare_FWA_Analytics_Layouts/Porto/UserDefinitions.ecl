IMPORT _Control;

LayoutUD := RECORD
  string5 insureruniqueid;
  string200 generatedkey;
  string2 claimtype;
  string5 customernumber;
  string9 batch_no;
  unsigned8 loaddatetime;
  unsigned8 rec_seq_no;
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

fileName := '~thor::base::health::brazil::test::full::version::20170807::miscellaneous';
EXPORT UserDefinitions := IF(COUNT(_Control.GeneratedKeyFilterSet) <= 0, 
	DATASET(fileName, LayoutUD, THOR),
	JOIN(DISTRIBUTE(DATASET(fileName, LayoutUD, THOR), HASH64(generatedkey)), DISTRIBUTE(_Control.GeneratedKeyFilterSet(generatedkey != ''), HASH64(generatedkey)), LEFT.generatedkey = RIGHT.generatedkey, TRANSFORM(LEFT), LOCAL));