program EJ1P7; 
type 
	actores = record 
		DNI:integer;
		nombre:string;
		edad:integer;
		codigo:integer; 
	end;

	lista = ^nodo;
	nodo = record 
		data:actores;
		sig:lista;
	end; 

vector = array [1..7] of integer;

procedure cargarLista (var L:lista; D:data);
var 
	D:data;
begin 
	leer(D);
	repeat 
		armarnodo(L,D);
		leer(D);
		loscodigos(D,v);
	until (D.dni <> 3);
end;

procedure cargarV (v:vector); 
var 
	i:integer;
begin 
	for i:=1 to 5 do begin 
		v[i]:= 0;
	end;
end;

procedure armarnodo(L:lista; D:data);
var 
	aux:lista;
begin 
	new(aux);
	aux^.data:= D;
	aux^.sig:= L;
	L:= aux;
end; 

procedure leer (D:dato);
begin
	with D do begin 
	repeat
		readln(DNI);
		readln(nombre);
		readln(edad);
		readln(codigo);
		armarnodo(L,D);
		loscodigos(D);
	until (DNI = 33555444);
	end;
end;

procedure par_o_impar (var D:data);
begin 
	digitos:= DNI mod 10;
	
	if (digito mod 2 = 0) then 
		par:= par +1
	else 
		impar := impar +1;
end;

procedure loscodigos (var D:data);
with D do begin 
	if (codigo = 'drama') then
		v[1]:= v[1]+1;
	if (codigo = 'romantico') then
		v[2]:= v[2]+1;
	if (codigo = 'accion') then
		v[3]:= v[3]+1;
	if (codigo = 'suspenso') then
		v[4]:= v[4]+1;
	if (codigo = 'terror') then
		v[5]:= v[5]+1;
end;

procedure maximos (var D:data; var v:vector; var max1,max2:integer);
var 
	i:integer;
begin 
	for i:=1 to 5 do begin
		if (v[i] > max1) then 
			max1:= v[i]
			max2:= max2;
			else if v[i] > max2 then 
				max2:= v[i];
	end;
end;

procedure estructura (var D:data; var L:Lista; DNIB:integer);
begin 
	writeln('ingrese DNI que quiere buscar y eliminar');
	readln(DNIB);
	buscar(L,DNIB);
end;

function busca (L:lista;  DNIB:integer);
var 
	encontre:boolean;
begin 
	encontre:= false;
	while(L <> nil) and (not encontre) do begin 
		if(DNIB = L^.dato) then 
			encontre:=true;
		else 
			encontre:= false;
	end;
	busca:= encontre;
	eliminar(pri,datos,dnib,exito);
end;

procedure eliminar (pri:lista; datos:data; DNIB:integer; var exito:boolean);
var 
	ant,act:lista;
begin 
	exito:= false;
	act:= pri;
	while (act <> nil) and (act^datos.DNI <> DNIB) do begin 
		ant:= act;
		act:= act^.sig
	end;
	if (act <> NIL) then begin 
		exito:= true;
		if (act = pri) then 
			pri:= act^.sig;
			writeln('el DNI fue eliminado')
		else 
			ant^.sig:= act^.sig;
		dispose(act);
	end;
end;
end;




var 
	par,impar:integer;
	max1,max2:integer;
	i:integer;
	D:data;
	v:vector;
	DNIB:integer;
begin
	DNIB:=0;
	max1:= 0;
	max2:= 0;
	par:= 0;
	impar:= 0;
	leer(D);
	par_o_impar(D);
	writeln('punto A): ', par);
	maximos(D,v,max1,max2);
	writeln('punto B): ', max1 ,'y', max2)
	estructura(D,L,DNIB)
end;
