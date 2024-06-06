{Una maternidad dispone información sobre sus pacientes. De cada una se conoce: nombre, apellido y peso
registrado el primer día de cada semana de embarazo (a lo sumo 42). La maternidad necesita un programa
que analice esta información, determine e informe:
a. Para cada embarazada, la semana con mayor aumento de peso.
b. El aumento de peso total de cada embarazada durante el embarazo}

program EJ4P7;
const 
	dimf = 42;
type 

	paciente = record 
		nombre:string;
		apellido:string;
		peso:real;
	end;
	
	lista = ^nodo; 
	nodo = record 
		data:paciente;
		sig:lista;
	end;
	
	vector = array [1..dimf] of real;
	

procedure leer(var r:paciente);    
var 
	diml:integer; pesoAux:integer;
	total:integer;
begin 
	with r do begin 
		diml:= 0;
		readln(nombre);
		readln(apellido);
		readln(pesoAux);
		while (diml < dimf) and (peso <> 0) do begin 
			diml:= diml +1;
			peso[diml]:= pesoAux;
			readln(pesoAux);
		end;
		
		
	end;
end;

procedure armarlista(var L:lista; r:paciente);
var 
	nue:lista;
begin 
	new(nue);
	nue^data:= r;
	nue^.sig:= L;
	L:= nue;
end;

procedure cargardatos(var L:lista);
var 
	r:paciente; i:integer;
begin 
	leer(r);
	for i:=1 to 100 do begin 
		armarlista(L,r);
		leer(r);
	end;
end;	

procedure procesardatos(L:lista);
var 
	v:vector; i,p1:integer; max:real;
begin 
	
	inivector(v,vs);
	while (L <> nil) do begin 
		p1:= 0;
		total:= 0;
		for i:= 1 to L^.data.diml do begin 
			//punto A
			if (L^.data.peso[i] > max) then begin 
				max:= L^.data.peso[i];
				p1:= i;
			end;
			
			writeln(p1);
			writeln(total);
	L:= L^.sig;
	end;
	
end;
	
	
var
	L:lista;
begin 
	L:= nil;
	cargardatos(L);
	procesardatos(L);
end.
