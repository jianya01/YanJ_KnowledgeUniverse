IMPORT STD, lib_fileservices;
EXPORT CreateBaseDS := FUNCTION
// get filelist from the remote directory
filelist:= lib_fileservices.FileServices.RemoteDirectory(VaultDashboard.Constants.lDaliIP, VaultDashboard.Constants.lDaliAuditPath, , );
LogRec := VaultDashboard.Layouts.logDir;
addDateString := project(filelist, transform(LogRec,
																				self.date := left.name[9..12]+'-'+left.name[14..15]+'-'+left.name[17..18];//2018-01-16 == format in CSV file auditdatetime
																				self.Filename_date := left.name[9..12]+'_'+left.name[14..15]+'_'+left.name[17..18];//2018_01_16 == format in filename
																				self:=left;));
								
S_addDateString := sort(addDateString,-date);

dates:= table(S_addDateString, {S_addDateString.date, S_addDateString.filename_date},date, filename_date);

lay_logs:=VaultDashboard.layouts.rCSVRaw;				
lay_repr:= {recordof(dates), dataset(lay_logs) records };

getLogData:= project(dates, transform(lay_repr,
														self.date:= left.date;
														self.filename_date:= left.filename_date;
											readfile:= VaultDashboard.fDaliAuditDataset (left.filename_date); 
														self.records := readfile;
														self:=[];));

lay_logs readLogData(lay_logs R) := TRANSFORM
SELF := R;
END;
dAudit := NORMALIZE(getLogData,LEFT.records,readLogData(RIGHT));
// filter content
dFileAccessPrep	:=	dAudit(FileAccess = 'FileAccess'
													 and FileName[1..12] <> 'hpccinternal'
													 and not regexfind('__p[0-9]+$', trim(FileName))
														);
  
	
// add columns for separate date and time 
lRegexer	:=	'^([^ ]+) ([^ ]+)';

VaultDashboard.layouts.rTokens	tToTokens(dFileAccessPrep pInput)	:=
   transform
   	self.AuditDate	:=	regexfind(lRegexer, pInput.AuditDateTime, 1);
   	self.AuditTime	:=	regexfind(lRegexer, pInput.AuditDateTime, 2);
   	self.Action	:=	MAP(regexfind('CreateSupe', pInput.action)=TRUE => 'CREATESUPERFILE',
																					regexfind('AddSuperFi', pInput.action)=TRUE => 'ADDSUPERFILE',
																					regexfind('RemoveOwne', pInput.action)=TRUE => 'REMOVEOWNER',
																					regexfind('RemoveSupe', pInput.action)=TRUE => 'REMOVESUPERFILE',
																					regexfind('DeleteLogi', pInput.action)=TRUE => 'DELETELOGICALFILE',
																					pInput.action);
   	self			:=	pInput;
   end;
dFileAccess	:=	project(dFileAccessPrep, tToTokens(left)); 
//Add new records to prod version
Currentfile:= VaultDashboard.Constants.dsVaultLogs; //keep auditdatetime column from dAudit

CurrentFile_maxdatetime := max(Currentfile, Currentfile.auditdatetime);

NewRecsToAppend:= dFileAccess(auditdatetime>CurrentFile_maxdatetime);
//Appended records to current prod version   
newprodfile:= Currentfile + NewRecsToAppend;

//Validations
LatestRecInNew:=   max(newprodfile,newprodfile.auditdatetime) ;
//Construct Email
 pEmailTrim := 'Logfiles from DALI AND VaultFiles';

   Successsubject  := 'The ' + pEmailTrim + ' build Completed for : ' + (STRING8)STD.Date.Today();
   Successbody     := 'The ' + pEmailTrim + ' build Completed for : ' + (STRING8)STD.Date.Today() + '.'+'\n' +
   										 'The Workunit is ' + WORKUNIT +'\n'
												+'Log records added until : '+ LatestRecInNew+' ** '
												+'Total records in current file : '+count(newprodfile);		;
	
   										
   Failuresubject  := 'The ' + pEmailTrim + ' build Failed for : ' + (STRING8)STD.Date.Today();
   Failurebody     := 'The ' + pEmailTrim + ' build Failed for : ' + (STRING8)STD.Date.Today() + '.'+'\n' +
   										 'The Workunit is ' + WORKUNIT + '\n'+
   										 'ErrorMessage is ' + FAILMESSAGE + '\n\n';		

										
	// CREATE LOGFILE ON VAULT										 
   CreateLogFiles:= FileUtil.FN_OutputAndPromoteFile(newprodfile, VaultDashboard.Constants.Baseprefix, VaultDashboard.Constants.LBaseSuffix, WORKUNIT[2..9] + WORKUNIT[11..16]);
   												
   													
   // RETRIEVE FILE LIST
   dsThorFiles0 := STD.File.LogicalFileList()(size > 0);
   dsThorFiles := project(dsThorFiles0, TRANSFORM( VaultDashboard.Layouts.FileStats - compressionRatio,
   																			SELF := left;
   																			csize := IF(STD.File.FileExists('~'+LEFT.name),(unsigned)STD.File.GetLogicalFileAttribute('~' +LEFT.name,'compressedSize'),SKIP);
   																			iskey := IF(STD.File.FileExists('~'+LEFT.name),STD.File.GetLogicalFileAttribute('~' +LEFT.name,'kind') = 'key',FALSE);
   																			SELF.isCompressed := IF(csize > 0 or iskey,TRUE,FALSE);
   																			SELF.compressedSize := IF(iskey,LEFT.size,csize);
   																			SELF.actualSize := IF(csize > 0,csize,LEFT.size);
   																			SELF.Accessed := if(STD.File.FileExists('~'+left.name),STD.File.GetLogicalFileAttribute('~'+left.name,'accessed'),'');
   																			SELF:=[];));
   																			
   AddCompressionRatio:= project(dsThorFiles, transform(VaultDashboard.Layouts.FileStats,
   																			SELF.compressionRatio := round(IF(left.compressedSize > 0,left.Size/left.compressedSize,0),3);
   																			SELF := left;			));		
   
   // CREATE FILELIST FILE ON VAULT
   CreateFilelist:= FileUtil.FN_OutputAndPromoteFile(AddCompressionRatio, VaultDashboard.Constants.Baseprefix, VaultDashboard.Constants.FBaseSuffix, WORKUNIT[2..9] + WORKUNIT[11..16]);
   
   // CREATE BOTH FILES IN SEQUENTIAL ACTION AND SEND EMAIL ALERT
   CreateFiles:= SEQUENTIAL( CreateLogFiles,CreateFilelist,
   													Fileservices.Sendemail(VaultDashboard.Constants.EmailGroup, Successsubject, Successbody)) 
   													: FAILURE(Fileservices.Sendemail(VaultDashboard.Constants.EmailGroup, Failuresubject, Failurebody));
   													
   RETURN CreateFiles;

END;