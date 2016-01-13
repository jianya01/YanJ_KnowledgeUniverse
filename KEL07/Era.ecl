IMPORT KEL07 AS KEL;
IMPORT * FROM KEL07.Null;
EXPORT Era := MODULE

  EXPORT SimpleRoll(__base, __epoch, __op, __nullMin) := FUNCTIONMACRO
    LoadXml('<xml/>');
    #DECLARE(null)
    #IF(__nullMin)
      #SET(null, KEL.Typ.MINEPOCH)
    #ELSE
      #SET(null, KEL.Typ.MAXEPOCH)
    #END

    #IF(#TEXT(__base) = 'GROUP')
      LOCAL __cond := EXISTS(__base, __epoch != 0);
    #ELSE
      LOCAL __cond := EXISTS(__base(__epoch != 0));
    #END

    RETURN IF(__cond, __op(__base, IF(__epoch=0, %null%, __epoch)), 0);
  ENDMACRO;

  EXPORT FlatRoll(__base, __epoch, __layout) := FUNCTIONMACRO
    RETURN PROJECT(__base, __layout)(__epoch!=0);
  ENDMACRO;

  EXPORT FlatRollSingleRow(__base, __epoch, __layout) := FUNCTIONMACRO
    RETURN PROJECT(DATASET(__base), __layout)(__epoch!=0);
  ENDMACRO;

  EXPORT ShapedRoll(__base, __epoch) := FUNCTIONMACRO
    RETURN DEDUP(NORMALIZE(__base, LEFT.__epoch, TRANSFORM(RECORDOF(LEFT.__epoch), SELF:=RIGHT)), WHOLE RECORD, ALL);
  ENDMACRO;

  EXPORT INTEGER FromDate(KEL.typ.kdate pdate) := FUNCTION
    RETURN IF(pdate=0,0,KEL.Routines.ToDaysSince1900(pdate));
  END;

  EXPORT FromNDate(pdate) := FUNCTIONMACRO
    RETURN IF(__NL(pdate),0,KEL.Routines.ToDaysSince1900(__T(pdate)));
  ENDMACRO;

  EXPORT KEL.typ.nkdate ToDate(KEL.typ.epoch epoch) := FUNCTION
    RETURN __BN3(IF(epoch=0,0,KEL.Routines.FromDaysSince1900(epoch)),epoch=0,KEL.typ.nkdate);
  END;

  EXPORT KEL.typ.nkdate ToDateMinNull(KEL.typ.epoch epoch) := FUNCTION
    RETURN __CN2(IF(epoch=0,KEL.typ.MINEPOCH,KEL.Routines.FromDaysSince1900(epoch)),KEL.typ.nkdate);
  END;

  EXPORT KEL.typ.nkdate ToDateMinMax(KEL.typ.epoch epoch) := FUNCTION
    RETURN __CN2(IF(epoch=0,KEL.typ.MAXEPOCH,KEL.Routines.FromDaysSince1900(epoch)),KEL.typ.nkdate);
  END;

END;
