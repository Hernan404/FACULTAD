program EJ3P7;
type 
	viaje = record 
		numero:integer;
		codigo:integer;
		dir_origen:integer;
		dir_destino:integer;
		km:real;
	end;

	lista = ^nodo;
	nodo = record 
		data:viaje;
		sig:lista;
	end;

procedure armarlistaOrdenada (var pri:lista; r:viaje);
var 
    ant, nue, act: lista;
begin
    new (nue);
    nue^.datos := per;
    act := pri;
    ant := pri;
    {Recorro mientras no se termine la lista y no encuentro la posición correcta}
    while (act<>NIL) and (act^.data.codigo < r.codigo) do //De menor a mayor
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

procedure puntoA(var max1,max2,c1,c2:integer; r:viaje);
begin 
	if (r.km > max1) then begin 
		max2:= max1;
		c2:= c1;
		max1:= r.km;
		c1:= r.codigo
	end
	else if (max1 > max2) then begin 
		max2:= r.km;
		c2:= r.codigo;
	end;
end; 


procedure armarlista2 (var L2:lista; r:viaje);
var 
	aux:lista;
begin 
	new(aux);
	aux^.data:= r;
	aux^.sig:= L2;
	L2:= sig;
end; 

procedure procesardatos(L:lista);
var 
	L2:lista;
	max1,max2,c1,c2:integer;
begin 
	max1:= -1;
	max2:= -1;
	c1:= 0;
	c2:= 0;

	while (L <> nil) do begin 

		viajeACT:= L^.data.codigo;
		cantviajes:= 0;

		while (L <> nil) and (viajeACT = L^.data.codigo) do begin 
			cantviajes:= cantviajes +1;
			puntoA(max1,max2,c1,c2,L^.data);

			if (L^.data.km > 5) then 
				armarlista2(L2,L^.data);
		
		L:= L^.sig;
		end;
	end;
end;

var 
	L:lista;
begin 
	L:= nil;
	cargardatos(L);
	procesardatos(L);
end;
