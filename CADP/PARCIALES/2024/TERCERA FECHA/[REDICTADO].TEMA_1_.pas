{una empresa de alquiler de vehiculos dispone de una estructura donde tiene almaacenado toda la informacion de cada alquiler realizado durante el año 2023.

de cada alquiler se conoce: patente de vehiculo, tipo de vehiculo (1..8), kms del automovil al retirarlo,
kms del automovil al devolverlo, dni de la persona que lo alquilo, ciudad de retiro del vehiculo, ciudad de devolucion del vehiculo, fecha de retiro de vehiculo y cantidad de dias de alquiler. 
esta informacion se encuentra ordenada por patente de manera ascendente.

ademas la empresa dispone de una tabla con los montos de alquiler por dia de cada tipo de vehiculo 

A partir de la informacion del os alquileres se pide:

a. generar una nueva estructura que contenga para cada patente del vehiculo, el totla de kms realizados durante todo el 2023. esta informacion debe quedar ordenada por patente en forma ascendente. 

b. informar la patente del vehiculo que recaudo mas dinero en alquiler durante todo el año 2023. 

c. informar el porcentaje de alquileres realizados cuyos automoviles se retiran en una ciudad y se devuelven en otra ciudad 

d. informar el mes en que se retiraron menos vehiculos alquilados }


program TERCERA_FECHA;
const 
  tipos = 8;
type 
  rango_tipos = 1..tipos;

  fecha = record 
    dia:integer;
    mes:1..12;
  end; 

  alquiler = record 
    patente:string;
    tipo:rango_tipos;
    kms_retiro:real;
    kms_vuelta:real;
    dni:integer;
    ciudad_retiro:string;
    ciudad_vuelta:string;
    fechas:fecha;
    diasAlquiler:integer;
  end; 

  lista = ^nodo;
  nodo = record 
    data:alquiler;
    sig:lista;
  end; 

  lista2 = ^nodo2;
  nodo2 = record 
    patente:string;
    total:real;
  end; 

  vMeses = array [1..12] of integer; 
  vMontos = array [rango_tipos] of real;

procedure leer(var r:alquiler); // se dispone 
procedure armarlista (var L:lista; r:alquiler); // se dispone 
procedure tablaMontos (var vM:vMontos); // se dispone 

procedure inivector(var vm:vmes);
var 
	i:integer;
begin 
	for i:=1 to 12 do begin 
		vm[i]:= 0; 
	end; 
end; 

procedure armarlista2(var L2:lista2; total_kms:real; patente:string);
var 
  ant,act,nue:lista2;
begin 
  new(nue);
  nue^.data.patente:= patente;
  nue^.data.total:= total_kms;
  act:= L2;
  ant:= L2;

  while (act <> nil) and (act^.data.patente < patente) do begin 
      ant:= act; 
    act:= act^.sig;
  end; 

  if (ant = act) then 
      L2:= nue;
  else 
    ant^sig:= nue; 
  nue^.sig:= act; 
end; 

function cumpleC(r:alquiler):boolean;
begin 
	cumpleC:= (r.ciudad_retiro <> r.ciudad_vuelta);
end;

procedure puntoB (dinero:real; max:real; patente:string; p1:string); 
begin 
	if (dinero > max) then 
		max:= dinero; 
		p1:= patente; 
end;

procedure puntoD (vm:vmes; min:integer); 
var 
	i:integer;
begin 
	for i:=1 to 12 do begin 
		if (vm[i] < min) then begin 
			min:= vm[i];
			m1:= i; 
		end; 
	end;
end; 

procedure procesardatos(L:lista);
var 
	patenteACT: string;
  	total_kms, dinero, cant_alquileres, distinto: integer;

begin
  L2 := nil;
  dinero := 0;
  cant_alquileres := 0;
  distinto := 0;
  max := -1;

	inivector(vm);
	while (L <> nil) do begin 
			patenteACT:= L^.data.patente; 
			total_kms:= 0; 
		while (L <> nil) do begin 
			total_kms:= total_kms + (L^.data.kms_retiro - L^.data.kms_vuelta);

			dinero:= dinero + (v[L^.data.retiro] * L^.data.diasAlquiler);

			cant_alquileres:= cant_alquileres + 1; 

			if (cumpleC(L^.data)) then 
				distinto:= distinto + 1; 

			vm[L^.data.fecha.mes]:= vm[L^.data.fecha.mes] + 1;

		L:= L^.sig;
		end; 

		armarlista2(L2,total_kms,patenteACT);

		porcentaje:= (distinto/cant_alquileres) * 100;

		puntoB(dinero,max,patenteACT,p1);

		puntoD(vm,min,m1); 

		writeln('punto B',p1);
		writeln('punto C', porcentaje);
		writeln('punto D', min); 
	end; 
end; 

var 
  L:lista;
begin 
  L:= nil;
  cargardatos(L);
  procesardatos(L);
end. 




