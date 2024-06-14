{Una empresa de transporte de caudales desea optimizar el servicio que brinda a sus clientes. Para ello,
cuenta con información sobre todos los viajes realizados durante el mes de marzo. De cada viaje se cuenta
con la siguiente información: día del mes (de 1 a 31), monto de dinero transportado y distancia recorrida por
el camión (medida en kilómetros).
a. Realizar un programa que lea y almacene la información de los viajes (a lo sumo 200). La lectura finaliza
cuando se ingresa una distancia recorrida igual a 0 km, que no debe procesarse.
b. Realizar un módulo que reciba el vector generado en a) e informe:
- El monto promedio transportado de los viajes realizados
- La distancia recorrida y el día del mes en que se realizó el viaje que transportó menos dinero.
- La cantidad de viajes realizados cada día del mes.
c. Realizar un módulo que reciba el vector generado en a) y elimine todos los viajes cuya distancia
recorrida sea igual a 100 km.
Nota: para realizar el inciso b, el vector debe recorrerse una única vez.}

program EJ3P4P2;
const
	dimf = 200; 
type 
	dias = 1..31;
	caudal = record 
		dia:dias;
		monto:real;
		km:real;
	end;

	vector = array [1..dimf] of caudal;
	vdia = array [dias] of integer;

procedure puntoA (var v:vector; var diml:integer);
var 
	km:real;
begin 
	readln(km);
	while (diml < dimf) and (km > 0) do begin 
		diml:= diml +1;
		v[diml].km:= km;
		readln(v[diml].dia);
        readln(v[diml].monto);
        readln(km);
	end;
end;

procedure puntoB(v:vector; diml:integer);
var 
    i:integer;
    promedio,minKM,minDIA,min:real;
    vd:vdia;
begin 
    promedio:= 0;
    min:= 999;
    for i:=1 to dimf do 
        vd[i]:= 0;
    
    for i:=1 to diml do begin 
        //- El monto promedio transportado de los viajes realizados
        promedio:= promedio + v[i].monto;

        // - La distancia recorrida y el día del mes en que se realizó el viaje que transportó menos dinero.
        if (v[i].monto < min) then begin 
            min:= v[i].monto;
            minKM:= v[i].km;
            minDIA:= v[i].dia;
        end;

        // - La cantidad de viajes realizados cada día del mes.
        vd[v[i].dia]:= vd[v[i].dia] +1;
    end;
end;

//-Realizar un módulo que reciba el vector generado en a) y elimine todos los viajes cuya distancia recorrida sea igual a 100 km.
procedure puntoC(var v:vector; var diml:integer);
var 
    i,posicion,cant:integer;
begin 
    cant:= 0;
    posicion:= 0;
    i:= 1;
    while (i < diml) do begin 
        if (v[i].km = 100) then begin 
            posicion:= i;
            while (v[posicion].km = 100) and (posicion < diml) do 
                posicion:= posicion +1;
            v[i]:= v[posicion];
        end
        else 
            i:= i + posicion;
    end;
    diml:= diml - posicion;
end;

var 
	v:vector;
	diml:integer;
begin 
	diml:= 0;
	puntoA(v,diml);
	puntoB(v,diml);
	puntoC(v,diml);
end. 
