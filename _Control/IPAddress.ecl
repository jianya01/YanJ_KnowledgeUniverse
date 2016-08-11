export IPAddress 
 :=
  module
	export	string	edata10			:=	'edata10-bld.br.seisint.com';			// 10.150.13.201
	export	string	edata11			:=	'edata11-bld.br.seisint.com';			// 10.150.12.242
	export	string	edata11b		:=	edata11;								// used to be edata11-b @ '10.173.12.242';
	export	string	edata12			:=	'edata12-bld.br.seisint.com';			// 10.150.14.14
	export	string	edata14			:=	'edata14-bld.br.seisint.com';			// 10.173.212.10
	export	string	edata14a		:=	edata14;								// 10.173.212.10
	export	string	edata15			:=	'edata15-bld.br.seisint.com';			// 10.173.14.12
	export string unixland := '10.194.72.226';
	export string prodlz := '10.194.64.250';
	export	string	sdsmoxiedev01	:=	'sdsmoxiedev01.seisintdecisions.com';	// 172.18.10.12, also resolves from sdskeybuild02.seisintdecisions.com and espdevonline.securint.com
	export	string	tapeload01		:=	'tapeload01.br.seisint.com';			// 10.121.145.79
	export	string	tapeload02		:=	'tapeload02.br.seisint.com';			// 10.121.145.80
	export	string	tapeload02b		:=	'tapeload02b.br.seisint.com';			// 10.121.145.41

	export	string	dataland_esp	:=	'dataland_esp.br.seisint.com';			// 10.173.29.160
	export	string	dataland_dali	:=	'dataland_dali.br.seisint.com';			// 10.173.28.12
	export	string	adataland_esp	:=	'10.194.10.2';			// 10.173.29.160
	export	string	adataland_dali	:=	'10.194.10.1';			// 10.173.28.12
	export	string	dataland_sasha	:=	'10.173.65.201';						// No br domain DNS entry

	export	string	alpharetta_poc_thor	:=	'10.194.10.5';
	export	string	aprod_thor_esp	:=	'10.194.12.2';				// 10.173.84.202
	export	string	aprod_thor_dali	:=	'10.194.12.1';				// 10.173.84.201
	export	string	prod_thor_esp	:=	'prod_esp.br.seisint.com';				// 10.173.84.202
	export	string	prod_thor_dali	:=	'prod_dali.br.seisint.com';			//	10.241.20.205
	export	string	prod_thor_sasha	:=	'10.173.85.204';						// No br domain DNS entry

  // request for DNS at some point later
	export	string	prod_watch_esp  := '10.173.249.2';
	export	string	prod_watch_dali := '10.173.249.1';
	// export	string	prod_watch_sasha := '';

  end
 ;
