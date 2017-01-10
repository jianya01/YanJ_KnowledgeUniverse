#workunit('name', 'Sample_NCF_Files');

IMPORT NCF;

eyeball := 250;

NCFReport := DATASET([{'0052236523', 100000216429}], {STRING ReferenceNumber, UNSIGNED6 LexID}); 

Header_Data := NCF.FilesCleaned.Header_Data (ReferenceNumber IN SET(NCFReport, ReferenceNumber));
OUTPUT(CHOOSEN(Header_Data, eyeball), NAMED('Header_Data'));

Collection_Data := NCF.FilesCleaned.Collection_Data (ReferenceNumber IN SET(NCFReport, ReferenceNumber));
OUTPUT(CHOOSEN(Collection_Data, eyeball), NAMED('Collection_Data'));

Inquiry_Data := NCF.FilesCleaned.Inquiry_Data (ReferenceNumber IN SET(NCFReport, ReferenceNumber));
OUTPUT(CHOOSEN(Inquiry_Data, eyeball), NAMED('Inquiry_Data'));

PublicRecord_Data := NCF.FilesCleaned.PublicRecord_Data (ReferenceNumber IN SET(NCFReport, ReferenceNumber));
OUTPUT(CHOOSEN(PublicRecord_Data, eyeball), NAMED('PublicRecord_Data'));

TradeTrended_Data := NCF.FilesCleaned.TradeTrended_Data (ReferenceNumber IN SET(NCFReport, ReferenceNumber));
OUTPUT(CHOOSEN(TradeTrended_Data, eyeball), NAMED('TradeTrended_Data'));