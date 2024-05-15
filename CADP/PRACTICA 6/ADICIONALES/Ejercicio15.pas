{La cátedra de CADP está organizando la cursada para el año 2019. Para ello, dispone de una lista con
todos los alumnos que cursaron EPA. De cada alumno se conoce su DNI, apellido, nombre y la nota
obtenida. Escribir un programa que procese la información de alumnos disponible y los distribuya en
turnos utilizando los siguientes criterios:
- Los alumnos que obtuvieron al menos 8 en EPA deberán ir a los turnos 1 ó 4.
- Los alumnos que obtuvieron entre 5 y 8 deberán ir a los turnos 2, 3 ó 5.
- Los alumnos que no alcanzaron la nota 5 no se les asignará turno en CADP.
Al finalizar, el programa debe imprimir en pantalla la lista de alumnos para cada turno.
Nota: La distribución de alumnos debe ser lo más equitativa posible.}


program EJ15P6;
type 
	alumnos = record 
		DNI:Integer;
		apellido:string;
		nombre:string;
		nota:integer;
	end;
	
	lista = ^nodo; 
	nodo = record 
		data:alumnos;
		sig:lista;
	end;

procedure leer(var r:alumnos);
begin 
	with r do begin 
		writeln('DNI');
		readln(DNI);
		writeln('APELLIDO');
		readln(apellido);
		writeln('NOMBRE');
		readln(nombre);
		writeln('NOTA');
		readln(nota);
	end;
end;

procedure turnos(var L:lista; r:alumnos);
var 
	aux:lista;
begin 
	new(aux);
	aux^.data:= r;
	aux^.sig:= L;
	L:= aux;
end;
	
procedure cargardatos(var L:lista);
var 
		r:alumnos;
begin 
	leer(r);
	while (r.DNI <> 0) do begin
		turnos(L,r);
		leer(r);
	end; 
end;

procedure puntoA(L1,L4:lista; r:alumnos; var cant1,cant4:integer);
begin 
		if (r.nota >= 8) then begin 
			if (cant1 < cant4) then begin 
				turnos(L1,r);
				cant1:= cant1 + 1
			end
			else 
				turnos(L4,r);
				cant4:= cant4 + 1;
		end;
end;

procedure puntoB(L2,L3,L5:lista; var cant2,cant3,cant5:integer; r:alumnos);
begin 
		if (r.nota > 5) and (r.nota < 8) then begin 
		
			if (cant2 <= cant3) and (cant2 <= cant5) then begin 
				turnos(L2,r);
				cant2:= cant2 + 1; 
			end
			else if (cant3 <= cant2) and (cant3 <= cant5) then begin
				turnos(L3,r);
				cant3:= cant3 + 1; 
			end else begin 
				turnos(L5,r);
				cant5:= cant5 + 1;
			end;
				
		end;		
end;

procedure imprimir (L1,L2,L3,L4,L5:lista; r:alumnos);
begin 
		
	writeln('== TURNO 1 ==');
	while (L1 <> nil) do begin 
			writeln(L1^.apellido);
	L1:= L1^.sig;
	end;
	writeln('== TURNO 2 ==');
	while (L2 <> nil) do begin 
			writeln(L2^.data.apellido);
	L2:= L2^.sig;
	end;
	writeln('== TURNO 3 ==');
	while (L3 <> nil) do begin 
			writeln(L3^.data.apellido);
	L3:= L3^.sig;
	end;
	writeln('== TURNO 4 ==');
	while (L4 <> nil) do begin 
			writeln(L4^.data.apellido);
	L4:=L4^.sig;
	end;
	writeln('== TURNO 5 ==');
	while (L5 <> nil) do begin 
			writeln(L5^.data.apellido);
	L5:=L5^.sig;
	end;
	
	
end;

procedure procesardatos(L:lista);
var 
	L1, L2,L3,L4,L5:lista;
	cant1,cant2,cant3,cant4,cant5:integer;
begin 
	cant1:= 0;
	cant2:= 0;
	cant3:= 0;
	cant4:= 0;
	cant5:= 0;
	
	L1:= NIL; L2:= nil; L3:= NIL; L4:= NIL; L5:= NIL;
	
	while (L <> nil) do begin 
		puntoA(L1,L4,L^.data,cant1,cant4);
		puntoB(L2,L3,L5,cant2,cant3,cant5,L^.data);
		L:=L^.sig;
	end;
		imprimir(L1,L2,L3,L4,L5,L^.data);
end;

var 
	L:lista;
begin 
	L:= nil;
	cargardatos(L);
	procesardatos(L);
end.
