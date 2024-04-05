{Realizar un programa que lea un número real X. Luego, deberá leer números reales hasta que se
ingrese uno cuyo valor sea exactamente el doble de X (el primer número leído)}

program ej4p1;

var
	num1:real;
	doble:real;
	

begin
	writeln('ingrese numero');
	readln(num1);
	doble:= num*2;
	while (num1 <> doble) do begin
		readln(num1);
	end
 end.
