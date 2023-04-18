program EJ7P3;

type
    rango = 0..diml;
    arreglo = array [rango];


procedure inicializar (var v:arreglo);
var
    i:rango;
begin
    for i:=0 to diml do begin
        a[i]:= 0;
    end;
end;

procedure descomponer (var v:arreglo);
var
    resto:rango;
begin
    while (num <> -1) do begin
        resto:= num mod 10;

        a[resto]:= a[resto] +1;
        num:= num div 10;
    end;
end;

function maximo (v:arreglo): rango;
var
    i,digmax:rango; max:integer;
begin
    max:= -1;
    for i:= 0 to diml do 
        if (a[i] > max) then begin
            max:= a[i];
            digmax:= i;
        end;
end;



var  
    v:arreglo;
    num:integer;
begin
    readln(num);
    while (num <> -1) do begin
        a[diml] := a[diml] +1;
          inicializar(v);
          descomponer(v);
    end;
end;
