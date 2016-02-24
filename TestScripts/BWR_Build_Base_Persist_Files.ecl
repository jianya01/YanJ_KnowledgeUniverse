#workunit('name', 'Building Base Persist Files');
#option('expandSelectCreateRow', true); // Added to improve overall compile time

IMPORT KELBlackBox, KELGlobal, Utilities;

// List of Entities that need to be built
BuildPersonEntity := KELGlobal.Q_Dump_All_Person_Data.Res0;

// List of Associations that need to be built
BuildFirstDegreeAssociationsEntity := KELGlobal.Q_Dump_All_First_Degree_Associations.Res0;

// Outputs that ensure the Persist was actually built properly
OUTPUT(COUNT(BuildPersonEntity), NAMED('Total_BuildPersonEntity'));
OUTPUT(CHOOSEN(BuildPersonEntity, 2), NAMED('Sample_BuildPersonEntity'));

OUTPUT(COUNT(BuildFirstDegreeAssociationsEntity), NAMED('Total_BuildFirstDegreeAssociationsEntity'));
OUTPUT(CHOOSEN(BuildFirstDegreeAssociationsEntity, 2), NAMED('Sample_BuildFirstDegreeAssociationsEntity'));