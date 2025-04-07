{Realizar un programa que lea un número real e imprima su valor absoluto. El valor absoluto de un número
X, se escribe |X| y se define como:
|X| = X cuando X es mayor o igual a cero
|X| = -X cuando X es menor a cero}

program EJ2P1;
var
num1:real;
absoluto:real;
begin
   writeln('ingrese un numero');
   readln(num1);
   if (num1 < 0) then 
       absoluto:= (num1 * -1);
   else 
        absoluto:= num;
 writeln('el valor absoluto es', absoluto);
	

end.
