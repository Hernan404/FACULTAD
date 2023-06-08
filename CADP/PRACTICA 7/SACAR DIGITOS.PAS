procedure digito(var L:lista);
var 
	dig:integer;
	contNueve:integer;
	cumple:boolean;
begin 
	cumple:= false;
	contNueve:= 0;

	while (L^datos.dni <> 0) and (cumple <> true) do begin 
		dig:= ^.datos.DNI mod 10;
		if (dig = 9) then begin 
			contNueve:= contNueve +1;
		end;
		if (contNueve = 2) then begin 
			cumple:= true;
		end;
		dig:= dig div 10;
	end;
end;
