Responda las preguntas en relación al siguiente programa:
program Ejercicio3;

procedure suma(num1: integer; var num2:integer);
begin
num2 := num1 + num2;
num1 := 0;
end;

var
i, x : integer;
begin
read(x); { leo la variable x }
for i:= 1 to 5 do
suma(i,x);
write(x); { imprimo las variable x }
end.

a. ¿Qué imprime si se lee el valor 10 en la variable x ?

b. Qué imprime si se lee el valor 10 en la variable x y se cambia el encabezado del procedure por:
procedure suma(num1: integer; num2:integer);

c. Qué sucede si se cambia el encabezado del procedure por:
procedure suma(var num1: integer; var num2:integer);
//---------------------------------------------------------------------------------------
a. Si se lee el valor 10 en la variable x, el programa imprimirá 15. 
Esto se debe a que el procedimiento suma se llama cinco veces dentro de un bucle for, 
y en cada llamada se suma el valor de i (que va de 1 a 5) a x. Así que, la secuencia de operaciones sería:

    Llamada a suma(1, 10): num2 se convierte en 11, y num1 se convierte en 0.
    Llamada a suma(2, 11): num2 se convierte en 13 (11 + 2), y num1 se convierte en 0.
    Llamada a suma(3, 13): num2 se convierte en 16 (13 + 3), y num1 se convierte en 0.
    Llamada a suma(4, 16): num2 se convierte en 20 (16 + 4), y num1 se convierte en 0.
    Llamada a suma(5, 20): num2 se convierte en 25 (20 + 5), y num1 se convierte en 0.

Entonces, después del bucle, x sería igual a 25, y eso es lo que se imprime.

b. Si se cambia el encabezado del procedimiento por procedure suma(num1: integer; num2: integer);, 
entonces el programa imprimirá 10. Esto se debe a que dentro del procedimiento suma, 
num1 se convierte en 0 pero num2 no se modifica fuera del alcance del procedimiento 
ya que la variable num2 es pasada por valor y no por referencia.

c. Si se cambia el encabezado del procedimiento por procedure suma(var num1: integer; var num2: integer);, 
entonces el programa imprimirá 0. En este caso, tanto num1 como num2 son pasadas por referencia, 
lo que significa que cualquier cambio que se haga dentro del procedimiento afectará a las variables originales fuera de él. 
Por lo tanto, después de ejecutar el bucle, x se establecerá en 0.
