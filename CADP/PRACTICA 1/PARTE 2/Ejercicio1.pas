{Realizar un programa que lea 10 números enteros e informe la suma total de los números leídos.
a. Modifique el ejercicio 1 para que además informe la cantidad de números mayores a 5.}

program EJ1|P1|Parte2;
var
	num1:integer;
	i: integer;
	resultado, mayor:integer;

begin
	i:= 0;
	num1:= 0;
	resultado:=0;
	mayor:= 0;
	
	for i:= 1 to 10 do begin
		readln(num1);
		if (num1 > 5) then begin
			mayor:= mayor+1;
		end;
		resultado:= num1+resultado;
		
	end;
	
	writeln('la suma de numeros es ', resultado);
	writeln('cantidad de numeros mayores: ', mayor);

end.
