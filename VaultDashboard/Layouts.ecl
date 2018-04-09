EXPORT Layouts := MODULE

export logfilelist := RECORD
											String LogFiles;
											END;

export logDir := RECORD
									string name{maxlength(1023)};
									integer8 size;
									string19 modified;
									string date;
									string filename_date;
END;

EXPORT rCSVRaw	:= RECORD
										string		AuditDateTime;
										string10	FileAccess;
										string10	Activity;
										string10	Action;
										string20	ClusterRun;
										string20	UserName;
										string100	FileName;
										string30	WUID;
										string10	GraphID;
										unsigned8	Bytes;
										unsigned2	IDoNotKnow;
										string20	ClusterLoc;
									END;
									
export rCSVRaw_1:= 	record	rCSVRaw - Action;		end;	
				
EXPORT rTokens	:=RECORD
										string10	AuditDate;
										string8		AuditTime;
										string25	Action;
										rCSVRaw_1;
									 END;
EXPORT rTokens2	:=RECORD
										string		AuditDateTime;
										string10	AuditDate;
										string8		AuditTime;
										string10	FileAccess;
										string10	Activity;
										string10	Action;
										string20	ClusterRun;
										string20	UserName;
										string100	FileName;
										string30	WUID;
										string10	GraphID;
										string20	ClusterLoc;
									 END;									
EXPORT FileStats	:= RECORD
												string name;
												boolean superfile;
												integer8 size;
												integer8 rowcount;
												string19 modified;
												string owner{maxlength(255)};
												string cluster{maxlength(255)};
												boolean isCompressed; 
												unsigned compressedSize; 
												REAL compressionRatio;
												unsigned actualSize;
												string19 Accessed;
										END;
									
END;
