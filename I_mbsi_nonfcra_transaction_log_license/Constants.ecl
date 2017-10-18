IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'MBSI_NONFCRA';
EXPORT BaseSuffix := 'transaction_log_license';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'thor::base::log_mbsi::qa::transaction_log_license' , I_mbsi_nonfcra_transaction_log_license.Layout_Source, thor);
EXPORT SourcefileName:= 'thor::base::log_mbsi::qa::transaction_log_license';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_mbsi_nonfcra_transaction_log_license.Layout_Vault, thor, opt);
EXPORT SourceKey := 'license_seq,date_added,transaction_id,person_seq';

END;

