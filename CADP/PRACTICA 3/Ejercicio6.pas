program EJ6P3;

type
	stock=record
		marca:string;
		linea:string;
		cores:integer;
		velreloj:real;
		nano:integer;
		
		marca_cumple:string;
		linea_cumple:string;	
		
		max:integer;	
		
		cantProcesadores:integer;
		
		marca_cumple2:string;
		
		cantmulti:integer;
	end;
	
procedure leer (var s:stock);
begin
	readln(s.marca);
	readln(s.linea);
	readln(s.cores);
	readln(s.velreloj);
	readln(s.nano);
	s.cantProcesadores:= +1;
end;

procedure doscores (var s:stock);
begin
	if (s.cores > 2) and (s.nano >= 22) then begin
		s.marca_cumple:= s.marca;
		s.linea_cumple:= s.linea;
	end;
end;

procedure mayor (var s:stock);
begin
	if (s.nano > 14) and (s.cantProcesadores > s.max) then begin
		s.max:=s.cantProcesadores;
		s.marca_cumple2:= s.marca;
	end;
end;

procedure multi (var s:stock);
begin
	if (s.cores > 1) then begin 
		if (s.marca = 'intel') or (s.marca = 'AMD') then 
			if (s.velreloj > 2) then
				s.cantmulti:=s.cantmulti +1;
	end;
end;

var
	s:stock;
begin
	s.max:= -1;
	while (s.cores <> 0) do begin
		leer(s);
		doscores(s);
		mayor(s);
		multi(s);
	end;
	
	writeln('marca: ', s.marca_cumple, 'linea: ', s.linea_cumple);
	writeln('marca con mayor: ', s.marca_cumple2);
	writeln('cantidad de procesadores multicore: ', s.cantmulti); 

end.
