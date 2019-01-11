//HPCC Systems KEL Compiler Version 0.11.6
#OPTION('expandSelectCreateRow',true);
IMPORT KEL011 AS KEL;
IMPORT * FROM KEL011.Null;
IMPORT * FROM KnowledgeUniverse.VehicleHistoryReport_KEL;
IMPORT * FROM transaction_log;
IMPORT * FROM transaction_log_vehicle;

IMPORT inquiry_history.IntermediateLog;
OUTPUT(Q_Inquiry_Dump.Res0,NAMED('InquiryDump_0'));
OUTPUT(Q_Vehicle_Dump.Res0,NAMED('VehicleDump_0'));
OUTPUT(Q_Events_Dump.Res0,NAMED('EventsDump_0'));
OUTPUT(Q_Owners_Dump.Res0,NAMED('OwnersDump_0'));

OUTPUT(IntermediateLog.VHR, NAMED('VHR'));
OUTPUT(IntermediateLog.Vehicles, NAMED('Vehicles'));
OUTPUT(IntermediateLog.Events, NAMED('Events'));
OUTPUT(IntermediateLog.Owners, NAMED('Owners'));
OUTPUT(TransactionLog, NAMED('TransactionLog'));
OUTPUT(TransactionLogVehicle, NAMED('TransactionLogVehicle'));