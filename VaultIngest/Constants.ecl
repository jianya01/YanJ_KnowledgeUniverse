IMPORT UT;
EXPORT Constants := MODULE

	EXPORT STRING ProdLandingZoneIP := '10.194.64.250';
	EXPORT STRING DevLandingZoneIP := '10.194.72.226';
	EXPORT STRING srcCSVPipeseparator := '|';
	EXPORT STRING srcCSVterminator := '\n';
	EXPORT STRING srcCSVquote := '"';	
	EXPORT STRING ProdDestinationgroup := 'analyt_thor400_90_prod';
	EXPORT STRING DevDestinationgroup := 'thor400_72';
	// EXPORT STRING Dops_RoxieIP := 'http://roxiestaging.br.seisint.com:9876';
	EXPORT STRING Dops_RoxieIP := 'http://roxiebatch.br.seisint.com:9856';
	EXPORT STRING IDops_RoxieIP := 'http://Iroxievip.sc.seisint.com:9876';

	EXPORT AlphaDev:= ut.foreign_development_alpha;
	EXPORT AlphaProd:= ut.foreign_production_alpha;

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