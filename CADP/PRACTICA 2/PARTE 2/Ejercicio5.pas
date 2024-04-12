a. Realizar un módulo que reciba un par de números (numA,numB) y retorne si numB es el doble de
numA.
b. Utilizando el módulo realizado en el inciso a., realizar un programa que lea secuencias de pares de
números hasta encontrar el par (0,0), e informe la cantidad total de pares de números leídos y la cantidad
de pares en las que numB es el doble de numA.
Ejemplo: si se lee la siguiente secuencia: (1,2) (3,4) (9,3) (7,14) (0,0) el programa debe informar los
valores 4 (cantidad de pares leídos) y 2 (cantidad de pares en los que numB es el doble de numA). 

program EJ5P2P1;

procedure procesar (var numA,numB,cant,total:integer);
begin 
	if (numA mod 2 = 0) and (numB mod 2 = 0) then begin 
		total:= total + 1;
		if (numB = numA *2) then 
			cant:= cant +1;
	end;
end;

var 
	total,cant:integer;
	numA,numB:integer;
begin 
	total:= 0;
	cant:= 0;
	writeln('INGRESE PAR DE NUMEROS');
	readln(numA);
	readln(numB);
	while (numA <> 0) and (numB <> 0) do begin 
		procesar(numA,numB,cant,total);
		writeln('INGRESAR PAR DE NUMEROS');
		readln(numA);
		readln(numB);
	end;
	writeln('cantidad de pares leidos: ', total);
	writeln('cantidad de pares en los que numB es el doble de numA: ',cant);

end.

