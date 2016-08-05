EXPORT GetCompareCondition(ds, childreclocation, ExcludeFields) := FUNCTIONMACRO

   LOADXML('<xml/>');
	 #UNIQUENAME(i) 
	 #SET(i, 1)
	 #UNIQUENAME(j) 
	 #SET(j, 1)
   #DECLARE(Fieldlist)	 
	 #EXPORTXML(Fields, RECORDOF(ds))
   #FOR(Fields)
     #FOR(Field)
		   #IF((%'@isRecord'% = '1') AND %i% = 1 AND %j% = 1 AND #TEXT(%{@label}%) NOT IN ExcludeFields)
			 	 #APPEND(Fieldlist, ' row(vault_le.' +#TEXT(%{@label}%) + ',' + childreclocation + '.' +  #TEXT(%{@ecltype}%) + ')' + ' = row([],' + childreclocation + '.' + #TEXT(%{@ecltype}%) + ')')
				 #SET(i, %i% + 1)
				 #SET(j, %j% + 1)
		   #ELSEIF((%'@isRecord'% = '1') AND %j% = 1 AND #TEXT(%{@label}%) NOT IN ExcludeFields)
			 	 #APPEND(Fieldlist, ' and row(vault_le.' +#TEXT(%{@label}%) + ',' + childreclocation + '.' +  #TEXT(%{@ecltype}%) + ')' + ' = row([],' + childreclocation + '.' + #TEXT(%{@ecltype}%) + ')')
				 #SET(j, %j% + 1)
		   #ELSEIF((%'@isDataset'% = '1') AND %i% = 1 AND %j% = 1 AND #TEXT(%{@label}%) NOT IN ExcludeFields)
			 	 #APPEND(Fieldlist, 'not exists(vault_le.' +#TEXT(%{@label}%) + ')')
				 #SET(i, %i% + 1)
				 #SET(j, %j% + 1)
		   #ELSEIF((%'@isDataset'% = '1') AND %j% = 1 AND #TEXT(%{@label}%) NOT IN ExcludeFields)
			 	 #APPEND(Fieldlist, ' and not exists(vault_le.' +#TEXT(%{@label}%) + ')')
				 #SET(j, %j% + 1)				 
			 #ELSEIF(%'@isRecord'% = '1' OR %'@isDataset'% = '1')
			 	 #SET(j, %j% + 1)			 			 
		   #ELSEIF(%'@isEnd'% = '1')
				 #SET(j, %j% - 1)			 
		   #ELSEIF(%i% = 1 AND %j% = 1 AND #TEXT(%{@label}%) NOT IN ExcludeFields)
				 #APPEND(Fieldlist, 'vault_le.' +#TEXT(%{@label}%) + ' = (typeof(vault_le.' + #TEXT(%{@label}%) + '))\'\'')
				 #SET(i, %i% + 1)
			 #ELSEIF(%'{@isEnd}'% = '' AND %j% = 1 AND #TEXT(%{@label}%) NOT IN ExcludeFields)
				 #APPEND(Fieldlist,' and vault_le.' +#TEXT(%{@label}%) + ' = (typeof(vault_le.' + #TEXT(%{@label}%) + '))\'\'')
			 #END
     #END
   #END

   RETURN %'Fieldlist'%;

ENDMACRO;