Implemente un programa que lea dos números reales e imprima el resultado de la división de
los mismos con una precisión de dos decimales. Por ejemplo, si se ingresan los valores 4,5 y 7,2,
debe imprimir: El resultado de dividir 4,5 por 7,2 es 0,62

program EJ3P0;
var 
    num1,num2:real;
begin 
    readln(num1);
    readln(num2);

    writeln(num1/num2:2:2);
end;
