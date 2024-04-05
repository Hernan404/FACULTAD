{Modifique el ejercicio anterior para que, luego de leer el número X, se lean a lo sumo 10 números
reales. La lectura deberá finalizar al ingresar un valor que sea el doble de X, o al leer el décimo
número, en cuyo caso deberá informarse “No se ha ingresado el doble de X”.}

program ej5p1;
const 
	limite = 10;

var
	num1:real;
	doble:real;
	cant:real;

begin
	cant:= 0;
	writeln('ingrese numero');
	readln(num1);
 	
	
	while (num <> doble) and (cant < limite) do begin
		readln(num1);
		cant:= cant +1;
	end;

	if (num1 = doble) and (cant < limite) then
	    writeln('no se ha ingresado el numero doble');
		

end.
