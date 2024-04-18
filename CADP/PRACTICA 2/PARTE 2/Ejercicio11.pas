1. Realizar un programa modularizado que lea una secuencia de caracteres y verifique si cumple con el
patrón A%B*, donde:
- A es una secuencia de caracteres en la que no existe el carácter ‘$’.
- B es una secuencia con la misma cantidad de caracteres que aparecen en A y en la que aparece a lo
sumo 3 veces el carácter ‘@’.
- Los caracteres % y * seguro existen
Nota: en caso de no cumplir, informar que parte del patrón no se cumplió.


program EJ11P2P2;

procedure procesar (secuencia:char);
var 
    cant,cantAr:integer;
begin 
    cant:= 0;
    cantAr:= 0;

    while (sec <> '$') and (sec <> '%') do begin 
        cant:= cant +1;
        readln(sec);
    end;

    if (sec = '$') then 
        writeln('NO CUMPLIO EN LA PARTE A DEL PATRON');
    else begin 
        readln(sec);
        while (sec <> '*') do begin 
            if (sec = '@') then 
                cantAr:= cantAr +1;
            cant:= cant - 1;
            readln(sec);
        end;
    if (cantAr < 3) or (cant <> 0) then 
        writeln('NO CUMPLIO EN LA PARTE B DEL PATRON');
        
end;   

var 
    sec:char;
begin 
    writeln('SECUENCIA');
    readln(sec);

    procesar(sec);
end.
