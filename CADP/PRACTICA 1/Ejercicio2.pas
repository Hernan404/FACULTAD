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
