//HPCC Systems KEL Compiler Version 0.11.6
IMPORT KEL011 AS KEL;
IMPORT B_Address,B_Drivers_License,B_Inquiry,B_Person,B_Vehicle FROM KnowledgeUniverse.VehicleHistoryReport_KEL;
IMPORT * FROM KEL011.Null;
EXPORT B_BuildAll_Graph := MODULE
  EXPORT Indexes := DATASET([
    {'Address_UID',B_Address.IDX_Address_UID_Name,B_Address.IDX_Address_UID_Name},
    {'Drivers_License_UID',B_Drivers_License.IDX_Drivers_License_UID_Name,B_Drivers_License.IDX_Drivers_License_UID_Name},
    {'Inquiry_UID',B_Inquiry.IDX_Inquiry_UID_Name,B_Inquiry.IDX_Inquiry_UID_Name},
    {'Person_UID',B_Person.IDX_Person_UID_Name,B_Person.IDX_Person_UID_Name},
    {'Vehicle_UID',B_Vehicle.IDX_Vehicle_UID_Name,B_Vehicle.IDX_Vehicle_UID_Name}]
  ,{KEL.typ.str indexName,KEL.typ.str logicalName,KEL.typ.str superName});
  EXPORT BuildAll := PARALLEL(B_Address.BuildAll,B_Drivers_License.BuildAll,B_Inquiry.BuildAll,B_Person.BuildAll,B_Vehicle.BuildAll);
END;
