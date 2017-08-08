export fnAddSource(dataset(Inquiry_AccLogs.CommonLayout) infile, string strsource) := function

addsource_layout := record Inquiry_AccLogs.CommonLayout, string source, end;

pr := project(infile, transform(addsource_layout,
																	self.source := strsource,
																	self := left));
																	
return pr;
end;

