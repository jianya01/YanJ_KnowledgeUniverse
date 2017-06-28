EXPORT SALT_Ingest_Create_SPC(inputFile,outputFile) := MACRO
#uniquename(bneg)
%bneg%(STRING S) := IF ((INTEGER)S>0,S,'');
LOADXML('<xml/>');
#EXPORTXML(doCleanFieldMetaInfo, recordof(inputFile))
outputFile := dataset([
'OPTIONS:-gn',
'MODULE:<EnterModuleNameHere>',

'FILENAME:Vault',
'INGESTFILE:OFPU:NAMED(Source)',
'RIDFIELD:vault_rid',
'SOURCERIDFIELD:<EnterUniqueKey>',
'FIELD:vault_date_first_seen:RECORDDATE(FIRST):',
'FIELD:vault_date_last_seen:RECORDDATE(LAST):',

'INGESTMODE:NONCONTIGUOUS(vault_date_first_seen,vault_date_last_seen)',

'',
#IF (%'doCleanFieldText'%='')
	#DECLARE(doCleanFieldText)
#END
#SET (doCleanFieldText, false)
#FOR (doCleanFieldMetaInfo)
	#DECLARE(thisChild)
	#SET(thisChild,'')
	#FOR (Field)
		#IF(%'@isDataset'%='1')
			#SET(thisChild,%'@name'%)
		#ELSEIF(%'@isEnd'%='1')
			#SET(thisChild,'')
		#ELSE
			#DECLARE(thisSize)
			#IF(%@size% > 0 and %'@type'% = 'unicode')
				#SET(thisSize, (INTEGER)(%@size%/2))
			#ELSEIF(%@size% > 0 and %'@type'% = 'varunicode')
				#SET(thisSize, (INTEGER)((%@size%-2)/2))		
			#ELSE
				#SET(thisSize,%@size%)
			#END
			#IF(%'thisChild'%='')
				#SET (doCleanFieldText, 'FIELD:' + %'@name'% + ':TYPE(' + Stringlib.StringToUpperCase(%'@type'%) + %bneg%(%'thisSize'%) + '):0,0')
			#ELSE
				#SET (doCleanFieldText, 'FIELD:' + %'@name'% + ':MULTIPLE(LIST(' + %'thisChild'% + '),ANY):KEEP(2):TYPE(' + Stringlib.StringToUpperCase(%'@type'%) + %bneg%(%'thisSize'%) + '):0,0')
			#END
			%'doCleanFieldText'%,
		#END
	#END
#END
''
],{STRING s});
ENDMACRO;
