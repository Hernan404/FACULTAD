

program EJ9P1;

var
	car1:char;
	num:integer;
	resultado:integer;
	primeraVez:boolean;
	
begin
	resultado:= 0;
	primeraVez:= true;
	
	readln(car1);
	
	if (car1 = '+') or (car1 = '-') then begin
		readln(num);
		while (num <> 0) do begin
			if (car1 = '+') then
				resultado:= resultado+num
			else if (primeraVez) then begin
				resultado:=num;
				primeraVez:=false;
			end
			else
			resultado:= resultado-num;
			readln(num);
	
		end;
			
		writeln('el resultado es: ', resultado);
	
	
	
	end;
	
	writeln('error');
end.
