EXPORT Macros := MODULE

EXPORT 	DATASET CountUnique(File,X) := 	MACRO
																					dedup(sort(DISTRIBUTE(File),#expand(X),LOCAL),#expand(X),LOCAL)
																				ENDMACRO;
END;