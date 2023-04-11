program EJ3P3;

type
	escuela = record
		codigo:integer;
		nombre:string;
		cantDoc:integer;
		cantAlu:integer;
		localidad:string;
		
		
	end;
	cumple = record
		cumpleUNESCO: integer;
		relaciones: real;
		
		nombreR1:string;
		nombreR2:string;
		
		codigoR1:integer;
		codigoR2:integer;
	
		CUE1:integer;
		CUE2:integer;
	end;
	
procedure leer (var e:escuela);
begin
	writeln('codigo');
	readln(e.codigo);
	writeln('nombre de establecimiento');
	readln(e.nombre);
	writeln('cantidad de docentes');
	readln(e.cantDoc);
	writeln('cantidad de alumnos');
	readln(e.cantAlu);
	writeln('localidad');
	readln(e.localidad);
end;

procedure unesco(var e:escuela; var c:cumple);
begin
	if (e.localidad = 'la plata') and (e.cantAlu <= 23) and (e.cantAlu = 1) then begin
		c.cumpleUNESCO:= c.cumpleUNESCO +1;
	end;
end;

procedure relacion (var e:escuela; var c:cumple);
begin
	c.relaciones:= e.cantAlu/e.cantDoc;
	
	if (c.relaciones > c.CUE1) then
		c.codigoR1:= e.codigo;
		c.nombreR1:= e.nombre;
		
		if (c.relaciones > c.CUE2) then
			c.codigoR2:= e.codigo;
			c.nombreR2:= e.nombre;
end;


var
	c:cumple;
	e:escuela;
	i:integer;
	
begin
	c.CUE1:= -1;
	c.CUE2:= -1;
	
	for i:=1 to 5 do begin
	leer(e);
	unesco(e,c);
	relacion(e,c);
	end;

	writeln ('escuelas que cumplen unesco: ', c.cumpleUNESCO);
	writeln ('primera escuela con mejor relacion: ', c.codigoR1, c.nombreR1, 'segunda escuela: ', c.codigoR2, c.nombreR2);
end.
