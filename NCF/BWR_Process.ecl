// Execute the STEPS in sequence depending on the need

// STEP 1
// To create the code for TR84MonthsPaymentHistory used in MockData Attribute - W20160803-173828
// NCF.MonthsPaymentHistory('');

// STEP 2
// Create Trade Trended Data that will be used in Mock data to create Trended Data as Child Records - W20160804-003003
// NCF.TradeTrended;

// STEP 3
// Create final mock data that will be used for the KEL process - W20160804-005940 & Header - W20160805-153624
// NCF.MockData;

// STEP 4 
// Create Trade Trended Data separately to match with SAS Trade Trend File - W20160809-155505
// NCF.Format_TradeTrended_For_TestInput_Compare;
 
// STEP 5 
//Run the following to generate the file used by KEL
// NCF.Format_TradeTrended_NormalizeData;