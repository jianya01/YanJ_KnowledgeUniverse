#workunit('name', 'Building Base Persist Files');
#option('expandSelectCreateRow', true); // Added to improve overall compile time

IMPORT KELBlackBox, KELGlobal, Utilities;

TodaysDate := (INTEGER)Utilities.GetDate;

// List of Entities that need to be built
BuildPersonEntity := KELGlobal.Q_All_Person_Entity_Data(TodaysDate).Res0;

// List of Associations that need to be built
BuildFirstDegreeAssociationsEntity := KELGlobal.Q_All_First_Degree_Relatives_And_Associates.Res0;

// Outputs that ensure the Persist was actually built properly
OUTPUT(COUNT(BuildPersonEntity), NAMED('Total_PersonEntity'));
OUTPUT(CHOOSEN(BuildPersonEntity, 2), NAMED('Sample_PersonEntity'));

OUTPUT(COUNT(BuildFirstDegreeAssociationsEntity), NAMED('Total_FirstDegreeAssociationsEntity'));
OUTPUT(CHOOSEN(BuildFirstDegreeAssociationsEntity, 2), NAMED('Sample_FirstDegreeAssociationsEntity'));