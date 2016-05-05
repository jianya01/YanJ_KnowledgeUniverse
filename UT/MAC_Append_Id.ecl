// If there is a new ID in the patchfile, replace the old ID.  Otherwise retain it.
EXPORT MAC_Append_Id(infile,link_Field,append_field,patchfile,left_field,right_field,outfile) := MACRO
	#UNIQUENAME(tra)
	
	TYPEOF(infile) %tra%(infile l, patchfile rec) := TRANSFORM
		SELF.append_field := IF(rec.right_field<>0, rec.right_field, l.append_field); 
		SELF := l;
	END;
	outfile := JOIN(
		infile, patchfile,
		LEFT.link_field=RIGHT.left_field,
		%tra%(LEFT,RIGHT),
		LEFT OUTER, SMART);
ENDMACRO;
