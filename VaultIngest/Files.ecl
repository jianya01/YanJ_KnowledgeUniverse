IMPORT Vault_Layout;

EXPORT Files := MODULE

	EXPORT base_prefix := '~thor::base::';
//cdscprop_inquiry_history
	EXPORT cdscprop_inquiry_history_Vaultfile := base_prefix+ 'cdscprop::inquiry_history::prod::id';// vault filename created in first time ingest 
	EXPORT cdscprop_inquiry_history := DATASET(cdscprop_inquiry_history_Vaultfile,Vault_Layout.L_CDSCProp_InqHist,thor); //dataset
	EXPORT cdscprop_inquiry_history_log := cdscprop_inquiry_history_Vaultfile+'::Ingestlog';// Ingest log file
	EXPORT cdscprop_inquiry_history_BasePrefix := '~thor::base::cdscprop::inquiry_history'; //	Baseprefix
	EXPORT cdscprop_inquiry_history_BaseSuffix := 'id'; //BaseSuffix
//I_ncf_transaction_log
	EXPORT ncf_transaction_log_Vaultfile := base_prefix+ 'ncf::prod::transaction_log';// vault filename created in first time ingest 
	EXPORT ncf_transaction_log := DATASET(ncf_transaction_log_Vaultfile, Vault_Layout.L_ncf_transaction_log,thor); //dataset
	EXPORT ncf_transaction_log_log := ncf_transaction_log_Vaultfile+'::Ingestlog';// Ingest log file
	EXPORT ncf_transaction_log_BasePrefix := '~thor::base::ncf'; //	Baseprefix
	EXPORT ncf_transaction_log_BaseSuffix := 'transaction_log'; //BaseSuffix
	
	// I_CurrentCarrier_tranlog
	EXPORT fcra_cc_tranl_Vaultfile := base_prefix+ 'fcra_cc_tranl::prod::transaction_log';// vault filename created in first time ingest 
	EXPORT fcra_cc_tranl := DATASET(fcra_cc_tranl_Vaultfile, Vault_Layout.L_fcra_cc_tranl,thor); //dataset
	EXPORT fcra_cc_tranl_log := fcra_cc_tranl_Vaultfile+'::Ingestlog';// Ingest log file
	EXPORT fcra_cc_tranl_BasePrefix := '~thor::base::fcra_cc_tranl'; //	Baseprefix
	EXPORT fcra_cc_tranl_BaseSuffix := 'transaction_log'; //BaseSuffix

	// I_CurrentCarrier_tranlogPolicyCov
	// thor::base::cc_tranlpolcoverage::transaction_log_policycoverage::prod::trans_log_id
	EXPORT fcra_cc_tranlogPCov_Vaultfile := base_prefix+ 'cc_tranlpolcoverage::transaction_log_policycoverage::prod::trans_log_id_test';// vault filename created in first time ingest 
	EXPORT fcra_cc_tranlogPCov := DATASET(fcra_cc_tranlogPCov_Vaultfile, Vault_Layout.L_fcra_cc_tranlogPoCov,thor); //dataset
	EXPORT fcra_cc_tranlogPCov_log := fcra_cc_tranl_Vaultfile+'::Ingestlog';// Ingest log file
	EXPORT fcra_cc_tranlogPCov_BasePrefix := '~thor::base::cc_tranlpolcoverage::transaction_log_policycoverage'; //	Baseprefix
	EXPORT fcra_cc_tranlogPCov_BaseSuffix := 'trans_log_id_test'; //BaseSuffix
	
	//cdscprop_inquiry_history - ************FOR SALT 38 TEST*******************
	EXPORT TEST_Vaultfile := base_prefix+ 'cdscprop::inquiry_history::prod::id_Salt38test';// vault filename created in first time ingest 
	EXPORT TEST := DATASET(TEST_Vaultfile,Vault_Layout.Layout_Test,thor); //dataset
	EXPORT TEST_log := TEST_Vaultfile+'::Ingestlog';// Ingest log file
	EXPORT TEST_BasePrefix := '~thor::base::cdscprop::inquiry_history'; //	Baseprefix
	EXPORT TEST_BaseSuffix := 'id_Salt38test'; //BaseSuffix
	
	
		// I_CurrentCarrier_tranlog- ************FOR SALT 38 TEST*******************
	EXPORT s38_fcra_cc_tranl_Vaultfile := base_prefix+ 'fcra_cc_tranl::prod::transaction_log_s38';// vault filename created in first time ingest 
	EXPORT s38_fcra_cc_tranl := DATASET(s38_fcra_cc_tranl_Vaultfile, Vault_Layout.L_fcra_cc_tranl,thor); //dataset
	EXPORT s38_fcra_cc_tranl_log := s38_fcra_cc_tranl_Vaultfile+'::Ingestlog_s38';// Ingest log file
	EXPORT s38_fcra_cc_tranl_BasePrefix := '~thor::base::fcra_cc_tranl'; //	Baseprefix
	EXPORT s38_fcra_cc_tranl_BaseSuffix := 'transaction_log_s38'; //BaseSuffix
END;
