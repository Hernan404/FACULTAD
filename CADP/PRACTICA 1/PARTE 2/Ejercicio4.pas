{Realizar un programa que lea desde teclado la información de alumnos ingresantes a la carrera Analista en
TIC. De cada alumno se lee nombre y nota obtenida en el módulo EPA (la nota es un número entre 1 y 10).
La lectura finaliza cuando se lee el nombre “Zidane Zinedine“, que debe procesarse. Al finalizar la lectura
informar:
● La cantidad de alumnos aprobados (nota 8 o mayor).
● La cantidad de alumnos que obtuvieron un 7 como nota.}
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
