program EJ2P7;

type 
	data = record 
		DNI:integer;
		APELLIDO:string;
		NOMBRE:string;
		CODIGO:integer;
		MONTO:real;
	end;

	lista = ^nodo
	nodo = record 
		D:data;
		sig:lista;
	end;

vector = array [1..7] of CODIGO;
 

procedure iniVector (var v:vector);
var 
	i:integer;
begin 
	for i:=1 to 7 do begin 
		v[i]:= 0;
	end;
end;

procedure leer(D:data);
begin 
	with D do begin 
		readln(DNI);
		readln(APELLIDO);
		readln(NOMBRE);
		readln(CODIGO);
		readln(MONTO);
		
	end;
end;

procedure agregarfinal (var pri:lista; D:data);
var 
	act, nue:lista;
begin 
	new(nue);
	nue^.dato:= D;
	nue^.sig:= nil;
	if pri <> nil begin 
		act:= pri;
		while (act^.sig <> NIL) do 
			act := act^.sig;
		act^.sig := nue;
	end;
	else 
		pri:= nue;
end;
end;

procedure informar (L:lista; var maximo,minimo:integer);
begin 
	while (L <> nil) do begin 
		writeln(L^.D.DNI);
		writeln(L^.D.APELLIDO);
		writeln(L^.D.NOMBRE);
		L.^.D.MONTO:= randomRange(minimo,maximo + D.MONTO);
		writeln(L^.D.MONTO);	
		L:= L^.sig;
	end;
end;

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

procedure eliminar(var L:lista; CODIGO:integer; var exito:boolean);
var 
	ant, act:lista;
begin 
	exito:= false;
	act:= L;
	while (act <> nil) and (act^.D.CODIGO<> CODIGO) do begin 
		ant:=act;
		act:= act^.sig;
	end;

	exito:= true;
	if (act = L) then begin 
		L:= act^.sig;
	end;
else 
	begin 
		ant^.sig:= act^.sig;
	end;
	dispose(act);
end;

procedure cargar (var L:lista; var D:data; var v:vector;)
begin 
	repeat 
		leer(D);
		agregarfinal(L,D);
	until CODIGO = 1122
	informar(L:lista; D:data);
	digito(D:data);
end;

var 
	L:lista;
	D:data;
	v:vector;
	maximo,minimo:integer;
begin
	minimo:=100;
	maximo:=900;

	L:= nil;
	iniVector(v);
	cargar(L,D,v);
	eliminar(L,CODIGO,exito)
	writeln('punto A) ', );
	writeln('punto B) ', );
end;
