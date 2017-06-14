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

END;