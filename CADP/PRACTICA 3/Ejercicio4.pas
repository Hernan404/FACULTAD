
Una compañía de telefonía celular debe realizar la facturación mensual de sus 9300 clientes con planes de
consumo ilimitados (clientes que pagan por lo que consumen). Para cada cliente se conoce su código de
cliente y cantidad de líneas a su nombre. De cada línea se tiene el número de teléfono, la cantidad de minutos
consumidos y la cantidad de MB consumidos en el mes. Se pide implementar un programa que lea los datos
de los clientes de la compañía e informe el monto total a facturar para cada uno. Para ello, se requiere:
a. Realizar un módulo que lea la información de una línea de teléfono.
b. Realizar un módulo que reciba los datos de un cliente, lea la información de todas sus líneas (utilizando
el módulo desarrollado en el inciso a y retorne la cantidad total de minutos y la cantidad total de MB a
facturar del cliente.
Nota: para realizar los cálculos tener en cuenta que cada minuto cuesta $3,40 y cada MB consumido cuesta
$1,35.


program EJ4P3;
type 
	datos = record 
		codigo:integer;
		cant_lineas:integer;
		cant_min:real;
		cant_mb:real;
end;

procedure leer(var r:datos; var total_mb,total_min:real);
var 
	i:integer;
begin 
	writeln('CODIGO');
	readln(r.codigo);
	writeln('CANTIDAD DE LINEAS DE TELEFONO');
	readln(r.cant_lineas);
	
	for i:=1 to r.cant_lineas do begin 
		writeln('CANTIDAD DE MINUTOS');
		readln(r.cant_min);
		writeln('CANTIDAD DE MBs');
		readln(r.cant_mb);
  
		total_mb:= r.cant_mb + total_mb;
		total_min:= r.cant_min + total_min;
	end;
end;

var 
	r:datos;
	i:integer;
	total_mb,total_min:real;
begin 
	
	for i:=1 to 9300 do begin 
		leer(r,total_mb,total_min);
	end;
	
	writeln('CANTIDAD DE MBs TOTAL A FACTURAR: ', total_mb * 1.35:2:0,'$');
	writeln('CANTIDAD DE MINUTOS TOTAL A FACTURAR: ', total_min * 3.40:2:0,'$');
end.
