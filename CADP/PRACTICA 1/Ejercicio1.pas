program ej1p1;

var
num1:char;
num2:char;

begin

writeln('ingrese un numero');
	readln(num1);

writeln('ingrese el segundo numero');
	readln(num2);

if (num1 > num2) then
	writeln( num1,' es mayor');
	
if (num1 < num2) then
	writeln( num2,' es mayor')
	
else 
	writeln('son iguales')
	
end.
