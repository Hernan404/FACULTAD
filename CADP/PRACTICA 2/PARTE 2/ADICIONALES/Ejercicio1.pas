Dado el siguiente programa:

program Ejercicio1_ad;
procedure intercambio(var num1,num2 : integer);
var
    aux : integer;
begin
    aux := num1;
    num1 := num2;
    num2 := aux;
end;
procedure sumar(num1 : integer; var num2 : integer);
begin
    num2 := num1 + num2;
end;
var
    i, num1, num2 : integer;
begin
    read(num1);
    read(num2);
    for i := 1 to 3 do begin
        intercambio(num1,num2);
        sumar(i,num1);
    end;
    writeln(num1);
end.

a. ¿Qué imprime si se leen los valores num1=10 y num2=5 ?
b. ¿Qué imprime si se leen los valores num1=5 y num2=10 ?
a. Si se leen los valores num1=10 y num2=5:

============================================================


En la primera iteración del bucle for, se intercambian los valores de num1 y num2, entonces num1 será 5 y num2 será 10.
Luego se suma el valor de i (que en la primera iteración es 1) a num1, por lo que num1 se convierte en 6.
En la segunda iteración, se intercambian de nuevo los valores de num1 y num2, pero ya son 6 y 10 respectivamente.
Se suma el valor de i (que ahora es 2) a num1, resultando en num1 siendo 8.
Este proceso continúa hasta que se completa el bucle for.
Entonces, el programa imprime el valor final de num1, que es 45.

b. Si se leen los valores num1=5 y num2=10:

En la primera iteración del bucle for, se intercambian los valores de num1 y num2, entonces num1 será 10 y num2 será 5.
Luego se suma el valor de i (que en la primera iteración es 1) a num1, por lo que num1 se convierte en 11.
En la segunda iteración, se intercambian de nuevo los valores de num1 y num2, pero ya son 11 y 5 respectivamente.
Se suma el valor de i (que ahora es 2) a num1, resultando en num1 siendo 13.
Este proceso continúa hasta que se completa el bucle for.
Entonces, el programa imprime el valor final de num1, que es 65.
