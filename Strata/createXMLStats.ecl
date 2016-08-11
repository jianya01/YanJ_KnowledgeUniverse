export createXMLStats(pStats, pBuildName, pBuildSubSet, pVersionName, pEmailNotifyList = '\'\'', rOut, pBuildView = '\'\'', pBuildType = '\'\'', pDomain = '\'Insurance\'') := macro
					  
	import _control, ut, lib_fileservices;					  

	#uniquename(basepath)
	#uniquename(sourcefileName)
	#uniquename(destfilename)
	#uniquename(combinedEmailList)
	#uniquename(buildSubSet)
	#uniquename(rout1)
	#uniquename(rout2)
	#uniquename(rout3)
	#uniquename(rout4)
	#uniquename(rout5)
	#uniquename(ds1)
	#uniquename(buildType)
	#uniquename(buildView)
	#uniquename(versionname)
	#uniquename(clean)
	#uniquename(buildName)

	string %clean%(string s) := 
		stringlib.stringfindreplace(
			stringlib.stringfindreplace(
				stringlib.stringfindreplace(
					stringlib.stringfilterout(s, ' ')
				,'&','_')
			,'-','_')
		, ':','_');

	%versionname% := %clean%(if(pVersionName = '', 'version', pVersionName));
	%buildType%   := %clean%(if(pBuildType = '', 'type', pBuildType));
	%buildView%   := %clean%(if(pBuildView = '', 'view', pBuildView));
	%buildSubSet% := %clean%(if(pBuildSubSet = '', 'data', pBuildSubSet));
	%buildName%		:= %clean%(pBuildName);

	%combinedEmailList% := pEmailNotifyList; //if(pEmailNotifyList = '', strata.settings.emailList, pEmailNotifyList + ',' + strata.settings.emailList);  

	%basePath%	:= 
		CASE(pDomain,
			'StrataMVR' 			=>	if (_control.ThisEnvironment.Name = 'Prod', '~thor_data400::base::stratamvrprod::', '~thor_data400::base::stratamvr::'),
			'StrataI'					=>	if (_control.ThisEnvironment.Name = 'Prod', '~thor_data400::base::strataiprod::', '~thor_data400::base::stratai::'),
			'Insurance'				=>	if (_control.ThisEnvironment.Name = 'Prod', '~thor_data400::base::strataiprod::', '~thor_data400::base::stratai::'),
			strata.settings.basepath);
		
	%sourcefileName% := %basePath%	+ 
											%buildName% 		+ '::' + 
											%buildSubSet%		+ '::' + 
											%versionname%		+ '::' +
											%buildType% 		+ '::' +
											%buildView% 		+ '::' +
											thorlib.wuid();

	%rout1% := output(pStats,, %sourcefileName% + '.xml.pending', xml(heading('<Dataset '
			+ 'buildname="'   + %buildName%					+ '" '
			+ 'buildsubset="' + %buildSubSet%				+ '" '
			+ 'versionname="' + %versionname%				+ '" '
			+ 'buildtype="'   + %buildType%					+ '" '
			+ 'buildview="'   + %buildView%					+ '" '
			+ 'Workunit="'   	+ thorlib.wuid()			+ '" '
			+ 'emailList="'		+ %combinedEmailList%	+ '" '
			+ '>\n',
			'</Dataset>\n'),trim));

	%rout2% := output(choosen(pStats,all));
				
	%rout3% := output(pStats,,%sourcefileName% + '.csv.pending',csv(heading(single),separator(','),terminator('\r\n'),quote('"'),maxlength(32768)));
	 
	rout := if (_control.thisenvironment.name = 'Dataland', 
				%rout2%,
				parallel(%rout1%, %rout2%, %rout3%)
				);		

endmacro;