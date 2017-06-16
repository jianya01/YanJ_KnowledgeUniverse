EXPORT Get_Hash_Condition(ds) := FUNCTIONMACRO

   LOADXML('<xml/>');
	 #UNIQUENAME(i) 
	 #SET(i, 1)
	 #UNIQUENAME(j) 
	 #SET(j, 1)
   #DECLARE(Fieldlist)	 
	 #EXPORTXML(Fields, RECORDOF(ds))
   #FOR(Fields)
     #FOR(Field)
		   #IF((%'@isRecord'% = '1' OR %'@isDataset'% = '1') AND %i% = 1 AND %j% = 1 )
			 	 #APPEND(Fieldlist, 'left.' +#TEXT(%{@label}%) + ' , left.' + #TEXT(%{@label}%))
				 #SET(i, %i% + 1)
				 #SET(j, %j% + 1)
		   #ELSEIF((%'@isRecord'% = '1' OR %'@isDataset'% = '1') AND %j% = 1 )
			 	 #APPEND(Fieldlist, ',left.' +#TEXT(%{@label}%) + ' , left.' + #TEXT(%{@label}%))
				 #SET(j, %j% + 1)
			 #ELSEIF(%'@isRecord'% = '1' OR %'@isDataset'% = '1')
			 	 #SET(j, %j% + 1)			 			 
		   #ELSEIF(%'@isEnd'% = '1')
				 #SET(j, %j% - 1)			 
		   #ELSEIF(%i% = 1 )
			 	 #APPEND(Fieldlist, 'left.' +#TEXT(%{@label}%))
				 #SET(i, %i% + 1)
			 #ELSEIF(%'{@isEnd}'% = '' AND %j% = 1 )
			 	 #APPEND(Fieldlist, ',left.' +#TEXT(%{@label}%))
			 #END
     #END
   #END

   RETURN %'Fieldlist'%;

ENDMACRO;
