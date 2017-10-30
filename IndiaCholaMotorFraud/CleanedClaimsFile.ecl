//EXPORT CleanedClaimsFile := 'todo';

IMPORT STD, IndiaCholaMotorFraud;


LossDescWordsPriority3 := ['DOG', 'DOGS', 'DEG', 'DAG', 'GLASS', 'GLASSES', 'GALSS', 'GLAS', 'GLASSS', 'GLOSS', 'GLSS', 'GLAASS', 'GALASS', 'GALLS', 'GALS', 'GLAAS', 'STONE', 'STONES', 'STONED', 'STON', 'STOEN', 'SOTNE', 'STOME', 'STIONE', 'STOONE', 'STONNE', 'SITONE', 'STAONE', 'WINDSHIELD', 'WINDSHEILD', 'WINDSHILD', 'WINDSHILED', 'WHINDSHILD', 'WINDHSIELD', 'WINDHSILED', 'WINDSHELD', 'WINDHSILD', 'WINDSHIILD', 'WINDSHEEILD', 'WIWNDSHILD', 'WHINDSHIELD', 'WINDHISLD', 'WINDHSEILD', 'WINDSHELID', 'WINDSHLED', 'WINDSIELD', 'WHINDSHILED', 'WINDHSHEILD', 'WINDHSHIELD', 'WINDHSHILD', 'WINDSHEELD', 'WINDSHEILED', 'WINDSHIELED', 'WINDSHILOED', 'WINDSHLD', 'WINDSILD', 'WONDSHIELD', 'HIT', 'ANIMAL'];
LossDescWordsPriority2 := ['DITCH', 'DITCHED', 'DITICH', 'DUTCH', 'DRIVER', 'DRIVERS', 'DIRVER', 'DRIEVR', 'DRUVER', 'DRVIER', 'MISBALANCE', 'MISBALNACE', 'MISBALNCE', 'MISBALANACE', 'MISBLANCE', 'MISABALANCE', 'MISBALANCEW', 'MISSBALANCE', 'UNBALANCE', 'UNBAL', 'UNBALLANCE', 'UNBALE', 'UNBLANCE', 'UNBALNCE', 'UNABALANCE', 'UNABALNCE', 'UNABLANCE', 'UNBALANACE', 'UNBALAMCE', 'UNBAALANCE', 'UNBLANACE', 'WALL', 'MISBALANCE', '_INSURED_VEHICLE_', 'FULL', 'DAMAGE'];
LossDescWordsPriority1 := ['FIRE', 'FIRED', 'FIRING', 'FIER', 'FIRE', 'FIRED', 'FIRING', 'FIERD', 'FAIRED', 'FIERED', 'FRIED'];

ClaimsFileWithBinValue := PROJECT(DEDUP(SORT(IndiaCholaMotorFraud.ClaimsFile, generatedkey, insurerirdacode, -sequenceid), generatedkey, insurerirdacode), TRANSFORM({RECORDOF(LEFT), UNSIGNED1 LossDescriptionBinValue},
                            LossDescriptionDataset := DATASET([STD.Str.SplitWords(LEFT.lossdescription, ' ')], {STRING Word});
														SELF.LossDescriptionBinValue := MAP(COUNT(LossDescriptionDataset(Word IN LossDescWordsPriority1)) > 0 => 1,
                                                              COUNT(LossDescriptionDataset(Word IN LossDescWordsPriority2)) > 0 => 2, 
																															COUNT(LossDescriptionDataset(Word IN LossDescWordsPriority3)) > 0 => 3, 
																																							99);
                                                                                SELF := LEFT));                                                                                                                                                      
																																											


STRING8 ParseDateFields(STRING4 Year, STRING2 Month, STRING2 Day) := INTFORMAT((INTEGER)Year, 4, 1) + INTFORMAT((INTEGER)Month, 2, 1) + INTFORMAT((INTEGER)Day, 2, 1);

EXPORT CleanedClaimsFile := PROJECT(ClaimsFileWithBinValue, TRANSFORM({RECORDOF(LEFT), STRING8 AccidentDate},
       SELF.claimintimationdate := ParseDateFields(LEFT.claimintimation_year, LEFT.claimintimation_mon, LEFT.claimintimation_day);
       SELF.AccidentDate := ParseDateFields(LEFT.accident_year, LEFT.accident_mon, LEFT.accident_day);
       //Just keep duplicating the above lines for each DATE you wish to parse together.  If there is no corresponding SELF.*date field already in your file layout, you can add a simple , STRING8 fieldNamedate inside of the { } following RECORDOF(LEFT) – for example {RECORDOF(LEFT), STRING8 BrandNewDate}
       SELF := LEFT));
