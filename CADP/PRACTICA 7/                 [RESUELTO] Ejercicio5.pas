{Una empresa de transporte de cargas dispone de la información de su flota compuesta por 100 camiones.
De cada camión se tiene: patente, año de fabricación y capacidad (peso máximo en toneladas que puede
transportar).
Realizar un programa que lea y almacene la información de los viajes realizados por la empresa. De cada
viaje se lee: código de viaje, código del camión que lo realizó (1..100), distancia en kilómetros recorrida,

ciudad de destino, año en que se realizó el viaje y DNI del chofer. La lectura finaliza cuando se lee el código
de viaje -1.
Una vez leída y almacenada la información, se pide:
1. Informar la patente del camión que más kilómetros recorridos posee y la patente del camión que
menos kilómetros recorridos posee.
2. Informar la cantidad de viajes que se han realizado en camiones con capacidad mayor a 30,5 toneladas
y que posean una antigüedad mayor a 5 años al momento de realizar el viaje (año en que se realizó el
viaje).
3. Informar los códigos de los viajes realizados por choferes cuyo DNI tenga sólo dígitos impares.
Nota: Los códigos de viaje no se repiten.}


program EJ5P7;
type 
	camiones = 1..100;
	
	camion = record 
		patente:string;
		anio_fabricacion:integer;
		capacidad:real;
	end;
	
	viaje = record 
		cod_viaje:integer;
		cod_camion:camiones;
		distancia:real;
		destino:string;
		dni:integer;
	end;
	
	lista = ^nodo; 
	nodo = record
		data:viaje;
		sig:lista;
	end;
	
	vector = array [camiones] of camion;
	vcontar = array [camiones] of real;
	
procedure inivectores (var vc:vcontar; var v:vector);
var 
	i:integer;
begin 
	for i:=1 to 100 do 
		vc[i]:= 0;
		
		for i:=1 to 100 do begin 
		readln(v[i].patente);
		readln(v[i].anio_fabricacion);
		readln(v[i].capacidad);

	end;
end;



procedure leerViajes(var r:viaje);
begin 
	with r do begin 
		readln(cod_viaje);
		readln(cod_camion);
		readln(distancia);
		readln(destino);
		readln(dni);
	end;
end;

{procedure armarlista(L:lista; var r:viaje);
var 
	aux:lista;
begin 
	new(aux);
	aux^.data:= r;
	aux^.sig:= L;
	L:= aux;
end;}

procedure armarlista (var L: Lista; r:viaje);
  var
    nue,ant,act: Lista;
  begin
    New(nue);
    nue^.data:= r;
    nue^.sig:= nil;

    if (L = nil) then
      L:= nue
    else
      begin
        ant:= L;
        act:= L;
        while (act <> nil) and (act^.data.cod_camion < r.cod_camion) do
          begin
            ant:= act;
            act:= act^.sig;
          end;
        
        if (ant = act) then
          L:= nue
        else
          ant^.sig:= nue;
        nue^.sig:= act;
      end;
  end;


procedure cargardatos(var L:lista);
var 
	r:viaje;
begin 
	leerViajes(r);
	while (r.cod_viaje <> -1) do begin 
		armarlista(L,r);
		leerViajes(r);
	end;
end;

procedure punto1(vc:vcontar; var max,min:real; var p1,m1:string);
var 
	i:integer;
begin 
	for i:=1 to 100 do begin 
		if (vc[i] > max) then begin 
			max:= vc[i];
			p1:= i;
		end;
		if (vc[i] < min) then begin 
			min:= vc[i];
			m1:= i;
		end;
	end;
end;

function cumple3(dni:integer):boolean;
var 
	esimpar:boolean;
begin 
	esimpar:= false;
	while (dni > 0) do begin 
		if (((dni mod 10) mod 2) = 1) then 
			esimpar:= true;
		
		dni:= dni div 10;
	end;
	cumple3:= (esimpar);
end;

procedure procesardatos(L:lista);
var 
	min,max:real;
	p1,m1:string;
	i,cant2:integer;
	vc:vcontar;
	v:vector;
begin 
	i:= 0; max:= -1; min:= 999; m1:= ''; p1:= ''; cant2:= 0;
	inivectores(vc,v);
	while (L <> nil) do begin 
		
		vc[L^.data.cod_camion]:= vc[L^.data.cod_camion] + L^.data.distancia;

		if (v[L^.data.cod_camion].capacidad > 30.5) and (2023 - L^.data. > 5) then 
			cant2:= cant2 +1;
			
		if (cumple3(L^.data.dni)) then 
			writeln('los códigos de los viajes realizados por choferes cuyo DNI tenga sólo dígitos impares. ', L^.data.cod_viaje);
			
	L:= L^.sig;
	end;
 	punto1(vc,max,min,p1,m1);
	writeln('patente del camión que más kilómetros recorridos posee ', p1, ' y la patente del camión que menos kilómetros recorridos posee. ', m1);
	writeln('a cantidad de viajes que se han realizado en camiones con capacidad mayor a 30,5 toneladas y que posean una antigüedad mayor a 5 años al momento de realizar el viaje ', cant2);

end;

var 
	L:lista;
begin 
	L:= nil;
	cargardatos(L);
	procesardatos(L);
end.
