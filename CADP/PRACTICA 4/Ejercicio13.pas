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
