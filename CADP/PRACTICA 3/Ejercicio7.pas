program EJ7P3;

type
	universidad = record
		nombre:string;
		uni:string;
		cantInves:integer;
		cantbecarios:integer;
		
		cantcentros:integer;
		
		mayorcantidad:string;
		
		centrosmenores:string;
		
		max:integer;
		min:integer;
	end;

procedure leer (var u:universidad);
begin
	readln(u.nombre);
	u.cantcentros:= u.cantcentros +1;
	readln(u.uni);
	readln(u.cantInves);
	readln(u.cantbecarios);
end;

procedure mayor (var u:universidad);
begin
	if (u.cantInves > u.max) then
		u.max:= u.cantInves;
		u.mayorcantidad:= u.uni;
end;

procedure menor (var u:universidad);
begin
	if (u.cantbecarios < u.min) then begin
		u.min:=u.cantbecarios;
		u.centrosmenores:= u.nombre;
	end;
end;



var
	u:universidad;
begin
	u.max:= -1;
	u.min:= 9999;
	while (u.cantInves <> 0) do begin
		leer(u);
		mayor(u);
		menor(u);
	end;
	
writeln('cantidad total de centros: ', u.cantcentros);
writeln('mayor: ',u.mayorcantidad);
writeln('menor: ', u.centrosmenores);
end.
