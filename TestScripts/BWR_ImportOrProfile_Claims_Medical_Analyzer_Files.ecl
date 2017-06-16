#workunit('name', 'Claims Medical Analyzer File Routines');
IMPORT ClaimsMedicalSolutions, Vault, SALTRoutines;

// ImportFiles := TRUE;
ImportFiles := FALSE;

#if(ImportFiles)
DS_BASE_CLAIM := ClaimsMedicalSolutions.Files.DS_BASE_CLAIM;
DS_BASE_PARTY := ClaimsMedicalSolutions.Files.DS_BASE_PARTY;
DS_BASE_NOTES := ClaimsMedicalSolutions.Files.DS_BASE_NOTES;
DS_BASE_PAYMENT := ClaimsMedicalSolutions.Files.DS_BASE_PAYMENT;
DS_BASE_SIUREFERRAL := ClaimsMedicalSolutions.Files.DS_BASE_SIUREFERRAL;
DS_BASE_SUBROGATION := ClaimsMedicalSolutions.Files.DS_BASE_SUBROGATION;
DS_BASE_POLICY := ClaimsMedicalSolutions.Files.DS_BASE_POLICY;
DS_BASE_CLAIMINVOLVEDUNIT := ClaimsMedicalSolutions.Files.DS_BASE_CLAIMINVOLVEDUNIT;
DS_BASE_RESERVES := ClaimsMedicalSolutions.Files.DS_BASE_RESERVES;
DS_BASE_MEDICALBILLS := ClaimsMedicalSolutions.Files.DS_BASE_MEDICALBILLS;
DS_BASE_PHARMACYBILLS := ClaimsMedicalSolutions.Files.DS_BASE_PHARMACYBILLS;
DS_BASE_MEDICALPROVIDERS := ClaimsMedicalSolutions.Files.DS_BASE_MEDICALPROVIDERS;
DS_BASE_PERSON := ClaimsMedicalSolutions.Files.DS_BASE_PERSON;
DS_BASE_VEHICLES := ClaimsMedicalSolutions.Files.DS_BASE_VEHICLES;
DS_BASE_POLICYHOLDERS := ClaimsMedicalSolutions.Files.DS_BASE_POLICYHOLDERS;

OUTPUT(DISTRIBUTE(DS_BASE_CLAIM, RANDOM()),, '~' + ClaimsMedicalSolutions.Files.FILE_BASE_CLAIM_SF[29..], THOR, __COMPRESSED__, OVERWRITE);
OUTPUT(DISTRIBUTE(DS_BASE_PARTY, RANDOM()),, '~' + ClaimsMedicalSolutions.Files.FILE_BASE_PARTY_SF[29..], THOR, __COMPRESSED__, OVERWRITE);
OUTPUT(DISTRIBUTE(DS_BASE_NOTES, RANDOM()),, '~' + ClaimsMedicalSolutions.Files.FILE_BASE_NOTES_SF[29..], THOR, __COMPRESSED__, OVERWRITE);
OUTPUT(DISTRIBUTE(DS_BASE_PAYMENT, RANDOM()),, '~' + ClaimsMedicalSolutions.Files.FILE_BASE_PAYMENT_SF[29..], THOR, __COMPRESSED__, OVERWRITE);
OUTPUT(DISTRIBUTE(DS_BASE_SIUREFERRAL, RANDOM()),, '~' + ClaimsMedicalSolutions.Files.FILE_BASE_SIUREFERRAL_SF[29..], THOR, __COMPRESSED__, OVERWRITE);
OUTPUT(DISTRIBUTE(DS_BASE_SUBROGATION, RANDOM()),, '~' + ClaimsMedicalSolutions.Files.FILE_BASE_SUBROGATION_SF[29..], THOR, __COMPRESSED__, OVERWRITE);
OUTPUT(DISTRIBUTE(DS_BASE_POLICY, RANDOM()),, '~' + ClaimsMedicalSolutions.Files.FILE_BASE_POLICY_SF[29..], THOR, __COMPRESSED__, OVERWRITE);
OUTPUT(DISTRIBUTE(DS_BASE_CLAIMINVOLVEDUNIT, RANDOM()),, '~' + ClaimsMedicalSolutions.Files.FILE_BASE_CLAIMINVOLVEDUNIT_SF[29..], THOR, __COMPRESSED__, OVERWRITE);
OUTPUT(DISTRIBUTE(DS_BASE_RESERVES, RANDOM()),, '~' + ClaimsMedicalSolutions.Files.FILE_BASE_RESERVES_SF[29..], THOR, __COMPRESSED__, OVERWRITE);
OUTPUT(DISTRIBUTE(DS_BASE_MEDICALBILLS, RANDOM()),, '~' + ClaimsMedicalSolutions.Files.FILE_BASE_MEDICALBILLS_SF[29..], THOR, __COMPRESSED__, OVERWRITE);
OUTPUT(DISTRIBUTE(DS_BASE_PHARMACYBILLS, RANDOM()),, '~' + ClaimsMedicalSolutions.Files.FILE_BASE_PHARMACYBILLS_SF[29..], THOR, __COMPRESSED__, OVERWRITE);
OUTPUT(DISTRIBUTE(DS_BASE_MEDICALPROVIDERS, RANDOM()),, '~' + ClaimsMedicalSolutions.Files.FILE_BASE_MEDICALPROVIDERS_SF[29..], THOR, __COMPRESSED__, OVERWRITE);
OUTPUT(DISTRIBUTE(DS_BASE_PERSON, RANDOM()),, '~' + ClaimsMedicalSolutions.Files.FILE_BASE_PERSON_SF[29..], THOR, __COMPRESSED__, OVERWRITE);
OUTPUT(DISTRIBUTE(DS_BASE_VEHICLES, RANDOM()),, '~' + ClaimsMedicalSolutions.Files.FILE_BASE_VEHICLES_SF[29..], THOR, __COMPRESSED__, OVERWRITE);
OUTPUT(DISTRIBUTE(DS_BASE_POLICYHOLDERS, RANDOM()),, '~' + ClaimsMedicalSolutions.Files.FILE_BASE_POLICYHOLDERS_SF[29..], THOR, __COMPRESSED__, OVERWRITE);
#else
DS_BASE_CLAIM := DATASET('~' + ClaimsMedicalSolutions.Files.FILE_BASE_CLAIM_SF[29..], ClaimsMedicalSolutions.Layouts.CLAIM_Rec_new, THOR, __COMPRESSED__);
DS_BASE_PARTY := DATASET('~' + ClaimsMedicalSolutions.Files.FILE_BASE_PARTY_SF[29..], ClaimsMedicalSolutions.Layouts.Parties_Rec_new, THOR, __COMPRESSED__);
DS_BASE_NOTES := DATASET('~' + ClaimsMedicalSolutions.Files.FILE_BASE_NOTES_SF[29..], ClaimsMedicalSolutions.Layouts.NOTES_Rec, THOR, __COMPRESSED__);
DS_BASE_PAYMENT := DATASET('~' + ClaimsMedicalSolutions.Files.FILE_BASE_PAYMENT_SF[29..], ClaimsMedicalSolutions.Layouts.PAYMENTS_Rec_new, THOR, __COMPRESSED__);
DS_BASE_SIUREFERRAL := DATASET('~' + ClaimsMedicalSolutions.Files.FILE_BASE_SIUREFERRAL_SF[29..], ClaimsMedicalSolutions.Layouts.SIUREFERRAL_Rec, THOR, __COMPRESSED__);
DS_BASE_SUBROGATION := DATASET('~' + ClaimsMedicalSolutions.Files.FILE_BASE_SUBROGATION_SF[29..], ClaimsMedicalSolutions.Layouts.SUBROGATIONS_Rec, THOR, __COMPRESSED__);
DS_BASE_POLICY := DATASET('~' + ClaimsMedicalSolutions.Files.FILE_BASE_POLICY_SF[29..], ClaimsMedicalSolutions.Layouts.POLICIES_Rec_new, THOR, __COMPRESSED__);
DS_BASE_CLAIMINVOLVEDUNIT := DATASET('~' + ClaimsMedicalSolutions.Files.FILE_BASE_CLAIMINVOLVEDUNIT_SF[29..], ClaimsMedicalSolutions.Layouts.CLAIMINVOLVEDUNIT_Rec_new, THOR, __COMPRESSED__);
DS_BASE_RESERVES := DATASET('~' + ClaimsMedicalSolutions.Files.FILE_BASE_RESERVES_SF[29..], ClaimsMedicalSolutions.Layouts.Reserve_Rec_new, THOR, __COMPRESSED__);
DS_BASE_MEDICALBILLS := DATASET('~' + ClaimsMedicalSolutions.Files.FILE_BASE_MEDICALBILLS_SF[29..], ClaimsMedicalSolutions.Layouts.MedicalBills_Rec_new, THOR, __COMPRESSED__);
DS_BASE_PHARMACYBILLS := DATASET('~' + ClaimsMedicalSolutions.Files.FILE_BASE_PHARMACYBILLS_SF[29..], ClaimsMedicalSolutions.Layouts.PharmacyBills_Rec, THOR, __COMPRESSED__);
DS_BASE_MEDICALPROVIDERS := DATASET('~' + ClaimsMedicalSolutions.Files.FILE_BASE_MEDICALPROVIDERS_SF[29..], ClaimsMedicalSolutions.Layouts.MedicalProviders_Rec, THOR, __COMPRESSED__);
DS_BASE_PERSON := DATASET('~' + ClaimsMedicalSolutions.Files.FILE_BASE_PERSON_SF[29..], ClaimsMedicalSolutions.Layouts.Person_header, THOR, __COMPRESSED__);
DS_BASE_VEHICLES := DATASET('~' + ClaimsMedicalSolutions.Files.FILE_BASE_VEHICLES_SF[29..], ClaimsMedicalSolutions.Layouts.Vehicle_Rec_new, THOR, __COMPRESSED__);
DS_BASE_POLICYHOLDERS := DATASET('~' + ClaimsMedicalSolutions.Files.FILE_BASE_POLICYHOLDERS_SF[29..], ClaimsMedicalSolutions.Layouts.PolicyHolder_Rec_new1, THOR, __COMPRESSED__);


CleanParty := PROJECT(DS_BASE_PARTY, TRANSFORM({RECORDOF(LEFT)-PolicyIDs-Roles-PartyPhoneNos}, SELF := LEFT));
PartyPolicyIDs := PROJECT(DS_BASE_PARTY.PolicyIDs, TRANSFORM({RECORDOF(LEFT)}, SELF := LEFT));
PartyRoles := PROJECT(DS_BASE_PARTY.Roles, TRANSFORM({RECORDOF(LEFT)}, SELF := LEFT));
PartyPhoneNos := PROJECT(DS_BASE_PARTY.PartyPhoneNos, TRANSFORM({RECORDOF(LEFT)}, SELF := LEFT));

CleanPayment := PROJECT(DS_BASE_PAYMENT, TRANSFORM({RECORDOF(LEFT)-ReserveIDs-MedicalBillIDs-PharmacyBillIDs}, SELF := LEFT));
PaymentReserveIDs := PROJECT(DS_BASE_PAYMENT.ReserveIDs, TRANSFORM({RECORDOF(LEFT)}, SELF := LEFT));
PaymentMedicalBillIDs := PROJECT(DS_BASE_PAYMENT.MedicalBillIDs, TRANSFORM({RECORDOF(LEFT)}, SELF := LEFT));
PaymentPharmacyBillIDs := PROJECT(DS_BASE_PAYMENT.PharmacyBillIDs, TRANSFORM({RECORDOF(LEFT)}, SELF := LEFT));

CleanSIUReferral := PROJECT(DS_BASE_SIUREFERRAL, TRANSFORM({RECORDOF(LEFT)-ReserveIDs}, SELF := LEFT));
SIUReferralReserveIDs := PROJECT(DS_BASE_SIUREFERRAL.ReserveIDs, TRANSFORM({RECORDOF(LEFT)}, SELF := LEFT));

CleanSubrogation := PROJECT(DS_BASE_SUBROGATION, TRANSFORM({RECORDOF(LEFT)-ReserveIDs}, SELF := LEFT));
SubrogationReserveIDs := PROJECT(DS_BASE_SUBROGATION.ReserveIDs, TRANSFORM({RECORDOF(LEFT)}, SELF := LEFT));

CleanClaimInvolvedUnit := PROJECT(DS_BASE_CLAIMINVOLVEDUNIT, TRANSFORM({RECORDOF(LEFT)-PolicyIds-Theft_Recovery}, SELF := LEFT));
ClaimInvolvedUnitPolicyIDs := PROJECT(DS_BASE_CLAIMINVOLVEDUNIT.PolicyIds, TRANSFORM({RECORDOF(LEFT)}, SELF := LEFT));

CleanMedicalBills := PROJECT(DS_BASE_MEDICALBILLS, TRANSFORM({RECORDOF(LEFT)-DiagnosisCodes-ProviderPhoneNumbers}, SELF := LEFT));
MedicalBillsDiagnosisCodes := PROJECT(DS_BASE_MEDICALBILLS.DiagnosisCodes, TRANSFORM({RECORDOF(LEFT)}, SELF := LEFT));
MedicalBillsProviderPhoneNumbers := PROJECT(DS_BASE_MEDICALBILLS.ProviderPhoneNumbers, TRANSFORM({RECORDOF(LEFT)}, SELF := LEFT));

CleanMedicalProviders := PROJECT(DS_BASE_MEDICALPROVIDERS, TRANSFORM({RECORDOF(LEFT)-Taxonomies}, SELF := LEFT));
MedicalProvidersTaxonomies := PROJECT(DS_BASE_MEDICALPROVIDERS.Taxonomies, TRANSFORM({RECORDOF(LEFT)}, SELF := LEFT));

SALT_CLAIM := SALTRoutines.SALT_Profile_Run_Everything(DS_BASE_CLAIM, 'CLAIM');
SALT_PARTY := SALTRoutines.SALT_Profile_Run_Everything(CleanParty, 'PARTY');
SALT_PARTY_PolicyIDs := SALTRoutines.SALT_Profile_Run_Everything(PartyPolicyIDs, 'PARTY_PolicyIDs');
SALT_PARTY_Roles := SALTRoutines.SALT_Profile_Run_Everything(PartyRoles, 'PARTY_Roles');
SALT_PARTY_PhoneNos := SALTRoutines.SALT_Profile_Run_Everything(PartyPhoneNos, 'PARTY_PhoneNos');
SALT_NOTES := SALTRoutines.SALT_Profile_Run_Everything(DS_BASE_NOTES, 'NOTES');
SALT_PAYMENT := SALTRoutines.SALT_Profile_Run_Everything(CleanPayment, 'PAYMENT');
SALT_PAYMENT_ReserveIDs := SALTRoutines.SALT_Profile_Run_Everything(PaymentReserveIDs, 'PAYMENT_ReserveIDs');
SALT_PAYMENT_MedicalBillIDs := SALTRoutines.SALT_Profile_Run_Everything(PaymentMedicalBillIDs, 'PAYMENT_MedicalBillIDs');
SALT_PAYMENT_PharmacyBillIDs := SALTRoutines.SALT_Profile_Run_Everything(PaymentPharmacyBillIDs, 'PAYMENT_PharmacyBillIDs');
SALT_SIUREFERRAL := SALTRoutines.SALT_Profile_Run_Everything(CleanSIUReferral, 'SIUREFERRAL');
SALT_SIUREFERRAL_ReserveIDs := SALTRoutines.SALT_Profile_Run_Everything(SIUReferralReserveIDs, 'SIUREFERRAL_ReserveIDs');
SALT_SUBROGATION := SALTRoutines.SALT_Profile_Run_Everything(CleanSubrogation, 'SUBROGATION');
SALT_SUBROGATION_ReserveIDs := SALTRoutines.SALT_Profile_Run_Everything(SubrogationReserveIDs, 'SUBROGATION_ReserveIDs');
SALT_POLICY := SALTRoutines.SALT_Profile_Run_Everything(DS_BASE_POLICY, 'POLICY');
SALT_CLAIMINVOLVEDUNIT := SALTRoutines.SALT_Profile_Run_Everything(CleanClaimInvolvedUnit, 'CLAIMINVOLVEDUNIT');
SALT_CLAIMINVOLVEDUNIT_PolicyIDs := SALTRoutines.SALT_Profile_Run_Everything(ClaimInvolvedUnitPolicyIDs, 'CLAIMINVOLVEDUNIT_PolicyIDs');
SALT_RESERVES := SALTRoutines.SALT_Profile_Run_Everything(DS_BASE_RESERVES, 'RESERVES');
SALT_MEDICALBILLS := SALTRoutines.SALT_Profile_Run_Everything(CleanMedicalBills, 'MEDICALBILLS');
SALT_MEDICALBILLS_DiagnosisCodes := SALTRoutines.SALT_Profile_Run_Everything(MedicalBillsDiagnosisCodes, 'MEDICALBILLS_DiagnosisCodes');
SALT_MEDICALBILLS_ProviderPhoneNumbers := SALTRoutines.SALT_Profile_Run_Everything(MedicalBillsProviderPhoneNumbers, 'MEDICALBILLS_ProviderPhoneNumbers');
SALT_PHARMACYBILLS := SALTRoutines.SALT_Profile_Run_Everything(DS_BASE_PHARMACYBILLS, 'PHARMACYBILLS');
SALT_MEDICALPROVIDERS := SALTRoutines.SALT_Profile_Run_Everything(CleanMedicalProviders, 'MEDICALPROVIDERS');
SALT_MEDICALPROVIDERS_Taxonomies := SALTRoutines.SALT_Profile_Run_Everything(MedicalProvidersTaxonomies, 'MEDICALPROVIDERS_Taxonomies');
SALT_PERSON := SALTRoutines.SALT_Profile_Run_Everything(DS_BASE_PERSON, 'PERSON');
SALT_VEHICLES := SALTRoutines.SALT_Profile_Run_Everything(DS_BASE_VEHICLES, 'VEHICLES');
SALT_POLICYHOLDERS := SALTRoutines.SALT_Profile_Run_Everything(DS_BASE_POLICYHOLDERS, 'POLICYHOLDERS');

OUTPUT(SALT_CLAIM+SALT_PARTY+SALT_PARTY_PolicyIDs+SALT_PARTY_Roles+SALT_PARTY_PhoneNos+SALT_NOTES+SALT_PAYMENT+SALT_PAYMENT_ReserveIDs+SALT_PAYMENT_MedicalBillIDs+SALT_PAYMENT_PharmacyBillIDs+
SALT_SIUREFERRAL+SALT_SIUREFERRAL_ReserveIDs+SALT_SUBROGATION+SALT_SUBROGATION_ReserveIDs+SALT_POLICY+SALT_CLAIMINVOLVEDUNIT+SALT_CLAIMINVOLVEDUNIT_PolicyIDs+SALT_RESERVES+
SALT_MEDICALBILLS+SALT_MEDICALBILLS_DiagnosisCodes+SALT_MEDICALBILLS_ProviderPhoneNumbers+SALT_PHARMACYBILLS+SALT_MEDICALPROVIDERS+SALT_MEDICALPROVIDERS_Taxonomies+SALT_PERSON+
SALT_VEHICLES+SALT_POLICYHOLDERS, NAMED('Total_Fields_Profiled'));
#end