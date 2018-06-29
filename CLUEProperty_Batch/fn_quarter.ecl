EXPORT fn_quarter := module


export fn_Current_quarter(string8 dateinp) := function
res := MAP(dateinp[5..6] in ['01','02','03'] => dateinp[1..4]+'Q1',
           dateinp[5..6] in ['04','05','06'] => dateinp[1..4]+'Q2',
					 dateinp[5..6] in ['07','08','09'] => dateinp[1..4]+'Q3',
					 dateinp[1..4]+'Q4');

return res;
end;

export fn_Previous_quarter(string8 dateinp) := function
res := MAP(dateinp[5..6] in ['01','02','03'] => (string4)((integer)dateinp[1..4]-1)+'Q4',
           dateinp[5..6] in ['04','05','06'] => dateinp[1..4]+'Q1',
					 dateinp[5..6] in ['07','08','09'] => dateinp[1..4]+'Q2',
					 dateinp[1..4]+'Q3');

return res;
end;
end;