﻿IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'log_trimerge';
EXPORT BaseSuffix := 'trimerge_caopr_verification';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'thor::base::log_trimerge::qa::trimerge_caopr_verification' ,I_trimerge_trimerge_caopr_verification.Layout_Source, thor);
EXPORT SourcefileName:= 'thor::base::log_trimerge::qa::trimerge_caopr_verification';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_trimerge_trimerge_caopr_verification.Layout_Vault, thor, opt);
EXPORT SourceKey := 'verification_id,transaction_id,credit_public_record_id,caopr_record_type_id';

END;

