#workunit('name', 'Sample_Consumer_Credit_Files');

IMPORT Consumer_Credit;

eyeball := 250;

Address_Data := Consumer_Credit.FilesCleaned.Address_Data;
OUTPUT(CHOOSEN(Address_Data, eyeball), NAMED('Address_Data'));

Bankruptcy_Data := Consumer_Credit.FilesCleaned.Bankruptcy_Data;
OUTPUT(CHOOSEN(Bankruptcy_Data, eyeball), NAMED('Bankruptcy_Data'));

Collection_Data := Consumer_Credit.FilesCleaned.Collection_Data;
OUTPUT(CHOOSEN(Collection_Data, eyeball), NAMED('Collection_Data'));

CreditReportSummary_Data := Consumer_Credit.FilesCleaned.CreditReportSummary_Data;
OUTPUT(CHOOSEN(CreditReportSummary_Data, eyeball), NAMED('CreditReportSummary_Data'));

Employment_Data := Consumer_Credit.FilesCleaned.Employment_Data;
OUTPUT(CHOOSEN(Employment_Data, eyeball), NAMED('Employment_Data'));

Finance_Data := Consumer_Credit.FilesCleaned.Finance_Data;
OUTPUT(CHOOSEN(Finance_Data, eyeball), NAMED('Finance_Data'));

InquiryHistory_Data := Consumer_Credit.FilesCleaned.InquiryHistory_Data;
OUTPUT(CHOOSEN(InquiryHistory_Data, eyeball), NAMED('InquiryHistory_Data'));

Judgement_Data := Consumer_Credit.FilesCleaned.Judgement_Data;
OUTPUT(CHOOSEN(Judgement_Data, eyeball), NAMED('Judgement_Data'));

NarrativeA_Data := Consumer_Credit.FilesCleaned.NarrativeA_Data;
OUTPUT(CHOOSEN(NarrativeA_Data, eyeball), NAMED('NarrativeA_Data'));

Person_Data := Consumer_Credit.FilesCleaned.Person_Data;
OUTPUT(CHOOSEN(Person_Data, eyeball), NAMED('Person_Data'));

Report_Data := Consumer_Credit.FilesCleaned.Report_Data;
OUTPUT(CHOOSEN(Report_Data, eyeball), NAMED('Report_Data'));

ReportIdSupplement_Data := Consumer_Credit.FilesCleaned.ReportIdSupplement_Data;
OUTPUT(CHOOSEN(ReportIdSupplement_Data, eyeball), NAMED('ReportIdSupplement_Data'));

ReportRequest_Data := Consumer_Credit.FilesCleaned.ReportRequest_Data;
OUTPUT(CHOOSEN(ReportRequest_Data, eyeball), NAMED('ReportRequest_Data'));

TaxLien_Data := Consumer_Credit.FilesCleaned.TaxLien_Data;
OUTPUT(CHOOSEN(TaxLien_Data, eyeball), NAMED('TaxLien_Data'));

TradeLine_Data := Consumer_Credit.FilesCleaned.TradeLine_Data;
OUTPUT(CHOOSEN(TradeLine_Data, eyeball), NAMED('TradeLine_Data'));