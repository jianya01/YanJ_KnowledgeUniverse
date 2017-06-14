EXPORT Constants := MODULE

EXPORT AlphaDev:= '~foreign::10.194.10.1::';
EXPORT AlphaProd:= '~foreign::10.194.12.1::';

EXPORT fcra_cc_tranl_sourceFile := AlphaProd+'base::fcra_cc_tranl::transaction_log::qa::trans_log_id';
EXPORT fcra_cc_tranl_Baseprefix := '~thor::base::fcra_cc_tranl::transaction_log'; 
EXPORT fcra_cc_tranl_BaseSuffix := 'transaction_log';

EXPORT transaction_log_policycoverage := '~thor::base::cc_tranlpolcoverage::transaction_log_policycoverage::prod::trans_log_id';// vault file created in first time ingest - to be refered in incremetal ingest as dsbase
EXPORT transaction_log_policycoverage_BasePrefix := '~thor::base::cc_tranlpolcoverage::transaction_log_policycoverage';
EXPORT transaction_log_policycoverage_BaseSuffix := 'trans_log_id';

EXPORT cdscprop_inquiry_history := '~thor::base::cdscprop::inquiry_history::prod::id';// vault file created in first time ingest - to be refered in incremetal ingest as dsbase
EXPORT cdscprop_inquiry_history_log := '~thor::base::cdscprop::inquiry_history::prod::id::Ingestlog';// Ingest log file
EXPORT cdscprop_inquiry_history_BasePrefix := '~thor::base::cdscprop::inquiry_history'; //	Baseprefix
EXPORT cdscprop_inquiry_history_BaseSuffix := 'id'; //BaseSuffix

END;