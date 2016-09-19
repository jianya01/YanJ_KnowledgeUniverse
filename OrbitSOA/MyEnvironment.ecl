import _Control;

export MyEnvironment(string environment) := module

	EXPORT string ServiceName := 
		IF(_control.ThisEnvironment.Name = 'Prod',
			'http://aiorbit01.lexisnexis.com/OrbitServiceInsurance/OrbitService.svc',
			'http://lnrbctcesd002.risk.regn.net/OrbitIQCFunctionalSOA/OrbitService.svc');

	EXPORT string StrataIServiceName := 
		IF(_control.ThisEnvironment.Name = 'Prod',
			'http://aiorbit01.lexisnexis.com/OrbitServiceInsurance/OrbitService.svc',
			'http://lnrbctcesd002.br.seisint.com/StrataFunctionalSOA/OrbitService.svc');

	EXPORT string NamespaceName := 
		IF(_control.ThisEnvironment.Name = 'Prod',	
			'http://lexisnexis.com/',
			'http://lexisnexis.com/');

	EXPORT string SoapActionName := 
		IF(_control.ThisEnvironment.Name = 'Prod',	
			'http://lexisnexis.com/IOrbitService/',
			'http://lexisnexis.com/IOrbitService/');

end;
