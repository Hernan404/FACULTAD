program EJ7P1P1
var 
    codigo:integer;
    precioACT:real;
    precioNUE:real;
begin 
    repeat 
        read(codigo);
        read(precioACT);
        read(precioNUE);
    

        if (precioNUE > precioACT*1.10) then 
            write('el precio del producto' , codigo, 'supera el 10%');
        else 
            write('el precio del producto', codigo , 'no supera el 10%');
    
    until codigo = 327
end.
