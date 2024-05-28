{una empresa de ventas de pasajeros en colectivo esta analizando la informacion de los viajes realizados a mar del plata en el ultimo año. para ello se dispone de una estructura de datos con la informacion de todos los viajes realizados. de cada viaje se conoce el codigo de viaje, el numero de coche (entre 1000 y 2500), el mes en que se realizo el viaje, la cnatida de pasajes vendidos y el dni del chofer. la informacion no se encuentra ordenada por ningun criterio.
ademas la empresa dispone de una estructura de datos con informacion sobre la capiacidad maxima de cada coche;

realizar un programa que procese la infromacion  de los viajes e: 
A. informar el numero de coche con le cual se realizaron mas viajes.
B. genere una lista con los viajes realizados en el mes 2 por un chofer con DNI multiplo de 10 donde la cantidad de pasajes vendidos no alcanza la capacidad maxima del coche;
C. para cada coche, informe el promedio de pasajeros que viajaron entre todos sus viajes.}

program PARCIAL;
type 
	numeros = 1000..2500;
	viaje = record 
		codigo:integer;
		numero:integer;
		mes:1..12;
		cant_pasajes:integer;
		DNI:integer;
	end;

	lista = ^nodo;
	nodo = record 
		data:viaje;
		sig:lista;
	end;

	vnum = array [numeros] of integer;
	vmeses = array [1..12] of integer;
	vcapacidad = array [numeros] of integer;


procedure cargardatos(var L:lista); //se dispone
begin

end;

procedure leer(var r:viaje); // se dispone
begin 

end;

procedure armarlista(var L:lista; r:viaje); // se dispone
begin 

end;

procedure cargarcapacidad (var vc:vcapacidad); // se dispone 
begin 
	
end;

procedure inivectores (var vn:vnum; var vm:vmeses);
var 
	i:integer;
begin 
	for i:=1 to 2500 do 
		vn[i]:= 0;
	for i:=1 to 12 do 
		vm[i]:= 0;
end;

procedure armarlista2(var L2:lista; var r:viaje);
var 
	aux:lista;
begin 
	new(aux);
	aux^.data:= r;
	aux^.sig:= L2;
	L2:= aux;
end;

procedure puntoA(vn:vnum;var max:integer;var n1:integer);
var 
	i:integer;
begin 
	for i:=1000 to 2500 do begin 
		if (vn[i] > max) then begin  
			max:= vn[i];
			n1:= i;
		end;
	end;

end;
	
procedure procesardatos(L:lista);
var 
	vc:vcapacidad; vm:vmeses; vn:vnum; max,n1:integer;
	cap:integer;
	L2:lista;
	r:viaje; cant:integer; i:integer;
begin 
	L2:= NIL;
	cap:= 0; cant:= 0; max:= -1; n1:= 0;
	cargarcapacidad(vc);
	inivectores(vn,vm);
	while (L <> nil) do begin 
		//calculo la capacidad
		cap:= L^.data.cant_pasajes * L^.data.numero;
		vc[L^.data.numero]:= vc[L^.data.numero] + cap;
		puntoA(vn,max,n1);
		cant:= cant +1;
		vn[L^.data.numero]:= vn[L^.data.numero] + 1;
		
		if (vm[L^.data.mes] = 2) and (L^.data.DNI MOD 10 = 0) and (L^.data.cant_pasajes < cap) then 
			armarlista2(L2,r);

	L:= L^.sig;
	end;
	writeln('punto A ', n1);
	for i:=1000 to 2500 do   
		writeln(cant/vn[i]);
end;	
	
var 
	L:lista;
begin 
	L:= nil;
	cargardatos(L);
	procesardatos(L);
end.	
