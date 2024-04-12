Responda la pregunta en relación al siguiente programa:
program ejercicio4;
procedure digParesImpares(num : integer; var par, impar : integer);
var
	dig: integer;
begin
	while (num <> 0) do begin
		dig:= num mod 10;
		if((dig mod 2)= 0) then
			par := par + 1
		else
		impar:= impar +1;
		num := num DIV 10;
	end;
end;
var
	dato, par, impar, total, cant : integer;
begin
	par := 0;
	impar := 0;
	
	repeat
		read(dato);
		digParesImpares(dato,par,impar);
	until (dato = 100);
	writeln(‘Pares: ’,par, ‘Ímpares:’, impar);
end.
a. ¿Qué imprime si se lee la siguiente secuencia de valores? 250, 35, 100

//========================================================================

El programa tiene un procedimiento llamado `digParesImpares`, 
que cuenta la cantidad de dígitos pares e impares en un número dado. Luego, en el programa principal, 
se inicializan las variables `par` e `impar` en 0, 
se lee una serie de números y para cada uno se llama al procedimiento `digParesImpares`
para contar los dígitos pares e impares en ese número. Esto se repite hasta que se lee el número 100. Finalmente,
se imprime la cantidad total de dígitos pares e impares.

Ahora, analicemos la secuencia de valores dada: 250, 35, 100.

1. **Para 250**: Hay 2 dígitos pares (2 y 0) y 1 dígito impar (5).
2. **Para 35**: Hay 1 dígito par (0) y 2 dígitos impares (3 y 5).
3. **Para 100**: No hay dígitos, ya que el número es 100 y termina el bucle.

Entonces, al final, el programa imprimirá "Pares: 3 Ímpares: 3". 
Esto se debe a que en total se encontraron 3 dígitos pares y 3 dígitos impares en la secuencia proporcionada.
