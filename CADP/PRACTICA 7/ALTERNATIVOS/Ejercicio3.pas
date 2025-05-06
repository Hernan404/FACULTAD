{una empresa de mensajería registra información sobre los envíos realizados durante el mes de abril de 2021. De cada envío se conoce: número de envío, código de repartidor, dirección de retiro, dirección de entrega y cantidad de cuadras recorridas.
Los datos están ordenados por código de repartidor, y cada repartidor puede haber realizado uno o más envíos.

Se pide:

a. Informar los dos códigos de repartidor que hayan recorrido la mayor cantidad total de cuadras.

b. Generar una nueva lista con los envíos en los que se recorrieron más de 10 cuadras, ordenada por número de envío.}


program EJ3P7_ALTERNATIVO;
type 
	envio = record 
		numero:integer;
		codigo:integer;
		direccion_retiro:string;
		direccion_entrega:string;
		cantCuadras:integer;
	end; 

	lista = ^nodo;
	nodo = record 
		data:envio;
		sig:lista;
	end;

procedure cargardatos(L:lista); // se dispone 
procedure armarlista(var L:lista; r:envio); //se dispone
procedure leer(var r:envio); // se dispone

procedure armarlista2(var L2:lista; r:envio);
var 
	ant,act,nue:lista;
begin 
	new(nue);
	nue^.data:= r;
	ant:= L;
	act:= L;

	while (act <> nil) and (act^.data.numero > r.numero) do begin 
		ant:= act;
	act:= act^.sig; 
	end; 

	if (ant = act) then 
		L:= nue;
	else 
		ant^.sig:= nue;
	nue^.sig:= act;
end; 

procedure procesardatos(L:lista); 
var 
	L2:lista;
	max1,max2,p1,p2:integer;
begin 
	L2:= nil; 
	max1:= -1; max2:= -1; p1:= 0; p2:= 0;
	while (L <> nil) do begin 
		codigoACT:= L^.data.codigo;
		totalCuadras:= 0;
		while (L <> nil) and (L^.data.codigo = codigoACT) do begin 
			totalCuadras:= L^.data.cantCuadras + totalCuadras;
			if (totalCuadras > max1) then begin 
				max2:= max1;
				p2:= p1;
				max1:= totalCuadras;
				p1:= totalCuadras;
			end 
			else if (max2 > max1) then begin 
				max2:= L^.data.cantCuadras;
				p2:= L^.data.codigo;
			end; 
		L:= L^.sig;
		end;

		if (L^.data.cantCuadras > 10) then 
			armarlista2(L2,L^.data);
	L:= L^.sig;
	end; 
	writeln(p1,p2);

end; 

var 
	L:lista;
begin 
	L:= nil; 
	cargardatos(L);
	procesardatos(L);
end.
