program EJ4P7;
type 
	semanas = 1..42;
	pacientes = record 
		nombre:string;
		apellido:string;
		peso:semanas;
	end;
	lista = ^nodo;
	nodo = record 
		data:pacientes;
		sig:lista;
	end;
	
	vector = array [semanas] of integer;

procedure leer (var r:pacientes);
var 
	pesoaux:integer
begin 
	diml:= 0;
	with r do begin 
		readln(apellido);
		readln(nombre);
		readln(peso);
		
		while (diml < dimf) and (pesoAux <> 0) do begin 
			diml:= diml +1;
			diml:= diml +1;
			peso[diml]:= pesoaux;
			readln(pesoaux);
		end;


	end;

procedure procesardatos(L:lista);
var 
	v:vector; i:integer; p1:real;
begin 
	p1:= 0;
	while (L <> nil) do begin 
		
		for i:=1 to semanas do begin 
			if (v[L^.data.peso] > max) then begin 
				max:= v[L^.data.peso];
				p1:= i;
			end;
		end;
		writeln('la semana com mayor aumento de peso para esta embarazada: ', p1);
		total:= L^.data.peso[i] + total;
		
	end;
end;

var 
	L:lista;
begin 
	L:= nil;
	cargardatos(L);
	procesardatos(L);
end.

