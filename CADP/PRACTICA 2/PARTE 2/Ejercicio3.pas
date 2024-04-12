Encontrar los 6 errores que existen en el siguiente programa. Utilizar los comentarios entre llaves como
guía, indicar en qué línea se encuentra cada error y en qué consiste:
1. program ejercicio5;
2. { suma los números entre a y b, y retorna el resultado en c }
3. procedure sumar(a, b, c : integer)
4. var
5. suma : integer;
6. begin
7.
8. for i := a to b do
9. suma := suma + i;
10. c := c + suma;
11. end;
12. var
13. result : integer;
14. begin
15. result := 0;
16. readln(a); readln(b);
17. sumar(a, b, 0);
18. write(‘La suma total es ‘,result);
19. { averigua si el resultado final estuvo entre 10 y 30}
20. ok := (result >= 10) or (result <= 30);
21. if (not ok) then
22. write (‘La suma no quedó entre 10 y 30’);
23. end.

//==========================================================

    En la línea 4, falta un punto y coma al final del bloque de declaración de variables. Debería ser: var;

    En la línea 6, falta inicializar la variable suma antes de usarla. Debería ser: suma := 0;

    En la línea 8, falta declarar la variable i utilizada en el bucle for.

    En la línea 10, se está intentando modificar el parámetro c dentro del procedimiento sumar, 
    pero c está pasado por valor y no por referencia. Debería pasarse por referencia utilizando 
    var en el encabezado del procedimiento.

    En la línea 18, las comillas utilizadas para delimitar el texto están en un formato incorrecto. 
    Deberían ser comillas simples o dobles estándar (' o ").

    En la línea 20, la expresión lógica para verificar si el resultado está entre 10 y 30 no es correcta. 
    Debería ser: ok := (result >= 10) and (result <= 30);. El operador or debería ser and para verificar 
    si el resultado está dentro del rango. Además, el operador or debería ser cambiado por and 
    para verificar que el resultado esté en el rango deseado.
