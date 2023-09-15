program EJ6P0;
var 
   montoTotal,valor,porcentaje:real;
   transsaccion:real;
begin 
    readln(montoTotal);
    readln(valor);
    readln(porcentaje);

    transsaccion:= valor*montoTotal + porcentaje;

    writeln(transsaccion);
end.
