{Modifique el ejercicio anterior para que, luego de leer el número X, se lean a lo sumo 10 números
reales. La lectura deberá finalizar al ingresar un valor que sea el doble de X, o al leer el décimo
número, en cuyo caso deberá informarse “No se ha ingresado el doble de X”.}

program ej5p1;

var
	num1:real;
	primernumero:real;
	limite:real;

begin
	limite:= 0;
	
	writeln('ingrese numero');
	readln(primernumero);
	
	
	
	while (primernumero <> primernumero*2) and (limite < 10) do begin
		readln(num1);
		limite:= limite +1;
		
		if (num1 = primernumero*2) and (limite < 10) then
			writeln('el valor doble es ', num1);
		
	end;
	
	writeln('no se ha ingresado el numero doble');
		

end.
