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
