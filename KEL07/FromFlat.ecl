EXPORT FromFlat := MODULE

    EXPORT BuildMapping(from, to, source, dest, nullval) := FUNCTIONMACRO
        LOADXML('<xml/>');
        #DECLARE(f)
        #DECLARE(ktype)
        #DECLARE(ftype)
        #DECLARE(ctype)
        #DECLARE(caster)
        #SET(f, '')
        #IF(nullval = 'EPOCH')
          #APPEND(f,'SELF.'+dest+':=KEL.Era.FromDate((KEL.typ.kdate)LEFT.'+source+');')
        #ELSE
          #APPEND(f,'SELF.'+dest+'.v:=')
          #IF(nullval != '')
              #SET(kType, #GETDATATYPE(#EXPAND('(TYPEOF('+to+'.'+dest+'.v))\'\'')))
              #SET(fType, #GETDATATYPE(#EXPAND(from + '.' + source)))
              #SET(cType, #GETDATATYPE(#EXPAND(nullval)))
              #SET(caster,'')
              // bypass the cast if both the ECL field and the NULL constant are STRINGs
              #IF(%'fType'%[1..6]<>'string' OR %'cType'%[1..6]<>'string')
                  #SET(caster,'(TYPEOF('+to+'.'+dest+'.v))')
              #END
              // report an error if an integer field is given a string null
              #IF(%'kType'%[1..7]='integer' AND %'fType'%[1..7]='integer' AND %'cType'%[1..6]='string')
                  #ERROR('KEL INTEGER property '+dest+' (from ECL INTEGER '+source+') cannot be given a NULL of type STRING (\''+nullval+'\'}')
                  RETURN '';
              #END
              #APPEND(f,'IF('+%'caster'%+'LEFT.'+source+'='+nullval+',__DefaultFromItem('+to+'.'+dest+'.v),'+'(TYPEOF('+to+'.'+dest+'.v))LEFT.'+source+');')
              #APPEND(f,'SELF.'+dest+'.f:=')
              #APPEND(f,'IF('+%'caster'%+'LEFT.'+source+'='+nullval+',__NullFlag,__NotNullFlag);')
          #ELSE
              #APPEND(f,'(TYPEOF('+to+'.'+dest+'.v))LEFT.'+source+';')
              #APPEND(f,'SELF.'+dest+'.f:=')
              #APPEND(f,'__NotNullFlag;')
          #END
        #END

        RETURN %'f'%;
    ENDMACRO;

    EXPORT BuildMappingFromSpec(to, from, source, spec) := FUNCTIONMACRO
        LOADXML('<xml/>');
        #DECLARE(f)
        #DECLARE(dests)
        #DECLARE(dest)
        #DECLARE(nullval)
        #SET(f, '')
        #IF(REGEXFIND('(,|^)'+source+'\\([^)]*\\)(,|$)', spec, NOCASE))
            #SET(dests, REGEXFIND('(,|^)'+source+'\\(([^)]*)\\)(,|$)', spec, 2, NOCASE))
            #LOOP
                #IF(REGEXFIND('^([^:]+)(:([^|]+))?(\\||$)', %'dests'%))
                    #SET(dest, REGEXFIND('^([^:]+)(:([^|]+))?(\\||$)', %'dests'%, 1))
                    #SET(nullval, REGEXFIND('^([^:]+)(:([^|]+))?(\\||$)', %'dests'%, 3))
                    #APPEND(f, KEL.FromFlat.BuildMapping(to, from, source, %'dest'%, %'nullval'%))
                    #SET(dests, REGEXFIND('^[^|]*(\\|(.*))?$', %'dests'%, 2))
                #ELSE
                    #BREAK
                #END
            #END
        #END
        RETURN %'f'%;
    ENDMACRO;

    EXPORT BuildFromFlat(from,to,spec):=FUNCTIONMACRO
        LOADXML('<xml/>');
        #DECLARE(f) #SET(f,'PROJECT('+#TEXT(from)+',TRANSFORM('+#TEXT(to)+',')
        #DECLARE(prefix) #SET(prefix, '')
        #DECLARE(indataset) #SET(indataset, 0)
        #DECLARE(label)
        #DECLARE(mapping)
        #DECLARE(found)  #SET(found, 0)
        #EXPORTXML(fields,RECORDOF(from))
        #FOR(fields)
          #FOR(Field)
            #IF(%{@isRecord}%=1 AND %indataset%=0)
              #SET(prefix, %'prefix'%+%'{@label}'%+'.')
            #ELSEIF(%{@isRecord}%=1 AND %indataset%>0)
              #SET(indataset, %indataset%+1)
            #ELSEIF(%{@isDataset}%>0)
              #SET(indataset, %indataset%+1)
            #ELSEIF(%{@isEnd}%=1 AND %indataset%>=1)
              #SET(indataset, %indataset%-1)
            #ELSEIF(%{@isEnd}%=1)
              #SET(prefix, REGEXFIND('^(.*\\.)?[^.]+\\.', %'prefix'%, 1, NOCASE))
            #ELSEIF(%indataset%>=1)
              // Skip everything in child datasets
            #ELSE
              #SET(label, %'prefix'%+%'{@label}'%)
              #SET(mapping, KEL.FromFlat.BuildMappingFromSpec(#TEXT(from), #TEXT(to), %'label'%, spec))
              #APPEND(f, %'mapping'%)
              #IF(%'mapping'% != '')
                #SET(found, 1)
              #END
            #END
          #END
        #END
        #APPEND(f,'SELF:=[]))')
        #IF(%found%=0)
            #WARNING('KEL program used no fields from this input')
        #END
        RETURN %'f'%;
    ENDMACRO;

    EXPORT Convert(from,to,spec):=FUNCTIONMACRO
        RETURN #EXPAND(KEL.FromFlat.BuildFromFlat(from,to,spec));
    ENDMACRO;

 END;
