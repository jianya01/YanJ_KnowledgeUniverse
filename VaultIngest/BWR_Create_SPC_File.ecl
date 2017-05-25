#workunit('name', 'Generate_Default_SALT_SPC');
//Step 1: Add Module name to import
IMPORT SALT38, CCtlogPol;

//Step 2: Define Input file
InputFile := CCtlogPol.Source;
//Run SPC macro to generate the default specification
SALT38.MAC_Default_SPC(InputFile, generatedSALTSpecification);

FinalSALTSpecification := ROLLUP(generatedSALTSpecification, TRUE, TRANSFORM(RECORDOF(LEFT), SELF.s := LEFT.s + '\n' + RIGHT.s));

OUTPUT(generatedSALTSpecification, NAMED('Multi_Line_Default_SPC'));
OUTPUT(FinalSALTSpecification, NAMED('Single_Line_Default_SPC'));

/* Use the following to add in generated spc - example shown with I_CDSCProp_InqHist
   
   OPTIONS:-gn
   MODULE:I_CDSCProp_InqHist
   FILENAME:Vault 
   INGESTFILE:IQHS:NAMED(Source) 
   RIDFIELD:vault_rid
   INGESTSTATUS:vault_record_status
   
   FIELD:vault_date_first_seen:RECORDDATE(FIRST):
   FIELD:vault_date_last_seen:RECORDDATE(LAST):
*/