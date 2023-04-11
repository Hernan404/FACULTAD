program EJ4P3;

type
	telefono = record
		numero:integer;
		cantMin:real;
		cantMB:real;
		
		
		minutos:real;
		MBs:real;
		
		Total_MB: real;
		Total_minutos: real;
	end;

procedure leer (var t:telefono);
begin
	writeln('numero');
	readln(t.numero);
	writeln('cantidad de minutos');
	readln(t.cantMin);
	writeln('cantidad de MBs');
	readln(t.cantMB);
end;

procedure consumido (var t:telefono);
begin
	t.Total_minutos:= 3.40 * t.cantMin;
	t.Total_MB:= 1.35 * t.cantMB;
end;

var
	t:telefono;
	i:integer;
begin
	{t.minutos:= 3.40;
	t.MBs:= 1.35;}
	for i:=1 to 2 do begin
		
		leer(t);
		consumido(t);
		
	writeln('cantida de minutos consumidos: ', t.Total_minutos);
	writeln('cantidad de MBs consumidso: ', t.Total_MB);	
		
	end;
	
end.
