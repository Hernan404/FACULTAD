{Realice un programa que lea 10 números e informe cuál fue el mayor número leído. Por ejemplo: si se lee la
secuencia: 3 5 6 2 3 10 98 8 -12 9, deberá informar:
El mayor número leído fue el 98
a. Modifique el programa anterior para que, además de informar el mayor número leído, se informe el
número de orden, dentro de la secuencia, en el que fue leído. Por ejemplo: si se lee la misma
secuencia: 3 5 6 2 3 10 98 8 -12 9, deberá informar:
El mayor número leído fue el 98, en la posición 7}

program EJ3P1P2;

var
	aprobado, con7, nota:integer;
	nombre:string;
begin
	aprobado:= 0;
	con7:= 0; 
repeat	
	writeln('ingrese nombre');
	readln(nombre);
	writeln('ingrese nota');
	readln(nota);
	
	if (nota >= 8) then
		aprobado:= aprobado+1;
	if (nota = 7) then
		con7:= con7+1;	
until nombre = 'Zidane Zinedine';		

writeln('cantidad de aprobados ', aprobado);
writeln('cantidad con 7 ', con7);
end.
