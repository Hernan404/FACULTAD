program JugamosConListas;
type
	lista = ^nodo;
	nodo = record
	num : integer;
	sig : lista;
end;
procedure armarNodo(var L: lista; v: integer);
var
	aux : lista;
begin
	new(aux);
	aux^.num := v;
	aux^.sig := L;
	L := aux;
end;

procedure puntoD(L:lista; numD:integer);
begin 
	readln(numD);
	while (L <> nil) do begin 
		L^.num:= L^.num + numD; 
		L:= L^.sig;
	end;
end;

procedure imprimir (L:lista; num:integer);
begin 
	while (L <> nil) then  
		writeln(L^.num);
		L:= L^.sig;
end; 

var
	pri : lista;
	valor : integer;
begin
	pri := nil;
	writeln('Ingrese un numero');
	read(valor);
	while (valor <> 0) do begin
		armarNodo(pri, valor);
		writeln('Ingrese un numero');
		read(valor);
	end;
	puntoD(pri,valor);
	
	imprimir(pri,valor);
	
end.
