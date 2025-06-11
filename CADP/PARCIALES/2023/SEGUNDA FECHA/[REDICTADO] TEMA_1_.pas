

{Un salon de eventos necesita un programa para administrar la informacion de las reservas
de diciembre de 2023 se dispone de una estructura con la informacion de las reservas. de cada reserva se conoce: numero de reserva,
DNI del cliente, dia del evento (1..31), hora de inicio, hora de fin y categoria de servicio (1..4). ademas, se dispone de una tabla
con el precio por hora de reserva de acuerdo a cada categoria de servicio.

a) generar una nueva estructura con numero y precio total de cada reserva. esta estructura con numero 
y precio total de cada reserva. esta estructura debe generarse ordenada por numero de reserva 

b) informar los dos dias del mes con mayor cantidad de reservas de clientes con DNI par    

c) informar el porcentaje de reservas de eventos que inicien antes de las 12 hs y se produzcan en la primera quincena }


program tema1;
type 
	dias = 1..31;
	categorias = 1..4;
	reserva = record 
		numero:integer;
		DNI:integer;
		dia:dias;
		hora_inicio:integer;
		hora_fin:integer;
		categoria:categorias;
	end;
	
	lista = ^nodo; 
	nodo = record 
		data:reserva;
		sig:lista;
	end;
	
	lista2 = ^nodo2;
	nodo2 = record
		numero:integer;
		costo:real;
		sig:lista2;
	end;

	vdias = array [dias] of integer;
	vprecio = array [categorias] of real;
	
	
procedure cargardatos(L:lista);
var 
	r:reserva;
begin 
	//se dispone
end;	

procedure armarlista(var L:lista; r:reserva);
var 
	aux:Lista;
begin 
	// se dispone
end;

procedure leer(var r:reserva);
begin 
	// se dispone
end;

procedure inivectores (var vd:vdias);
var 
	i:integer;
begin 
	for i:=1 to 31 do 
		vd[i]:= 0;
end; 

procedure armarlista2(var pri:lista2; numero:integer; precio:real);
var 
    ant, nue, act: lista2;
begin
    new (nue);
    nue^.data.numero:= numero;
    nue^.data.precioTotal:= precio;
    act := pri;
    ant := pri;
    {Recorro mientras no se termine la lista y no encuentro la posición correcta}
    while (act<>NIL) and (act^.data.numero < numero) do //De menor a mayor
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


procedure puntoA (var L2:listaTotal; var ra:resA; r:reserva; precio:real);
begin 
	ra.numTotal:= r.numero; 
	ra.precioTotal:= precio;
	armarlista2(L2,ra);
end;	

procedure puntoB (var max1,max2,d1,d2:integer; vd:vdias);
var 
	i:integer;
begin 
	for i:= 1 to 31 do begin 
		if (vd[i] > max1) then begin 
			max2:= max1;
			d2:= d1;
			max1:= vd[i];
		end
		else if (v[i] > max2) then begin 
				max2:= vd[i];
				d2:= i;
		end;
	end;
end;

procedure procesardatos(L:lista);
var 
	max1,max2,d1,d2:integer; vc:vcate; vp:vprecio; vd:vdias;
	porcentaje:real; L2:listaTotal; ra:resA; precio,tiempo:real; cant:integer;
begin 
	L2:= NIL; max1:= -1; max2:= -1; d1:= 0; d2:= 0; porcentaje:= 0;
	cant:= 0; tiempo:= 0; precio:= 0;
	
	inivectores(vd,vc,vp);
	while (L <> nil) do begin 
		numeroACT:= L^.data.numero;
		tiempo:= 0;
		precio:= 0; 

		tiempo:= L^.data.hora_fin - L^.data.hora_inicio;
		precio:= vc[L^.data.categoria] * tiempo;

		//punto A
		armarlista2(L2,L^.data.numero,precio);
		
		cant:= cant +1;
		
		//punto B
		if ((L^.data.DNI mod 2 = 0)) then 
			vd[L^.data.dia]:= vd[L^.data.dia] + 1; 

		//punto C
		if (L^.data.hora_inicio < 12) and (L^.data.dia <= 15) then 
			porcentaje:= porcentaje +1;
	
	end;
	puntoB(max1,max2,d1,d2,vd);

	writeln('punto B ', d1 ,' y ', d2);
	writeln('punto C ', (porcentaje/cant)*100:2:0);
end;
	
//codigo principal 
var 
	L:lista;
begin 
	L:= nil;
	cargardatos(L);
	procesardatos(L);
end.
