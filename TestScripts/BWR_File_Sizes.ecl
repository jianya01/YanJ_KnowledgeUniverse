#workunit('name', 'Examine File Sizes');

IMPORT STD, Vault;

allFileStats := 
Vault.FileUtil.getFileSizeStats('~thor::sv::clueauto_poc::response::final') +
Vault.FileUtil.getFileSizeStats('~thor::sv::clueproperty_poc::response::final');

OUTPUT(CHOOSEN(allFileStats, 500), NAMED('All_File_Stats'));
OUTPUT(Vault.FileUtil.combineFileSizeStats(allFileStats), NAMED('Combined_File_Stats'));