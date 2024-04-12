program EJ8P2P2;

procedure proceso (num:integer; var sumapares,cantimpares:integer);
begin 

	while (num > 0) do begin 
		num:= num mod 10;
		if (num mod 2 = 0) then
			sumapares:= sumapares + 1
		else 
			cantimpares:= cantimpares + 1;

		num:= num div 10;
	end;
end;

var 
	num:integer;
	sumapares:integer;
	cantimpares:integer;
begin 
	writeln('INGRESE NUMEROS');
	readln(num);
	while (num <> 123) do begin 
		sumapares:=0;
		cantimpares:= 0;
		
		proceso(num,sumapares,cantimpares);
		writeln('CANTIDAD DE IMPARES TOTALES: ',cantimpares);
		writeln('SUMA DE LOS PARES DEL NUMERO: ', sumapares); 
		writeln();
		writeln('INGRESE NUMEROS');
		readln(num);
	end;
	
end.program EJ8P2P2;

procedure proceso (num:integer; var sumapares,cantimpares:integer);
begin 

	while (num > 0) do begin 
		num:= num mod 10;
		if (num mod 2 = 0) then
			sumapares:= sumapares + 1
		else 
			cantimpares:= cantimpares + 1;

		num:= num div 10;
	end;
end;

var 
	num:integer;
	sumapares:integer;
	cantimpares:integer;
begin 
	writeln('INGRESE NUMEROS');
	readln(num);
	while (num <> 123) do begin 
		sumapares:=0;
		cantimpares:= 0;
		
		proceso(num,sumapares,cantimpares);
		writeln('CANTIDAD DE IMPARES TOTALES: ',cantimpares);
		writeln('SUMA DE LOS PARES DEL NUMERO: ', sumapares); 
		writeln();
		writeln('INGRESE NUMEROS');
		readln(num);
	end;
	
end.
