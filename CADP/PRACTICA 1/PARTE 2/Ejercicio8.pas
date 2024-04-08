Program EJ8P1P2;

type
	dias= 0..31;

var
	mayor_ventas:integer;
		i:dias;
		monto:integer;
		cant_dia:integer;
		cant_mes:integer;
	dia:Integer;

begin
		cant_mes:=0;
		cant_dia:=0;
		monto:=0;
	dia:=0;
	mayor_ventas:= 0;
		for i:= 0 to 3 do begin
			writeln('dia: ',i);
			writeln('ingrese el monto: ');
			readln(monto);
			cant_dia:= 0;
			while (monto<>0) do begin
				cant_dia:= cant_dia+1;
				writeln('ingrese el monto: ');
				readln(monto);
		dia:= cant_dia;
			end;
	if( dia > mayor_ventas) then begin
		mayor_ventas:= dia;
	end;
		writeln('la cantidad de ventas del dia: ', i,' es de: ', cant_dia);
		cant_mes:=cant_mes+cant_dia;
	end;
	
	Writeln('El dia con mayor cantidad de ventas ', mayor_ventas);
	Writeln('La cantidad del mes es: ', cant_mes);
end.

Un local de ropa desea analizar las ventas realizadas en el último mes. Para ello se lee por cada día del mes,
los montos de las ventas realizadas. La lectura de montos para cada día finaliza cuando se lee el monto 0. Se
asume un mes de 31 días. Informar la cantidad de ventas por cada día, y el monto total acumulado en ventas
de todo el mes.
a. Modifique el ejercicio anterior para que además informe el día en el que se realizó la mayor cantidad
de ventas     program EJ9P1P2;
var 
	monto:real;
	dia:integer;
	max:integer;
	total:real;
	ventas:integer;
	p1:integer;
begin 
	max:= -1;
	total:= 0;
	ventas:= 0;

	for dia:= 1 to 31 do begin 
		readln(monto);
		while (monto <> 0) do begin 
			readln(monto);
			ventas:= ventas +1;
			total:= total + monto;
			
			if (ventas > max) then begin 
				max:= ventas;
				p1:= dia;
			end;
		end;
		writeln('ventas del dia', ventas);
	end;
	writeln('monto total', total);
	writeln('dia con mas ventas', p1);
end.
