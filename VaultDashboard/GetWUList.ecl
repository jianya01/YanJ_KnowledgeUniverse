IMPORT STD;

EXPORT GetWUList := MODULE

SHARED ds:= STD.System.Workunit.WorkunitList('60');

   rgetOwnerCount := 
			 record
			 ds.owner;
			 ds.state;
			 totalWU := count(group);
   end;
   
EXPORT   dgetWUOwnerCount := sort(table(ds, rgetOwnerCount, owner, state),-totalWU); 
 
   
   rgetOwnerDates := 
   record
			 ds.owner;
			 MaxDate := max(group, ds.wuid[2..9]);
			 MinDate := min(group, ds.wuid[2..9]);
			 totalWU := count(group);
   end;
   
EXPORT   dgetWUOwnerDates := sort(table(ds(owner <>''), rgetOwnerDates, owner),-totalWU); 
   
END;