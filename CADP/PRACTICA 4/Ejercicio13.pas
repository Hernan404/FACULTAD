Ejercicio 13
program sumador;
const
  CANT_PUNTOS = 100;
  CANT_ANIOS = 2023;
  INICIO_ANIOS = 1973;
type


    vMediciones = array[1..CANT_PUNTOS] of real;

    vAnios = array[INICIO_ANIOS..CANT_ANIOS] of vMediciones;

procedure leerMediciones(var v: vMediciones);
var
   i : integer;
begin
  for i:= 1 to CANT_PUNTOS do
      readln(v[i]);
end;

procedure leerAnios(var v:vAnios);
var
   i: integer;
begin
  for i:= INICIO_ANIOS to CANT_ANIOS do
      leerMediciones(v[i]);
end;

var
   v : vAnios;
   i, j : integer;

   totalTemp : real;
   anioMax : integer;
   tempMax : real;

   anioMax2 : integer;
   tempMax2 : real;
begin
  leerAnios(v);
  tempMax := -9999;
  tempMax2 := -9999;

  for i := INICIO_ANIOS to CANT_ANIOS do begin
    totalTemp := 0;
    for j := 1 to CANT_PUNTOS do begin
        totalTemp := totalTemp + v[i][j];
        if (v[i][j] > tempMax2) then begin
           tempMax2 := v[i][j];
           anioMax2 := i;
        end;
    end;
    totalTemp := totalTemp / CANT_PUNTOS;
    if (totalTemp > tempMax) then begin
      tempMax := totalTemp;
      anioMax := i;
    end;
  end;
  writeln(anioMax, anioMax2);
end. 


=================================================================================



program EJ13P4P1;
const 
	dimf = 50;
type 
	reg_temp = record 
		temp50:real;
		tempPROMEDIO:real;
	end;
	
	vector = array [1..dimf] of integer;


function puntoA(v:vector):integer;
var 
	i:integer;
	tempPROMEDIO:real;
begin 
	tempPROMEDIO:= 0;
	for i:=1 to dimf do 
		if (tempPROMEDIO < v[i].tempPROMEDIO) then begin 
			tempPROMEDIO:= v[i].tempPROMEDIO;
			puntoA:= i;
		end;
end;

function puntoB(v:vector):integer;
var 
	i:integer;
	tempALTA:real;
begin 
	tempALTA:= 0;
	for i:=1 to dimf do begin 
		if (tempALTA < v[i].tempALTA) then begin 
			tempALTA:= v[i].tempALTA;
			puntoB:= i;
		end;
	end;
end;

procedure procesardatos (var v:vector);
var
	i,x:integer;
	lugar:string;
	temp,tempPROMEDIO,temp50:real;
begin 
	tempPROMEDIO:= 0;
	temp50:= 0;

	for x:=1 to dimf do begin 
			for i:=1 to 100 do begin 
				writeln('LUGAR');
				readln(lugar);
				writeln('TEMPERATURA');
				readln(temp);
				
				if (temp50 < temp) then 
					temp50:= temp;
				
				tempPROMEDIO:= tempPROMEDIO + temp;
			end;
		tempPROMEDIO:= tempPROMEDIO/100;
		v[x].temp50:= temp50;
		v[x].tempPROMEDIO:= tempPROMEDIO;
	end;
end;

var 
	v:vector;
begin 
	procesardatos(v);
	writeln('anio con mayor temperatura', puntoA(v));
	writeln('anio con mayor temperatura en algun punto ', puntoB(v));
end.
