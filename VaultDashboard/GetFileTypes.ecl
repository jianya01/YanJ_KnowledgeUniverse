IMPORT STD;
EXPORT GetFileTypes := Module

SHARED baseDS := VaultDashboard.Constants.dsThorFiles;
				Types := VaultDashboard.Constants.FileTypes;
				a:= '::';
EXPORT gettypes_DS:= project(baseDS, transform({string20 Filetype, recordof(baseDS)},
   										self.Filetype:= MAP(regexfind(a+Types[1]+a, left.name)=TRUE => Types[1],
																					regexfind(a+Types[2]+a, left.name)=TRUE => Types[2],
																					regexfind(Types[3]+a, left.name)=TRUE => Types[3],
																					regexfind(a+Types[4]+a, left.name)=TRUE => Types[4],
																					regexfind(a+Types[5]+a, left.name)=TRUE => Types[5],
																					regexfind(a+Types[6]+a, left.name)=TRUE => Types[6],
																					regexfind(a+Types[7]+a, left.name)=TRUE => Types[7],
																					regexfind(a+Types[8]+a, left.name)=TRUE => Types[8],
																					regexfind(a+Types[9]+a, left.name)=TRUE => Types[9],
																					regexfind(a+Types[10]+a, left.name)=TRUE => Types[10],
																					regexfind(a+Types[11]+a, left.name)=TRUE => Types[11],
																					regexfind(a+Types[12]+a, left.name)=TRUE => Types[12],
																					regexfind(a+Types[13]+a, left.name)=TRUE => Types[13],
																					regexfind(Types[14], left.name)=TRUE => Types[14]+'ingest',
																					'other');
											// self.blockcomp := if(STD.File.FileExists('~'+left.name),STD.File.GetLogicalFileAttribute('~'+left.name,'blockCompressed'),'0');
											self:= left;
											self:= [];	));
											
//get file counts and total size for different types of files
getFTypeInfo := TABLE(gettypes_DS,{STRING20 FileType := gettypes_DS.FileType, 
															UNSIGNED8 totalNo := count(GROUP),
															UNSIGNED8 actualSpace := SUM(GROUP,actualSize),
															UNSIGNED8 uncompressedSpace:= SUM(GROUP,actualSize ,gettypes_DS.isCompressed = FALSE),
															UNSIGNED8 compressedSpace := SUM(GROUP,actualSize ,gettypes_DS.isCompressed = TRUE)},FileType,MERGE);
EXPORT FiletypeCounts := SORT(getFTypeInfo,-actualSpace);


//get file counts and total size for different types of files
getFTypeOwnerInfo := TABLE(gettypes_DS,{STRING255 Owner := gettypes_DS.owner, 
																				STRING20 FileType := gettypes_DS.FileType, 
																				UNSIGNED8 actualSpace := SUM(GROUP,actualSize),
																				UNSIGNED8 uncompressedSpace:= SUM(GROUP,actualSize ,gettypes_DS.isCompressed = FALSE),
																				UNSIGNED8 compressedSpace := SUM(GROUP,actualSize ,gettypes_DS.isCompressed = TRUE)},Owner, FileType,MERGE);
EXPORT FiletypeOwnerCounts := SORT(getFTypeOwnerInfo,owner);

END;