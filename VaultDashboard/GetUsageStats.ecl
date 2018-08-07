// log files data
	 output(VaultDashboard.ReadLogfiles.dCountsRaw,named('FilesAccessUser')); 
   output(VaultDashboard.ReadLogfiles.dCountsUsers,named('FilesAccessUserCounts')); 
   output(VaultDashboard.ReadLogfiles.dCountsFiles,named('FilesByAction')); 
   output(VaultDashboard.ReadLogfiles.Deleted_FileTable,named('Deleted_FileTable')); 
   //fileInfo
	 output(VaultDashboard.GetFileInfo.UserSpaceAnalysis,named('UserSpaceAnalysis')); 
   output(VaultDashboard.GetFileInfo.ClusterSpaceAnalysis,named('ClusterSpaceAnalysis')); 
   output(VaultDashboard.GetFileInfo.MinMaxFileSizes,named('MinMaxFileSizes')); 
   // wu list
   output(VaultDashboard.GetWUList.dgetWUOwnerCount,named('WU_Count_byOwner')); 
   output(VaultDashboard.GetWUList.dgetWUOwnerDates,named('WU_byOwner_dates')); 
   //filetypes
   output(VaultDashboard.GetFileTypes.FiletypeCounts,named('Filetypes_Counts')); 
