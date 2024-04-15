{Realizar un programa modularizado que lea una secuencia de caracteres y verifique si cumple con el
patrón A$B#, donde:
- A es una secuencia de sólo letras vocales
- B es una secuencia de sólo caracteres alfabéticos sin letras vocales
- los caracteres $ y # seguro existen
Nota: en caso de no cumplir, informar que parte del patrón no se cumplió.}

program EJ10P2P2;

	
function puntoA(sec:char):boolean;
begin 
	if (sec = 'A') or (sec = 'E') or (sec = 'I') or (sec = 'O') or (sec = 'U') then 
		puntoA:= true;
end;

function puntoB(sec:char):boolean;
begin 
	if (sec <> 'A') and (sec <> 'E') and (sec <> 'I') and (sec <> 'O') and (sec <> 'U') then 
		puntoB:= true;
end;
var 
	sec:char;
	cumple:integer;
	i:integer;
begin 
	cumple:= 0;
	
	for i:=1 to 4 do begin 
		writeln('INGRESE CARACTERES');
		readln(sec);
		
		if (i = 1) then 
			if (puntoA(sec)) then  
				cumple:= cumple +1;
		if (i = 3) then 
			if (puntoB(sec)) then 
				cumple:= cumple +1;
		if (i = 2) then
			if (sec = '$') then 
				cumple:= cumple +1;
		if (i = 4) then 
			if (sec = '#') then 
				cumple:= cumple +1;
	end;
	
		if (cumple = 4) then  
			writeln('cumple la secuencia')
		else 
			writeln('no cumplio la secuencia');
end.

