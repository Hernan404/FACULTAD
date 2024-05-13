El Portal de Revistas de la UNLP está estudiando el uso de sus sistemas de edición electrónica por parte
de los usuarios. Para ello, se dispone de información sobre los 3600 usuarios que utilizan el portal. De
cada usuario se conoce su email, su rol (1: Editor; 2. Autor; 3. Revisor; 4. Lector), revista en la que
participa y cantidad de días desde el último acceso.
a. Imprimir el nombre de usuario y la cantidad de días desde el último acceso de todos los usuarios
de la revista Económica. El listado debe ordenarse a partir de la cantidad de días desde el último
acceso (orden ascendente).
b. Informar la cantidad de usuarios por cada rol para todas las revistas del portal.
c. Informar los emails de los dos usuarios que hace más tiempo que no ingresan al portal.
program EJ13P6;
type 
	usuario = record 
		email:string;
		rol:1..4;
		revista:string;
		cant_acceso:integer;
	end;
	
	lista = ^nodo
	nodo = record 
		data:usuarios;
		sig:lista
	end;

procedure leer(var r:usuario); // se dispone
begin 
	// leo datos
end; 

procedure armarnodo(var L:lista; r:usuario);  // se dispone
begin 
	// cargo lista
end;

procedure cargardatos(L:lista); // se dispone
begin 
	//cargo datos, llamo a leer, pongo la condicion de fin.
end; 	

procedure inivector (var v:vector);
var 
	i:integer;
begin 
	for i:=1 to 4 do begin 
		v[i]:= 0;
	end;
end; 

Procedure InsertarElemento ( var pri: lista; r:usuario);
var 
    ant, nue, act: lista;
begin
    new (nue);
    nue^.datos := r;
    act := pri;
    ant := pri;
    {Recorro mientras no se termine la lista y no encuentro la posición correcta}
    while (act<>NIL) and (act^.data.cant_acceso < r.cant_acceso) do //De menor a mayor
    begin
        ant := act;
        act := act^.sig ;
    end;
    if (ant = act)  then 
        pri := nue   {el dato va al principio}
    else  
        ant^.sig  := nue; {va entre otros dos o al final}
    nue^.sig := act ;
end;

procedure puntoC (r:usuario; var max1,max2:integer; var u1,u2:string);
begin 
	if (r.cant_acceso > max1) then begin  
		max2:= max1;
		u2:= u1;
		max1:= r.cant_acceso;
		u1:= r.email
	end
	else if (max1 > max2) then begin 
		max2:= r.cant_acceso;
		u2:= r.email;
	end;
end;

procedure procesardatos(L,L2:lista);
var 
	r:usuario; cantB,max1,max2:integer; u1,u2:string; v:vector; i:integer;
begin 
	cantB:= 0; max1:= -1; max2:= -1; u1:= ''; u2:= '';
	inivector(v);
	i:= 0;
	while (L <> nil) do begin 
		if (L^.data.revista = 'economica') then 
			insertarordenado(L2,r); // Se dispone 
			
		v[L^.data.rol]:= v[L^.data.rol] +1;
		puntoC(r,max1,max2,u1,u2);
		L:= L^.sig;
	end;
	while (L2 <> nil) do begin 
		writeln(L2^.data.email);
		writeln(L2^.data.cant_acceso);
		L2:= L2^.sig;
	end;
	
	for i:=1 to 4 do 
		writeln('cantidad de usuarios:', v[i],' del rol: ', i);

	writeln('emails de los dos usuarios que hace más tiempo que no ingresan al portal: ', u1,u2);
end;
	
var 
	L,L2:lista;
begin 
	L:= niL;
	L2:= nil;
	cargardatos(L);
	procesardatos(L);
end.
