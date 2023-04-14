PROGRAM EJ10P3;

type
	programa = record
		localidad:string;
		apellido:string;
		cantVotos:integer;
		cantcomparar:= cantcomparar +1;
		cantVotantes:integer;
		
		intcantidad:string;
		intporcentaje:string;
		
		max:integer;
		maxp:integer;
	end;

procedure leer (var c:programa);
begin
	readln(c.localidad);
	readln(c.apellido);
	readln(c.cantVotos);
	readln(c.cantVotantes);
end;

procedure mayorcantidad (var c:programa);
begin
	if (cantVotos > max) then
		max:= cantVotos;
		intcantidad:= apellido;
end;

procedure mayorporcentaje (var c:programa);
begin
	if (cantporcentaje > maxp) then
		maxp := cantVotantes;
		cantVotos/cantcomparar;

end;

var
	c:programa;

begin
	max:= -1;
	maxp:= -1;
	repeat
		leer(c);
	
	until localidad = 'zarate';

end;
