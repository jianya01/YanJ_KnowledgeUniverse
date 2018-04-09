//this module reads all available log files on Vault Dali

IMPORT STD;
EXPORT ReadLogfiles := MODULE 
SHARED dFileAccess := VaultDashboard.Constants.dsVaultLogs;
  
	 // get earliest and latest access date for a file for action and user
	 rCountsRaw	:=
   record
   	dFileAccess.Action;
   	dFileAccess.UserName;
   	dFileAccess.FileName;
   	string10	EarliestDate	:=	min(group, dFileAccess.AuditDate);
   	string10	LatestDate		:=	max(group, dFileAccess.AuditDate);
   	unsigned8	Total			:=	count(group);
   end;
EXPORT dCountsRaw	:=	sort(table(dFileAccess, rCountsRaw, Action, UserName, FileName),-Total); 

// get earliest and latest access date for action and user
   rCountsUsers	:=
   record
   	dCountsRaw.Action;
   	dCountsRaw.UserName;
   	string10	EarliestDate	:=	min(group, dCountsRaw.EarliestDate);
   	string10	LatestDate		:=	max(group, dCountsRaw.LatestDate);
   	unsigned8	Total			:=	sum(group, dCOuntsRaw.Total);
   end;
EXPORT dCountsUsers	:=	sort(table(dCountsRaw, rCountsUsers, Action, UserName), -Total);
	 
// get earliest and latest access date for action and filename   
   rCountsFiles	:=
   record
   	dCountsRaw.Action;
   	dCountsRaw.FileName;
   	string10	EarliestDate	:=	min(group, dCountsRaw.EarliestDate);
   	string10	LatestDate		:=	max(group, dCountsRaw.LatestDate);
   	unsigned8	Total			:=	sum(group, dCOuntsRaw.Total);
   end;
EXPORT dCountsFiles	:=	sort(table(dCountsRaw, rCountsFiles, Action, FileName), -Total);

 DeletedFileTable:= table(dFileAccess(action='DELETED'), {string10 DateDeleted := dFileAccess.AuditDate;
   																		string20 Username := dFileAccess.UserName;
   																		string100 Filename := dFileAccess.FileName;});
   																		
   EXPORT Deleted_FileTable := SORT(DeletedFileTable,-DateDeleted);


/*  shared DeletedFileTable:= table(dFileAccess(action='DELETED'), {string10 DateDeleted := dFileAccess.AuditDate;//time;
      																		string20 Username := dFileAccess.UserName;
      																		string100 Filename := dFileAccess.FileName;//});
      																		unsigned8	Total		:=	COUNT(group)},dFileAccess.AuditDate,dFileAccess.Username,dFileAccess.Filename);
      EXPORT Deleted_FileTable := SORT(GROUP(DeletedFileTable,Filename),-DateDeleted);
      EXPORT Deleted_FileTable2 := SORT(DeletedFileTable,-DateDeleted);
*/


END;