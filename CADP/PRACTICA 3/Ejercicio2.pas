program EJ2P3;

type 
	casamiento = record
		dia: integer;
		mes: string;
		anio: integer;
		cantCasamientosVerano: integer;
		cantCasamientosPdias: integer;
	end;

procedure leer (var c:casamiento);
begin
	writeln('dia');
	readln(c.dia);
	writeln('mes');
	readln(c.mes);
	writeln('anio');
	readln(c.anio);
end;

procedure verano (var c:casamiento);
begin
	if (c.mes = 'enero') or (c.mes = 'marzo') or (c.mes = 'febrero') then begin
		c.cantCasamientosVerano:= c.cantCasamientosVerano +1
	end;
end;

procedure primerosD (var c:casamiento);
begin
	if (c.dia <= 10) then begin
		c.cantCasamientosPdias:= c.cantCasamientosPdias + 1;
	end;
end;

var
	c:casamiento;

begin
c.cantCasamientosVerano:= 0;
c.cantCasamientosPdias:= 0;
	while (c.anio <> 2020) do begin
		leer(c);	
		verano(c);
		primerosD(c);
	end;

	writeln('cantidad de casamientos de verano: ', c.cantCasamientosVerano);
	writeln('cantidad de casamientos en los primeros 10 dias: ', c.cantCasamientosPdias);
end.

