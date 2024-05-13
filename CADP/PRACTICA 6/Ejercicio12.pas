Una empresa desarrolladora de juegos para teléfonos celulares con Android dispone de información de
todos los dispositivos que poseen sus juegos instalados. De cada dispositivo se conoce la versión de
Android instalada, el tamaño de la pantalla (en pulgadas) y la cantidad de memoria RAM que posee
(medida en GB). La información disponible se encuentra ordenada por versión de Android. Realizar un
programa que procese la información disponible de todos los dispositivos e informe:
a. La cantidad de dispositivos para cada versión de Android.
b. La cantidad de dispositivos con más de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas.
c. El tamaño promedio de las pantallas de todos los dispositivos

program EJ12P6;
type 
	data = record 
		version:integer;
		pantalla:real;
		cant_ram:real;
	end;
	
	lista = ^nodo;
	nodo = record 
		data:datos;
		sig:lista;
	end;

procedure leer(var r:datos); // se dispone
procedure cargardatos(L:lista); // se dispone
procedure armarnodo(var L:lista; r:datos); //se dispone
	
function cumpleB(r:datos):boolean;
begin 
	cumpleB:= (r.cant_ram > 3) and (r.pantalla <= 5);
end;

procedure procesardatos(L:lista);
var 
	r:datos; cant_celulares,cantA,cantB:integer; promedio:real; verACT:real;
begin 
	cant_celulares:= 0; cantB:= 0; promedio:= 0;
	while (L <> nil) do begin 
		verACT:= L^.data.version;
		cantA:= 0;
		cant_celulares:= cant_celulares +1:

		while (L <> nil) and (verACT = L^.data.version) do begin 
			cantA:= cantA +1;
			if (cumpleB(L^.data)) then 
				cantB:= cantB +1;
			promedio:= promedio + L^.data.pantalla
		L:= L^.sig;
		end;
		writeln('cantidad de versiones: ', cantA 'del dispositivo: ', verACT);
	end;

	writeln('La cantidad de dispositivos con más de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas: ', cantB);
	writeln('El tamaño promedio de las pantallas de todos los dispositivos: ', promedio/cant_celulares:2:0);
end;
	
var 
	L:lista;
begin 
	L:=nil;
	cargardatos(L); //se dispone
	procesardatos(L);
end.

