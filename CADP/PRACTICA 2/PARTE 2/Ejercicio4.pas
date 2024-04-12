El siguiente programa intenta resolver un enunciado. Sin embargo, el código posee 5 errores. Indicar en
qué línea se encuentra cada error y en qué consiste el error.
Enunciado: Realice un programa que lea datos de 130 programadores Java de una empresa. De cada
programador se lee el número de legajo y el salario actual. El programa debe imprimir el total del dinero
destinado por mes al pago de salarios, y el salario del empleado mayor legajo.
1. program programadores;
2. procedure leerDatos(var legajo: integer; salario : real);
3. begin
4.   writeln(‘Ingrese el nro de legajo y el salario”);
5. read(legajo);
   read(salario);
7. end;
8. procedure actualizarMaximo(nuevoLegajo:integer; nuevoSalario:real; var maxLegajo:integer);
9. var
10. maxSalario : real;
11. begin
12. if (nuevoLegajo > maxLegajo) then begin
13.     maxLegajo:= nuevoLegajo;
14.     maxSalario := nuevoSalario
15. end;
16. end;
17. var
18.   legajo, maxLegajo, i : integer;
19.   salario, maxSalario : real;
20. begin
21.   sumaSalarios := 0;
22. for i := 1 to 130 do begin
23.   leerDatos(salario, legajo);
24.   actualizarMaximo(legajo, salario, maxLegajo);
25.   sumaSalarios := sumaSalarios + salario;
26. end;
27.   writeln(‘En todo el mes se gastan ‘, sumaSalarios, ‘ pesos’);
28.   writeln(‘El salario del empleado más nuevo es ‘,maxSalario);
29. end.

    En la línea 2, el procedimiento leerDatos está declarado incorrectamente.
    Los parámetros legajo y salario deben estar ambos marcados como var 
    ya que se pretende modificar su valor dentro del procedimiento.

    En la línea 4, hay un error de comillas. Se abre con comillas simples y se cierra con comillas dobles. 
    Debe usarse el mismo tipo de comillas para abrir y cerrar la cadena. En este caso, deberían ser comillas simples: '.

    En la línea 5, se intenta leer el legajo y el salario de manera incorrecta. 
    Se debe usar readln en lugar de read para leer valores enteros y reales.

    En la línea 8, el procedimiento actualizarMaximo espera un parámetro maxLegajo pasado por referencia, 
    pero no está marcado como var, lo que ocasionaría que los cambios realizados dentro del procedimiento no se reflejen fuera de él.

    En la línea 23, se está llamando al procedimiento leerDatos en un orden incorrecto,
     primero se está pasando salario y luego legajo. Debe ser al revés.
