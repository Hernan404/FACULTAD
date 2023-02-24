program EJ2P1P2;

var
	i,num,resultado,max:integer;

begin
	i:= 0;
	num:= 0;
	resultado:= 0;
	max:= -999;
	
	
	for i := 1 to 10 do begin
		readln(num);
		
			if (num > max) then begin
				max:= num; 
				resultado:= i+resultado;
			end			
	end;
		
		writeln('el mayor es ', max, 'en la posicion ', resultado);
end.
