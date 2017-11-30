﻿IMPORT UT;
EXPORT Constants := MODULE

EXPORT VaultNamePrefix := '~vault::thor::translogs';
EXPORT BasePrefix := VaultNamePrefix+'::'+'log_mbsi_fcra';
EXPORT BaseSuffix := 'transaction_log_online';
EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'base::fcra_mbsi_trano::transaction_log_online::qa::trans_online_id' , I_mbsi_fcra_translog_online.Layout_Source, thor);
EXPORT SourcefileName:= 'base::fcra_mbsi_trano::transaction_log_online::qa::trans_online_id';
EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_mbsi_fcra_translog_online.Layout_Vault, thor, opt);
EXPORT SourceKey := 'transaction_id,transaction_type,request_data,response_data,request_format,response_format,date_added';

END;
