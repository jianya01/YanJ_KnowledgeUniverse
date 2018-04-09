IMPORT STD;
EXPORT SendAlerts := FUNCTION
//--------- vault space stats
TotalConsumedSpace:= VaultDashboard.GetFileInfo.ClusterSpaceAnalysis;

ActualUsedSpace:= Round((REAL)(sum(TotalConsumedSpace,TotalConsumedSpace.actualSpace)/1099511627776),3);
uncompressedSpace:= Round((REAL)(sum(TotalConsumedSpace,TotalConsumedSpace.uncompressedSpace)/1099511627776),3);
compressedSpace:= Round((REAL)(sum(TotalConsumedSpace,TotalConsumedSpace.compressedSpace)/1099511627776),3);
Total_available_space := round(VaultDashboard.Constants.VaultThorSize - ActualUsedSpace,3);
//--------- Calculate % function.
STRING Percentage(INTEGER N, INTEGER D) := FUNCTION
	  REAL Val := IF(D = 0, 0, ((REAL)N) / ((REAL) D));
		RETURN TRIM(REALFORMAT(Val * 100, 12, 1), LEFT, RIGHT);
END;
//--------- Percentage Calculations
Used_Perc := Percentage(ActualUsedSpace, VaultDashboard.Constants.VaultThorSize);
Available_Perc := Percentage(Total_available_space, VaultDashboard.Constants.VaultThorSize);
Uncompressed_Perc := Percentage(uncompressedSpace, VaultDashboard.Constants.VaultThorSize);

//--------- Deleted files in last 7 days
today:= (STRING8)Std.Date.Today();
weekago:= VaultDashboard.date_math(today, -7);

from_date:= weekago[1..4]+'-'+weekago[5..6]+'-'+weekago[7..8];
																	
DeletedFiles := VaultDashboard.ReadLogfiles.Deleted_FileTable;
DeletedFileList:= DeletedFiles(DeletedFiles.DateDeleted > from_date);

//generate string for deleted files email message
OutRec1 := {recordof(DeletedFileList), string body};
getDS_Dnamestring := project(DeletedFileList, transform(OutRec1,
																self.body := Trim(left.DateDeleted) + '\t'+Trim((STRING)left.Username)  + '\t'+ left.Filename ;
																self:=left;));
  
OutRec1 GenerateBody(OutRec1 L, OutRec1 R) := TRANSFORM
																									SELF.body := L.body +' \n'+ R.body;
																									SELF := R;
																							END;
      
GetDelList := ITERATE(sort(getDS_Dnamestring,-DateDeleted),GenerateBody(LEFT,RIGHT));

cnt1:= count(GetDelList);
				 
//--------- compression stats

UnComp_FileOwnerList := VaultDashboard.GetFileInfo.UnComp_FileOwnerList; 
OutRec := {recordof(UnComp_FileOwnerList), string body};
getDS_namestring := project(UnComp_FileOwnerList, transform(OutRec,
						self.body := left.owner + '<'+Trim((STRING)left.TotalFiles)  + ' files>\t'+ left.Total_uncompressedSize ; 
						self:=left;));

OutRec AddThem(OutRec L, OutRec R) := TRANSFORM
																				SELF.body := L.body +' \n'+ R.body;
																				SELF := R;
																			END;
	
GetUserList := ITERATE(sort(getDS_namestring,-Total_uncompressedSize),AddThem(LEFT,RIGHT));
cnt:= count(GetUserList);

//--------- Compose the e-mail subject.
STRING Uspace_subject   := 'Vault Statistics ' ;
//--------- Compose the e-mail body. Note that this is one long string composition statement.
STRING Uspace_body      := 'Vault Storage Utilization:'  +'\n\n'+
													 'Total Capacity \t : '+ VaultDashboard.Constants.VaultThorSize+' TB'+'\n'+
													 'In Use \t\t : '+' '+ActualUsedSpace +' TB'+'\n'+
													 '   Compressed \t : '+' '+compressedSpace +' TB ('+Used_Perc +'%)'+'\n'+
													 '   Uncompressed : '+' '+uncompressedSpace +' TB ('+Uncompressed_Perc +'%)'+'\n'+
													 'Free \t\t : '+' '+Total_available_space +' TB ('+Available_Perc +'%)'
														+'\n\n'+
													 '*******************************************' + '\n\n'+
													 'The Vault Space Statistics:'  
													  +'\n\n'+
													 'Please refer to the WU <'+ workunit + '> for Uncompressed file list for each user and other Vault usage statistics.'+'\n\n' +
													 
														'List of owners with the total uncompressed space, in order of byte size -' + '\n\n'+
														'OWNER     ' +'<TOTAL FILES>  '+'  Total_uncompressedSpace' + '\n'+
														GetUserList[cnt].body
														+ '\n\n'+
													'*******************************************' 
												 	+ '\n\n'+
													'Deleted files in last 7 days:'  
													 +'\n'+
													 GetDelList[cnt1].body;

								
								
EmailAlert		  := STD.System.Email.SendEmail(VaultDashboard.Constants.EmailGroup,Uspace_subject,Uspace_body);



//--------- outputs
UnComp_FilesList := output(VaultDashboard.GetFileInfo.UnComp_FilesList,all, named('Uncompressed_Files')); 
Comp_FilesList := output(VaultDashboard.GetFileInfo.Comp_FilesOwnerList,all, named('Compressed_Files_byLargestSize')); 

SendEmails := SEQUENTIAL(UnComp_FilesList,Comp_FilesList,EmailAlert);
return SendEmails;
END;

