IMPORT UT;
EXPORT Constants := MODULE

		EXPORT VaultNamePrefix := '~vault::thor::translogs';
		EXPORT BasePrefix := VaultNamePrefix+'::'+'DD';
		EXPORT BaseSuffix := 'transaction_log_inq_subject';
		EXPORT Sourcefile:= DATASET(UT.foreign_production_Alpha+'base::dd_trnlinq::transaction_log_inq_subject::qa::trans_log_id' , I_dd_transaction_log_inq_subject.Layout_Source, thor);
		EXPORT SourcefileName:= 'base::dd_trnlinq::transaction_log_inq_subject::qa::trans_log_id';
		EXPORT VaultFile := DATASET(BasePrefix+'::prod::'+BaseSuffix , I_dd_transaction_log_inq_subject.Layout_Vault, thor, opt);
		EXPORT SourceKey := 'transaction_id,date_added,inq_last_name,inq_first_name,inq_middle_name,inq_suffix,inq_license_num,inq_license_state,inq_dob,inq_gender,inq_ssn,inq_idl';

END;

