IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'log_trimerge';
EXPORT BaseSuffix := 'trimerge_caopr_verification_bankruptcy';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'thor::base::log_trimerge::qa::trimerge_caopr_verification_bankruptcy' ,I_trimerge_trimerge_caopr_verification_bankruptcy.Layout_Source, thor);
EXPORT SourcefileName:= 'thor::base::log_trimerge::qa::trimerge_caopr_verification_bankruptcy';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_trimerge_trimerge_caopr_verification_bankruptcy.Layout_Vault, thor, opt);
EXPORT SourceKey := 'verification_id';
EXPORT ModuleName := 'I_trimerge_trimerge_caopr_verification_bankruptcy';

END;

