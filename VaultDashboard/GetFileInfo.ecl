// this module retrieves the filenames and other file stats on Vault
IMPORT STD;
EXPORT GetFileInfo := MODULE

SHARED dsThorFiles := VaultDashboard.Constants.dsThorFiles;

//uncompressed files 
shared UnCompFiles0 := dsThorFiles(isCompressed = FALSE);																	
				UnCompFiles := TABLE(UnCompFiles0,{STRING25 Owner := UnCompFiles0.owner,
																					string Filename := UnCompFiles0.name,
																					unsigned8 UncompressedSize:= UnCompFiles0.actualsize
																					});	
EXPORT UnComp_FilesList := SORT(UnCompFiles,-UncompressedSize,-owner);	

//Largest compressed files 
shared CompFiles0 := dsThorFiles(isCompressed = TRUE);																	
				CompFiles := TABLE(CompFiles0,{STRING25 Owner := CompFiles0.owner,
																					string Filename := CompFiles0.name,
																					unsigned8 compressedSize:= CompFiles0.actualsize
																					});	
EXPORT Comp_FilesOwnerList := SORT(CompFiles,-compressedSize,-owner);																																	
//User space analysis
					VUser := TABLE(dsThorFiles,{STRING25 Owner := dsThorFiles.owner, 
															real actualSpace := SUM(GROUP,actualSize),
															real actualSpace_in_GB := round(SUM(GROUP,actualSize)/1073741824,3),
															real uncompressedSpace:= SUM(GROUP,actualSize ,dsThorFiles.isCompressed = FALSE),
															real compressedSpace := SUM(GROUP,actualSize ,dsThorFiles.isCompressed = TRUE)},Owner,MERGE);

EXPORT UserSpaceAnalysis := SORT(VUser,-uncompressedSpace);
//List of uncompressed files summary
					UnComp_Files := TABLE(dsThorFiles(isCompressed = FALSE),
															{STRING25 Owner := dsThorFiles.owner, 
															string Filename := dsThorFiles.name,
															real uncompressedSize:= SUM(GROUP,actualSize)},Owner,name,MERGE);
															
EXPORT UnComp_FileList := SORT(UnComp_Files,-uncompressedSize);

//Count of uncompressed files per owner
					UnComp_FilesOwner := TABLE(dsThorFiles(isCompressed = FALSE),
														{STRING25 Owner := dsThorFiles.owner, 
															UNSIGNED8	TotalFiles			:=	count(group),
															unsigned8 Total_uncompressedSize:= SUM(GROUP,actualSize),
															unsigned8 Total_uncompSize_GB:= round(SUM(GROUP,actualSize)/1073741824,3)},Owner,MERGE);

EXPORT UnComp_FileOwnerList := SORT(UnComp_FilesOwner,-Total_uncompressedSize);

//Cluster space analysis															
					VClusters:= TABLE(dsThorFiles,{  STRING30 Cluster:= dsThorFiles.cluster, 
															unsigned8 actualSpace := SUM(GROUP,actualSize),
															unsigned8 uncompressedSpace:= SUM(GROUP,actualSize ,dsThorFiles.isCompressed = FALSE),
															unsigned8 compressedSpace := SUM(GROUP,actualSize ,dsThorFiles.isCompressed = TRUE)},Cluster,MERGE);


EXPORT ClusterSpaceAnalysis := SORT(VClusters,-uncompressedSpace);

//get max and min filesize for a owner and total no. of files
MinMaxSizes	:=
   RECORD
   	dsThorFiles.owner;
   	INTEGER	MaxSize	:=	max(group, dsThorFiles.actualSize);
   	INTEGER	MinSize		:=	min(group, dsThorFiles.actualSize);
   	UNSIGNED8	TotalFiles			:=	count(group);
   end;
EXPORT MinMaxFileSizes	:=	sort(table(dsThorFiles, MinMaxSizes, owner,MERGE),-MaxSize); 
	 
//get access frequency- used for trend analysis
 //separate date and time 
  	rTokens	:=
      record
      	string10	ModifyDate;
				string2 ModifyMonth;
				string4 ModifyYear;
				string10 AccessDate;
				string2 AccessMonth;
				string4 AccessYear;
      	VaultDashboard.Layouts.FileStats;
      end;
    rTokens	tToTokens(dsThorFiles pInput)	:=
      transform
      	self.ModifyDate	:=	pInput.modified[1..10];
      	self.ModifyMonth	:=	pInput.modified[6..7];
      	self.ModifyYear :=	pInput.modified[1..4];
				self.AccessDate	:=	pInput.Accessed[1..10];
      	self.AccessMonth	:=	pInput.Accessed[6..7];
      	self.AccessYear :=	pInput.Accessed[1..4];
      	self			:=	pInput;
      end;
dFileAccess0	:=	PROJECT(dsThorFiles, tToTokens(left)); 
EXPORT FileAccess	:=	SORT(dFileAccess0, -AccessYear, AccessMonth); 


END;