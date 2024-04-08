Realizar un programa que lea 1000 números enteros desde teclado. Informar en pantalla cuáles son los dos
números mínimos leídos.

program EJ9P1P1;
var 
    car:char;
    num:integer;
    operacion:integer;
begin 
    readln(char);
    if (char = '+') or (char = '-') then begin 
        while (num <> 0) do begin 
            readln(num);
            if (char = '+') then 
                operacion:= operacion + num
            else 
                operacion:= operacion - num;
        end;
    end
    else 
        write('error');
end.

program EJ4P1P2;
var 
    num,i,min1,min2:integer;
begin 
    min1:= 9999;
    min2:= 9999;
    for i:=1 to 1000 do begin 
        read(num);
        
        if (num < min1) then  
            min1:= num;
            min2:= min1;
        else 
            if(min1 < min2) then 
                min2:= num;
    end;
    write('numeros mas chicos ', min1 , min2);
end.
