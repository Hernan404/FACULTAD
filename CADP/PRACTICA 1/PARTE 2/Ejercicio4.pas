Realizar un programa que lea 1000 números enteros desde teclado. Informar en pantalla cuáles son los dos
números mínimos leídos.
a. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer el
número 0, el cual debe procesarse.
b. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer el
número 0, el cual no debe procesarse.


program EJ4P1P2; 
var 
    num:integer;
    i:integer;
    min1,min2:integer;
begin 
    min1:= 9999;
    min2:= 9999;

    for i:=1 to 1000 do begin 
        readln(num);
        if (num < min1) then begin
            min1:= num;
            min2:= min1;
        end 
        else if (min2 < min1) then begin  
                min2:= num;
        end;
    end;
    writeln('los dos dos numeros minimos ', min1 , min2);
end.

// PUNTO A
program EJ4P1P2; 
var 
    num:integer;
    i:integer;
    min1,min2:integer;
begin 
    min1:= 9999;
    min2:= 9999;
    repeat 
        readln(num);
        if (num < min1) then begin 
            min1:= num;
            min2:= min1;
        end
        else if (min2 < min1) then begin  
                min2:= num;
        end;
    until num = 0;

    writeln('los dos dos numeros minimos ', min1 , min2);
end.

// PUNTO B
program EJ4P1P2; 
var 
    num:integer;
    i:integer;
    min1,min2:integer;
begin 
    min1:= 9999;
    min2:= 9999;

    while (num <> 0) do begin 
        readln(num);
        if (num < min1) then begin 
            min1:= num;
            min2:= min1;
        end
        else if (min1 < min2) then begin  
                min2:= num;
        end;
    end;
    writeln('los dos dos numeros minimos ', min1 , min2);
end.
