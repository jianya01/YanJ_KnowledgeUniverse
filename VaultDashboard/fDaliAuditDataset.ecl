IMPORT STD;
EXPORT fDaliAuditDataset(string pDateString)	:=	dataset(STD.File.ExternalLogicalFileName(VaultDashboard.Constants.lDaliIP, VaultDashboard.Constants.lDaliAuditPath + '/DaAudit.' + pDateString + '.log'),VaultDashboard.layouts.rCSVRaw, csv(quote([]), terminator('\n'), separator(',')));

