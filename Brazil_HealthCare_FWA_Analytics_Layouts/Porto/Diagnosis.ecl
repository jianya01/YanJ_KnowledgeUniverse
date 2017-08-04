IMPORT _Control;

diagnosistype_rec := RECORD
   string2 source;
   string20 diagnosiscode;
   string2 codetype;
   string300 description;
  END;

proceduretype_rec := RECORD
   string2 source;
   string50 procedurecode;
   string10 procedurecodetype;
   string300 description;
  END;

ndcdetails_rec := RECORD
   string11 code;
   string6 quantity;
   string2 unitsofmeasure;
  END;

treatmentdetails_rec := RECORD
   string treatmenttype;
   string surgerytype;
   string medicinesystem;
   string treatmentgiven;
  END;

illnessdetails_rec := RECORD
   string diseasefirstdetecteddate;
   string firstconsultationdate;
   string500 presentcomplaints;
   string3 presentailmentduration;
   string1 pedcomplicationindicator;
   string500 pedcomplicationdetails;
   string1 prevsurgerycomplicationindicator;
   string1 alcoholconsumptionindicator;
   string1 congenitaldiseaseindicator;
   string1000 medicalhistory;
  END;

maternitydetails_rec := RECORD
   string8 deliverydate;
   string1 prematurebabyindicator;
  END;

injurydetails_rec := RECORD
   string8 injurydate;
   string50 injurycause;
   string300 injurycausedescription;
   string1 medicolegalindicator;
  END;

addresslayout := RECORD
   string20 countryname;
   string20 statename;
   string25 cityname;
   string25 homecitycode;
   string128 address;
   string128 addresscomplementary;
   string5 homenumber;
   string10 zipcode;
  END;

LayoutDiagnosis := RECORD
  string5 insurerirdacode;
  string55 generatedkey;
  string2 claimtype;
  DATASET(diagnosistype_rec) diagnosistype;
  DATASET(proceduretype_rec) proceduretype;
  DATASET(ndcdetails_rec) ndcdetails;
  DATASET(treatmentdetails_rec) treatmentdetails;
  string hospitalizationtype;
  DATASET(illnessdetails_rec) illnessdetails;
  string1 hospitalizationduetomaternityindicator;
  DATASET(maternitydetails_rec) maternitydetails;
  string1 hospitalizationduetoinjuryindicator;
  DATASET(injurydetails_rec) injurytype;
  addresslayout address;
  string patientreasonforvisitdiagnosiscode;
  string placeofservice;
  string unitofservicetype;
  string unitsofservice;
  string unitsofserviceallowed;
  string typeofservice;
  string icdversionindicator;
  string principaldiagnosiscode;
  string admissiondiagnosiscode;
  string principalprocedurecode;
 END;

fileName := '~thor::base::health::brazil::test::full::version::20170802::diagnosisdetails';//~thor::base::global::health::brazil::test::full::20170721::diagnosisdetails'; //testdata - thor::base::global::health::brazil::201770606::diagnosisdetails
EXPORT Diagnosis := IF(COUNT(_Control.GeneratedKeyFilterSet) <= 0, 
	DATASET(fileName, LayoutDiagnosis, THOR),
	DATASET(fileName, LayoutDiagnosis, THOR) (generatedkey IN _Control.GeneratedKeyFilterSet));

// EXPORT DiagnosisPorto := IF(COUNT(_Control.GeneratedKeyFilterSet) <= 0, 
	// DATASET(fileName, LayoutDiagnosis, THOR),
	// JOIN(DATASET(fileName, LayoutDiagnosis, THOR), _Control.GeneratedKeyFilterSet, LEFT.insurerirdacode = RIGHT.insurerirdacode AND LEFT.generatedkey = RIGHT.generatedkey AND LEFT.claimtype = RIGHT.claimtype, transform(LayoutDiagnosis,self:=left)));