program EJ1P7; 
type 
	data = record 
		DNI:integer;
		nombre:string;
		edad:integer;
		codigo:string; 
	end;

	lista = ^nodo;
	nodo = record 
		D:data;
		sig:lista;
	end; 

vector = array [1..7] of integer;

procedure leer (D:data);
begin
	with D do begin 
		writeln('dni');
		readln(DNI);
		writeln('nombre');
		readln(nombre);
		writeln('edad');
		readln(edad);
		writeln('codigo');
		readln(codigo);
	end;
end;

procedure armarnodo(L:lista; D:data);
var 
	aux:lista;
begin 
	new(aux);
	aux^.D:= D;
	aux^.sig:= L;
	L:= aux;
end; 

procedure loscodigos (var D:data; v:vector);
begin 
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
end;

procedure cargarLista (var L:lista; var D:data; var v:vector);
begin 
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





procedure par_o_impar (var D:data; var digito:integer; var impar,par:integer);
begin 
	digito:= D.DNI mod 10;
	
	if (digito mod 2 = 0) then 
		par:= par +1
	else 
		impar := impar +1;
end;



procedure maximos (var D:data; var v:vector; var max1,max2:integer);
var 
	i:integer;
begin 
	for i:=1 to 5 do begin
		if (v[i] > max1) then begin 
			max1:= v[i];
			max2:= max2;
		end
			else if v[i] > max2 then begin 
				max2:= v[i];
			end;
	end;
end;

function buscar (L:lista; DNIB:integer):boolean;
var 
	encontre:boolean;
begin 
	encontre:= false;
	while(L <> nil) and (not encontre) do begin 
		if(DNIB = L^.D.DNI) then 
			encontre:=true
		else begin
			L:= L^.sig;
			encontre := false;
		end;
	buscar:= encontre;
	end;
	
end;





procedure eliminar (pri:lista; datos:data; DNIB:integer; var exito:boolean);
var 
	ant,act:lista;
begin 
	exito:= false;
	act:= pri;
	while (act <> nil) and (act^.D.DNI <> DNIB) do begin 
		ant:= act;
		act:= act^.sig
	end;
	if (act <> NIL) then begin 
		exito:= true;
		if (act = pri) then 
			pri:= act^.sig;
			writeln('el DNI fue eliminado');
	end
		else 
			ant^.sig:= act^.sig;
		dispose(act);
end;


procedure estructura (var D:data; var pri,L:Lista; DNIB:integer);
var 
	exito:boolean;
begin 
	writeln('ingrese DNI que quiere buscar y eliminar');
	readln(DNIB);
	buscar(L,DNIB);
	eliminar(pri,D,DNIB,exito);
end;



var 
	par,impar:integer;
	max1,max2:integer;
	D:data;
	pri:lista;
	L:lista;
	v:vector;
	DNIB:integer;
	digito:integer;
begin
	DNIB:=0;
	max1:= 0;
	max2:= 0;
	par:= 0;
	impar:= 0;
	cargarLista(L,D,v);
	leer(D);
	par_o_impar(D,digito,impar,par);
	writeln('punto A): ', par);
	maximos(D,v,max1,max2);
	writeln('punto B): ', max1 ,'y', max2);
	estructura(D,pri,L,DNIB)
end.
