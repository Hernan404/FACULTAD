{Realizar un programa que lea el código, el precio actual y el nuevo precio de los productos de un almacén.
La lectura finaliza al ingresar el producto con el código 32767, el cual debe procesarse. Para cada producto
leído, el programa deberá indicar si el nuevo precio del producto supera en un 10% al precio anterior.}
program EJ7|P1
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
