export fnAddSource(dataset(ConsumershellInquiryfiles.CommonLayout) infile, string strsource) := function

addsource_layout := record ConsumershellInquiryfiles.CommonLayout, string source, end;

pr := project(infile, transform(addsource_layout,
																	self.source := strsource,
																	self := left));
																	
return pr;
end;

