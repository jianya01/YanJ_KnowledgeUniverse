EXPORT Macros := MODULE

EXPORT 	DATASET CountUnique(File,X) := 	MACRO
																					dedup(File,#expand(X))
																				ENDMACRO;
END;