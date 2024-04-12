program EJ8P2P2;

procedure proceso (var num,sumapares,cantimpares:integer);
var 
	par,impar:integer;
begin 
	impar:= 0;
	while (num > 0) do begin 
		par:= 0;
		num:= num mod 10;
		if (num mod 2 = 0) then begin 
			par:= par + 1;
			sumapares:= sumapares + num;
		end
		else begin 
			impar:= impar +1;
			cantimpares:= cantimpares + impar;
		end;
		num:= num div 10;
	end;
	writeln('SUMA DE LOS PARES DEL NUMERO: ', sumapares); 
end;

var 
	num:integer;
	sumapares:integer;
	cantimpares:integer;
begin 
	writeln('INGRESE NUMEROS');
	readln(num);
	while (num <> 123) do begin 
		proceso(num,sumapares,cantimpares);
		writeln('INGRESE NUMEROS');
		readln(num);
	end;
	writeln('CANTIDAD DE IMPARES TOTALES: ',cantimpares);
end.

