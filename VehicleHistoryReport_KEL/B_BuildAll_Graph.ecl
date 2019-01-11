//HPCC Systems KEL Compiler Version 0.11.6
IMPORT KEL011 AS KEL;
IMPORT B_Events,B_Inquiry,B_Owners,B_Vehicle FROM KnowledgeUniverse.VehicleHistoryReport_KEL;
IMPORT * FROM KEL011.Null;
EXPORT B_BuildAll_Graph := MODULE
  EXPORT Indexes := DATASET([
    {'Events_UID',B_Events.IDX_Events_UID_Name,B_Events.IDX_Events_UID_Name},
    {'Inquiry_UID',B_Inquiry.IDX_Inquiry_UID_Name,B_Inquiry.IDX_Inquiry_UID_Name},
    {'Owners_UID',B_Owners.IDX_Owners_UID_Name,B_Owners.IDX_Owners_UID_Name},
    {'Vehicle_UID',B_Vehicle.IDX_Vehicle_UID_Name,B_Vehicle.IDX_Vehicle_UID_Name}]
  ,{KEL.typ.str indexName,KEL.typ.str logicalName,KEL.typ.str superName});
  EXPORT BuildAll := PARALLEL(B_Events.BuildAll,B_Inquiry.BuildAll,B_Owners.BuildAll,B_Vehicle.BuildAll);
END;
