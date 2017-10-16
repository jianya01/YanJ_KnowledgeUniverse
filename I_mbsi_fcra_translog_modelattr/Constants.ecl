﻿IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'log_mbsi_fcra';
EXPORT BaseSuffix := 'transaction_log_model_attribute';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'thor::base::fcra::log_mbsi_fcra::qa::transaction_log_model_attribute' , I_mbsi_fcra_translog_modelattr.Layout_Source, thor);
EXPORT SourcefileName:= 'thor::base::fcra::log_mbsi_fcra::qa::transaction_log_model_attribute';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_mbsi_fcra_translog_modelattr.Layout_Vault, thor, opt);
EXPORT SourceKey := 'transaction_id,model_sequence,attribute_sequence,date_added';

END;

