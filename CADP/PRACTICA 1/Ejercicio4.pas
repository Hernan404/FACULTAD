{Realizar un programa que lea un número real X. Luego, deberá leer números reales hasta que se
ingrese uno cuyo valor sea exactamente el doble de X (el primer número leído)}

program ej4p1;

var
	num1:real;
	primernumero:real;
	

begin
	writeln('ingrese numero');
	readln(primernumero);
	
	while (primernumero <> primernumero*2) do begin
		readln(num1);
		
		if (num1 = primernumero*2) then
			writeln('el valor doble es ', num1)
	end
end.
