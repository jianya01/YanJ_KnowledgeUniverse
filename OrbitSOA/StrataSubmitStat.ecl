export StrataSubmitStat (string intoken, string buildName, string buildSubSet, string buildType, string buildView, string wuid, string version, string environment) := function

	#uniquename(clean)
	#uniquename(cleanBuildName)
	#uniquename(cleanBuildSubSet)
	#uniquename(cleanBuildType)
	#uniquename(cleanBuildView)
	#uniquename(cleanVersion)

	string %clean%(string s) := 
		stringlib.stringfindreplace(
			stringlib.stringfindreplace(
				stringlib.stringfindreplace(
					stringlib.stringfilterout(s, ' ')
					,'&','_')
				,'-','_')
			, ':','_');

	%cleanBuildName% := %clean%(buildName);
	%cleanBuildSubSet% := %clean%(if(buildSubSet = '', 'data', buildSubSet));
	%cleanBuildType% := %clean%(if(buildType = '', 'type', buildType));
	%cleanBuildView% := %clean%(if(buildView = '', 'view', buildView));
	%cleanVersion% := %clean%(if(version = '', 'version', version));
	
	string strataToken := OrbitSOA.StrataSubmitStatGetToken('Insurance')[1..36];
	
	RequestREC := RECORD
		string requestString {xpath('xml')} := 
			'<OrbitRequest xmlns:i="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://schemas.datacontract.org/2004/07/OrbitDataContracts">' +
				'<Stat>' + 
					'<BuildName>' + %cleanBuildName% + '</BuildName>' + 
					'<BuildSubSet>' + %cleanBuildSubSet% + '</BuildSubSet>' + 
					'<BuildType>' + %cleanBuildType% + '</BuildType>' + 
					'<BuildView>' + %cleanBuildView% + '</BuildView>' + 
					'<Workunit>' + wuid + '</Workunit>' + 
					'<VersionName>' + %cleanVersion% + '</VersionName>' + 
				'</Stat>' + 
				'<Token>' + strataToken + '</Token>' + 
			'</OrbitRequest>';
	END;
	

	ResponseREC := RECORD
		string outdata {xpath('StrataSubmitStatResponse/StrataSubmitStatResult')};
	END;

	soaReturnValue := SOAPCALL(
		TRIM(MyEnvironment(environment).StrataIServiceName),
		'StrataSubmitStat',
		RequestREC,
		ResponseREC,
		NAMESPACE(TRIM(MyEnvironment(environment).NamespaceName)),
		LITERAL,
		SOAPACTION(TRIM(MyEnvironment(environment).SoapActionName) + 'StrataSubmitStat'));
		
	xmlout_rec := record, maxlength(50000)
		string xmlline;
	end;
		
	xmlds := dataset([{soaReturnValue.outdata}], xmlout_rec);
	
	orbitStatus_rec := record
		string orbitStatusCode := xmltext('OrbitStatusCode');
		string orbitStatusDescription := xmltext('OrbitStatusDescription');
	end;
	
	orbitStatus_ds := parse(xmlds,xmlline,orbitStatus_rec,xml('OrbitResponse/OrbitStatus'));
	
	return orbitStatus_ds;

END;