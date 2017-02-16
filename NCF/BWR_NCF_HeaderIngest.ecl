// Spray Header Name Address Data and Match with TIP file in the next step & then create the Header Input file for the process - As all the header records wont make it to TIP output
// Follow the STEPS in sequence 

// ****** RUN ONLY STEP 1 *************** As we want to retain all header records with out TIP Match too. STEP & STEP 3 are coded and NOW OBSELETE as shewjen wants to have all the RECORDS

// STEP 1
NCF.Spray_Header_Name_Address; //W20160805-150710

// STEP 2 - As per Shewjen, we need to have all the records. So no need to exclude any of them.
// BWR for Matching TIP Input Data to Header Input Data - W20160803-095815 - Out Of 2498413(Header records) Only 2409218 got the Match, So drop the Rest
/* NCF.Files.Tip_Input_Data;
   NCF.Files.Header_Input_Data;
   COUNT(NCF.Files.Tip_Input_Data);
   COUNT(NCF.Files.Header_Input_Data);
   Unique_Record := DEDUP(SORT(DISTRIBUTE(NCF.Files.Tip_Input_Data, HASH32(InputFile[9..18])), InputFile[9..18], LOCAL), InputFile[9..18], LOCAL);
   COUNT(Unique_Record);
   COUNT(JOIN(NCF.Files.Header_Input_Data, Unique_Record, LEFT.Record_Number = RIGHT.InputFile[9..18]));
   COUNT(JOIN(NCF.Files.Header_Input_Data, Unique_Record, LEFT.Record_Number = RIGHT.InputFile[9..18], LEFT ONLY));
   COUNT(JOIN(NCF.Files.Header_Input_Data, Unique_Record, LEFT.Record_Number = RIGHT.InputFile[9..18], RIGHT ONLY));
*/

// STEP 3
// NCF.CreateHeaderInputByMatching; // W20160805-153408