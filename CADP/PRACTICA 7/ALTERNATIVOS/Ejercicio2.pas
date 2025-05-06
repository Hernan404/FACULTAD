{una institución deportiva desea gestionar las inscripciones de sus socios. De cada socio se registra: número de socio, DNI, apellido, nombre, código de actividad a la que se inscribe (1..6) y valor mensual base de la cuota. La carga de datos finaliza cuando se ingresa el socio con número 8090, el cual también debe procesarse.

El club cuenta con una tabla en la que guarda un monto extra que se suma a la cuota base según la actividad elegida (según el código de actividad, del 1 al 6).

Una vez ingresados todos los socios, se pide:

a. Mostrar, para cada socio, el DNI, apellido, nombre y el monto total que pagará mensualmente por la actividad (cuota base + monto adicional por actividad).

b. Informar el apellido y nombre de los socios cuyo DNI contiene al menos dos dígitos 3.

c. Realizar un módulo que reciba un número de socio, lo busque (seguro existe) y lo elimine de la estructura de datos.}


program EJ2P7_ALTERNATIVO;
const 
	actividades = 6;
type 
	rango_actividades = 1..actividades;

	socio = record 
		numero:integer;
		dni:integer;
		apellidoYnombre:string;
		actividad:rango_actividades;
		cuota:real;
	end; 

	lista = ^nodo;
	nodo = record 
		data:socio;
		sig:lista;
	end; 

	vcuota = array [rango_actividades] of real; 

procedure armarlista(var L:lista; r:socio);
var 
	aux:lista;
begin 
	new(aux);
	aux^.data:= r;
	aux^.sig:= L;
	L:= aux;
end; 

procedure leer(var r:socio); 
begin 
	with r do begin 
		readln(numero);
		readln(dni);
		readln(apellidoYnombre);
		readln(actividad);
		readln(cuota);
	end; 
end; 

procedure cargardatos(L:lista);
var 
	r:socio;
begin 
	repeat 
		leer(r);
		armarlista(L,r);
	until (r.numero = 8090);
end; 

function cumpleB(dni:integer):boolean;
var 
	cant:integer;
begin 
	cant:= 0;
	while (dni > 0) do begin 
		if (dni mod 10 = 3) then 
			cant:= cant +1;
	dni:= dni div 10; 
	end;

	cumpleB:= (cant >= 2);
end; 

procedure eliminar (L:lista; numC:integer; exito:boolean);
var 
	ant,act:lista;
begin 
	exito:= false;
	act:= L;

	while (act <> nil) and (act^.data.numero <> numC) do begin 
		ant:= act;
	act:= act^.sig;
	end;

	if (act <> nil) then begin 
		exito:= true;
		if (act = L) then 
			L:= act^.sig;
		else 
			ant^.sig:= act^.sig;
		dispose(act);
	end; 
end; 


procedure procesardatos(L:lista);
var 
	r:socio;
	vc:vcuota;
	numC:integer;
	apellidoYnombreB:string;
	montoA:real;
	exito:boolean;
begin 
	apellidoYnombreB:= '';
	montoA:= 0; 
	while (L <> nil) do begin 
		montoA:= L^.data.cuota + vc[L^.data.actividad];
		writeln(L^.data.dni);
		writeln(L^.data.apellidoYnombre);
		writeln(montoA);

		if (cumpleB(L^.data.dni)) then 
			writeln(L^.data.apellidoYnombre);


	L:= L^.sig;
	end; 
	readln(numC); 
	eliminar(L,numC,exito);
end;

var 
	L:lista;
begin 
	L:= nil;
	cargardatos(L);
	procesardatos(L);
end.
