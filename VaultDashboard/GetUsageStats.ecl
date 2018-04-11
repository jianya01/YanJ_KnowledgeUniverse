// log files data
	 output(VaultDashboard.ReadLogfiles.dCountsRaw,all,named('FilesAccessUser')); 
   output(VaultDashboard.ReadLogfiles.dCountsUsers,all,named('FilesAccessUserCounts')); 
   output(VaultDashboard.ReadLogfiles.dCountsFiles,all,named('FilesByAction')); 
   output(VaultDashboard.ReadLogfiles.Deleted_FileTable,all,named('Deleted_FileTable')); 
   //fileInfo
	 output(VaultDashboard.GetFileInfo.UserSpaceAnalysis,all,named('UserSpaceAnalysis')); 
   output(VaultDashboard.GetFileInfo.ClusterSpaceAnalysis,all,named('ClusterSpaceAnalysis')); 
   output(VaultDashboard.GetFileInfo.MinMaxFileSizes,all,named('MinMaxFileSizes')); 
   // wu list
   output(VaultDashboard.GetWUList.dgetWUOwnerCount,all,named('WU_Count_byOwner')); 
   output(VaultDashboard.GetWUList.dgetWUOwnerDates,all,named('WU_byOwner_dates')); 
   //filetypes
   output(VaultDashboard.GetFileTypes.FiletypeCounts,all,named('Filetypes_Counts')); 
