{Realizar un programa que lea números enteros desde teclado. La lectura debe finalizar cuando se ingrese el
número 100, el cual debe procesarse. Informar en pantalla:
● El número máximo leído.
● El número mínimo leído.
● La suma total de los números leídos.}

program EJ5P1P2;
var
   num,min,max,suma:integer;

begin
   max:= -1;
   min:= 9999;
   suma:= 0;

   repeat
	readln(num);	
	suma:= suma+num;
		
	if (num > max) then
	    max:= num;
	if (num < min) then
	    min:= num;
     
until num = 100;
	writeln('el maximo es ', max);
	writeln('el minimo es ', min);
	writeln('la suma total es ', suma);
end.
