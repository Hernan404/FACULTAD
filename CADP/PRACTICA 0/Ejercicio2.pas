2. Modifique el programa anterior para que el mensaje de salida muestre la suma de ambos
números:
a. Utilizando una variable adicional
b. Sin utilizar una variable adiciona


a) 
program EJ2P0;
var 
    suma,num1,num2:integer;
begin 
    suma:= 0;
    readln(num1);
    readln(num2);
    suma:= num1 + num2;
    writeln(suma);
end.

b) 
program EJ2P0;
var 
    suma,num1,num2:integer;
begin 
    suma:= 0;
    readln(num1);
    readln(num2);
    writeln(num1 + num2);
end.
