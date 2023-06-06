program EJ10P6;

type 
	data = record 
		version:real;
		cant_3gm_5pp:integer;
		tamaño:integer;

	lista = ^nodo; 
		nodo = record 
			d:data 
			sig:lista
		end;

	v:vector = array [1..5] of version;

procedure armarnodo (L:lista)
var 
	aux:lista;
begin 
	new(aux);
	aux^.datos:= d;
	aux^.sig:= L;
	L:= aux;
end;

procedure iniciarVector (var v:vector);
var 
	i:integer;
begin 
	for i:=1 to 5 do begin 
		i[v]:= 0;
	end;
end;

procedure cantVersiones(var v:vector; var  d:data);
begin 
	for i:=1 to 5 do begin 
		v[i]:= d.version
	end;
end;


procedure leer (var d:data);
begin 
	while (d.version <> 0) do begin 
		readln(d.version);
		cantVersiones(v,d)
		readln(d.cant_3gm_5pp);
		readln(d.tamaño);
		armarnodo(L);
	end;
end;

procedure versiones (L:lista; var v:vector);
begin 
	 if (L <> nil) then 
	 	for i:=1 to 5 do begin 
			if (L^.data.version) = v[version] them 
				cantdis := cantdis +1;
	end;

var 
	L:lista;
	d:data;
	cantver:integer

begin
	cantver:integer;
	L:= nil;
	iniciarVector(v);
	leer(d);
	

end;
