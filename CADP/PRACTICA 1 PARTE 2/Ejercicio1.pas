program EJ1P2;

var
	num1:integer;
	i: integer;
	resultado, mayor:integer;

begin
	i:= 0;
	num1:= 0;
	resultado:=0;
	mayor:= 0;
	
	for i:= 0 to 2 do begin
		readln(num1);
		if (num1 > 5) then begin
			mayor:= mayor+1;
		end;
		resultado:= num1+resultado;
		
	end;
	
	writeln('la suma de numeros es ', resultado);
	writeln('cantidad de numeros mayores: ', mayor);

end.

