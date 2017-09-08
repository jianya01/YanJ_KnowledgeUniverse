IMPORT SALT38;
EXPORT MatchHistory := MODULE
EXPORT id_shift_r := RECORD
    SALT38.UIDType vault_rid;
    SALT38.UIDType _before;
    SALT38.UIDType _after;
    UNSIGNED6 change_date;
  END;
EXPORT MatchHistoryName := '~keep::I_Criminal_Offender::::MatchHistory';
EXPORT MatchHistoryFile := DATASET(MatchHistoryName,id_shift_r,THOR); // Read in all the change history
EXPORT MatchHistoryKeyName := '~'+'key::I_Criminal_Offender::::History::Match';
EXPORT MatchHistoryKey := INDEX(MatchHistoryFile,{_after},{MatchHistoryFile},MatchHistoryKeyName);
EXPORT BuildAll := BUILDINDEX(MatchHistoryKey, OVERWRITE);
END;

