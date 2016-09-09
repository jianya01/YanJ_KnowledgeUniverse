export MAC_Append_Id(infile,link_Field,append_field,patchfile,left_field,right_field,outfile) := macro
//-- Transform used by join below
//   If there is a new ID in the patchfile, replace the old ID.  Otherwise retain it.
#uniquename(tra)
typeof(infile) %tra%(infile l, patchfile rec) := transform
  self.append_field := if(rec.right_field<>0,rec.right_field,l.append_field); 
  self := l;
  end;
outfile := join(infile,patchfile,left.link_field=right.left_field,%tra%(left,right),left outer, smart);
endmacro;
