{Una empresa de mensajería nacional solicita desarrollar un programa destinado a
la administración de encomiendas enviadas entre distintas sucursales del país, 
efectuadas entre los meses de Febrero y Diciembre del año 2023.

La empresa dispone de una lista de encomiendas despachadas en ese período. 
De cada encomienda se conoce: código de sucursal origen, DNI del responsable de envío, c
ódigo de sucursal destino, DNI del responsable de recepción, fecha de envío, hora,
peso del paquete (en kg) y 
el código del tipo de encomienda (1: documentos, 2: mercadería, 3: repuestos, 4: electrodomésticos, 5: libros, 6: prendas de vestir, 7: otros). 
Esta estructura no posee orden alguno.
Se pide:

a) Generar una nueva estructura que contenga solo las encomiendas entre diferentes responsables 
(es decir, aquellas en las que los DNIs de origen y destino son distintos). 
Esta nueva estructura debe estar ordenada por código de sucursal origen.

Una vez generada la estructura del inciso a), utilizar dicha estructura para:

b) Calcular e informar para cada sucursal de origen, el peso total de encomiendas enviadas a 
otros responsables.

c) Calcular e informar cuál es el tipo de encomienda que tuvo más envíos entre diferentes responsables.

d) Calcular e informar la cantidad de encomiendas entre diferentes responsables realizadas 
en el mes de Septiembre en las cuales el código de sucursal destino tenga más dígitos impares que pares.}


program EJ8P7_ALTERNATIVO;
const 
	tipos = 7;
type 
	rango_tipos = 1..tipos;

	encomiendas = record 
		codigo_origen:integer;
		dni_envio:integer;
		codigo_destino:integer;
		dni_destino:integer;
		fecha:integer;
		hora:integer;
		peso:real;
		tipo:rango_tipos;
	end;

	lista ^nodo;
	nodo = record 
		data:encomiendas;
		sig:lista;
	end;

	vector = array [rango_tipos] of integer; 

procedure cargardatos(L:lista); //se dispone;

procedure armarlista2(L2:lista; r:encomiendas); 
var 
	ant,act,nue:lista;
begin 
	new(nue);
	act:= L2;
	ant:= L2;

	while (act <> nil) and (L2^.data.codigo_origen > r.codigo_origen) do begin 
		ant:= act;
	act:= act^.sig; 
	end; 

	if (ant = act) then 
		L2:= nue; 
	else 
		ant^sig:= nue;
	nue^sig:= act;
end;

procedure diferentes (L:lista); 
begin 
	while (L <> nil) do begin 
		if (L^.data.dni_destino <> L^data.dni_envio) then 
			armarlista(L2,L^.data);
	L:= L^sig;
	end; 
end. 

function cumpleImpar (cod:integer):boolean;
var 
	par,impar:integer;
begin 
	par:= 0; impar:= 0;
	while (cod > 0) do begin 
		if (cod mod 10 mod 2 = 0) then 
			par:= par +1;
		else 
			impar:= impar +1; 
	cod:= cod div 10; 
	end; 
	cumpleImpar:= (impar > par)
end; 

procedure procesardatos(L:lista);
var 
	max,p1,origenACT,i,cantD:integer;
	v:vector; 
	pesoTotal:real; 
	
begin 
	max:= -1; p1:= 0; cantD:= 0; 
	for i:=1 to tipos do 
		v[i]:= 0; 


	while (L <> nil) do begin 
		origenACT:= L^.data.codigo_origen;
		pesoTotal:= 0;
		while (L <> nil) and (L^.data.codigo_origen = origenACT) do begin  

			pesoTotal:= pesoTotal + L^.data.peso;

			v[L^.data.tipo]:= v[L^.data.tipo] +1;

			if (L^.data.fecha = 9) and (cumpleImpar(L^.data.codigo_destino)) then 
				cantD:= cantD +1; 
		
		L:= L^.sig;
		end; 
		writeln(pesoTotal);
	end; 

	for i:=1 to tipos do begin 
		if (v[i] > max) then begin 
			max:= v[i];
			p1:= i;
		end; 
	end;  

	writeln('punto C', i); 
	writeln('punto D', cantD);
end;

var 
	L,L2:lista;
begin 
	L:= nil;
	L2:= nil; 
	cargardatos(L);
	diferentes(L,L2),
	procesardatos(L2);
end. 
