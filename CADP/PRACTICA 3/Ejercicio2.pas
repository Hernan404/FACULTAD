Implementar un programa que lea la fecha de todos los casamientos realizados en 2019. La lectura
finaliza al ingresar el año 2020, que no debe procesarse, e informe la cantidad de casamientos
realizados durante los meses de verano (enero, febrero y marzo) y la cantidad de casamientos
realizados en los primeros 10 días de cada mes. Nota: utilizar el módulo realizado en b) para la lectura
de fecha.

program EJ2P3;
type 
	fecha = record
		dia:integer;
		mes:1..12;
		anio:integer;
	end;

procedure leer(var r:fecha);
begin
	with r do begin 
		writeln('DIA');
		readln(dia);
		writeln('MES');
		readln(mes);
		writeln('ANIO');
		readln(anio);
	end;
end;

procedure proceso (r:fecha; var cantv,cantdiez:integer);
begin 
	if (r.mes = 1) or (r.mes = 2) or (r.mes = 3) then 
		cantv:=cantv +1;
	if (r.dia < 10) then 
		cantdiez:= cantdiez +1;
end;
var 
	r:fecha;
	cantv,cantdiez:integer;
begin 
	cantv:=0;
	cantdiez:=0;
	
	leer(r);
	while(r.anio <> 2020) do begin 
		proceso(r,cantv,cantdiez);
		leer(r);
	end;
	writeln('cantidad de casamientos en verano: ',cantv);
	writeln('cantidad de casamientos en los primeros 10 dias: ',cantdiez);
end.
