program EJ4P1P2;

type
	bucle=0..10;

var
	i:bucle;
	numero_uno,numero_dos,chico,chico2:integer;
begin
	numero_uno:=0;
	numero_dos:=0;
	chico:=0;
	chico2:=0;
	read(chico);
	for i:=0 to 10 do 
		begin
			write('Ingrese un numero: ');
			read(chico);
			if(chico>chico2)then
				chico:=chico2;
			if(chico<chico2)then
				chico2:=chico;
		end;
	
	if(chico<chico2) then
		begin
			writeln('el numero mas chico es',chico);
			writeln('el segundo numero mas chico es',chico2);
		end
	else
		begin
			writeln('el numero mas chico es',chico2);
			writeln('el segundo numero mas chico es',chico);
		end;
	
end.




Program EJ5P1P2;

var

	num,min,max,suma:integer;

begin
	max:= -9999;
	min:= 9999;
	suma:= 0;

	repeat
		readln(num);
		
		suma:= suma+num;
		
		if (num > max) then
			max:= max+num;
		if (num < min) then
			min:= min+num;
		
	
	until num = 100;

	writeln('el maximo es ' max);
	writeln('el minimo es ' min);
	writeln('la suma total es ' suma);
	

end
