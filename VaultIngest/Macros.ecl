EXPORT Macros := MODULE

EXPORT 	DATASET CountUnique(File,X) := 	MACRO
																					dedup(sort(File,#expand(X)),#expand(X))
																				ENDMACRO;
END;