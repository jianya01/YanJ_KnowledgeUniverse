EXPORT Constants := MODULE
	EXPORT STRING ProdLandingZoneIP := '10.194.64.250';
	EXPORT STRING DevLandingZoneIP := '10.194.72.226';
	EXPORT STRING srcCSVPipeseparator := '|';
	EXPORT STRING srcCSVterminator := '\n';
	EXPORT STRING srcCSVquote := '"';	
	EXPORT STRING ProdDestinationgroup := 'analyt_thor400_90_prod';
	EXPORT STRING DevDestinationgroup := 'thor400_72';
	EXPORT STRING  Dops_RoxieIP := 'http://roxiebatch.br.seisint.com:9856';
	EXPORT STRING IDops_RoxieIP := 'http://Iroxievip.sc.seisint.com:9876';
	EXPORT STRING IHeader_Pkg_Var := 'iheader_build_version';
	EXPORT STRING PublicRecord_Bankruptcy_Daily_pkg_Var := 'Bankruptcy_daily';
	EXPORT STRING PublicRecord_Offenders_Public_pkg_Var := 'Corrections_Build_Version';
END;