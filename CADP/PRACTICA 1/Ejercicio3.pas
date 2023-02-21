{Realizar un programa que lea 3 números enteros y los imprima en orden descendente.
}
program ej3p1;

var
	NumeroReal: real;
	DobleReal: real;
begin
	NumeroReal:=0;
	DobleReal:=0;
	write('Ingrese un numero real: ');
	read(NumeroReal);
	while ((DobleReal/2)<>NumeroReal) do
		begin
			read(DobleReal);
			writeln('Su numero es ',DobleReal:2:1);
		end;
	write('El numero que es el doble del real es: ', DobleReal:2:1);
end.
