Program EJ5P1P2;

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
