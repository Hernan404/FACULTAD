procedure subrutina (numA,numB:LongInt; var paresM, pares_total: integer );
var
	espar:boolean;


begin
	while (numA <> 0) and (numB <> 0) do begin
			readln(numA);
			readln(numB);
		
			if (numA mod 2 = 0) and (numB mod 2 = 0) then 
				pares_total:= pares_total +1;
				espar:= true;
					if (numB = numA *2) and (espar = true ) then
						paresM:= paresM +1
			else 
				espar:= false;
			
					
	end;


end;



var
	numA,numB:LongInt ;
	paresM, pares_total: integer;
	
	
begin
	
		readln(numA);
		readln(numB);
		
		subrutina(numA,numB,paresM,pares_total);
		
	
				
	writeln(pares_total,',',paresM);
end.
