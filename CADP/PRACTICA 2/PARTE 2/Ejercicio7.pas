program EJ7P2P1;

procedure proceso (var num,suma,total,cant:integer);
var 
	digito:integer;
begin 
	cant:= 0;
	while (num > 0) do begin 
		digito:= num mod 10;
		suma:= suma + digito;
		cant:= cant +1;
		total:= total + 1;
		num:= num div 10;
	end;
	writeln('cantidad de digitos que posee: ', cant);
	writeln('suma de los digitos: ', suma);
end;


var 
	num,suma:integer;
	total,cant:integer;
begin 
	repeat 
		suma:= 0;
		cant:= 0;
		writeln('INGRESE NUMERO');
		readln(num);
		proceso(num,suma,total,cant);
	until suma = 10;
	
	writeln('cantidad total de digitos leidos: ', total);
end.
