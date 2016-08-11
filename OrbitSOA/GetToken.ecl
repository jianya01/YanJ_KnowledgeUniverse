export GetToken(string environment) := function

	InputRec := RECORD 
		string somestring {xpath('xml')} := 
			'<OrbitRequest xmlns="http://schemas.datacontract.org/2004/07/OrbitDataContracts" xmlns:i="http://www.w3.org/2001/XMLSchema-instance">' + 
				'<Login>' + 
					'<Username>svc-orbit_hpcc@br</Username>' + 
					'<OrbitDomain>LexisNexis</OrbitDomain>' + 
					'<Password>wQCH6v37#</Password>' + 
				'</Login>' +
			'</OrbitRequest>' 
	END;

	outrec := RECORD 
		string outdata {xpath('LoginExResponse/LoginExResult')};
	end;

	retval := SOAPCALL(
		TRIM(MyEnvironment(environment).ServiceName),
		'LoginEx',
		InputRec,
		outrec,
		NAMESPACE(TRIM(MyEnvironment(environment).NamespaceName)),
		LITERAL,
		SOAPACTION(TRIM(MyEnvironment(environment).SoapActionName) + 'LoginEx')
	);

	xmlds := dataset([{retval.outdata}],{string xmlline});

	string_Rec := RECORD
		string orbittoken := xmltext('Token');
	end;

	xmlout := parse(xmlds,xmlline,string_rec,xml('OrbitResponse'));

//return xmlout;
return xmlout[1].orbittoken;

end;
