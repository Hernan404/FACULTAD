Un local de ropa desea analizar las ventas realizadas en el último mes. Para ello se lee por cada día del mes,
los montos de las ventas realizadas. La lectura de montos para cada día finaliza cuando se lee el monto 0. Se
asume un mes de 31 días. Informar la cantidad de ventas por cada día, y el monto total acumulado en ventas
de todo el mes.
a. Modifique el ejercicio anterior para que además informe el día en el que se realizó la mayor cantidad
de ventas  

program EJ8P1P2;
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
	     writeln('INGRESE MONTO');
	     readln(monto);
	     while (monto <> 0) do begin 
		    ventas:= ventas +1;
		    total:= total + monto;
			
		  if (ventas > max) then begin 
		      max:= ventas;
		      p1:= dia;
		  end;
    
		writeln('INGRESE MONTO');
		readln(monto);
  
	     end;
	  writeln('ventas del dia: ', ventas);
	  ventas:=0;
	end;
	writeln('monto total: ', total:2:0);
	writeln('dia con mas ventas: ', p1);
end.
