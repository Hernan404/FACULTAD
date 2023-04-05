
program EJ14P2P2;
type
	zona=1..4;
	cadena20=string[20];
procedure leer (var zona:integer; var cant_hectareas:integer; var localidad:string);
begin
	readln(localidad);
	readln(cant_hectareas);
	readln(zona);
end;

procedure economia (var rendimientoF,zona,rendimiento_economico, cant_hectareas:integer);
begin
	if (zona = 1) then
		rendimientoF:= cant_hectareas*320*6;
	if (zona = 2) then
		rendimientoF:= cant_hectareas*320*2;
	if (zona = 3) then
		rendimientoF:= cant_hectareas*320*1;
		
		rendimiento_economico:= rendimientoF;
end;

procedure Tres (var rendimiento_economico,contador_tres:integer; localidad:string);
begin
	if (localidad = 'tres de febrero') and (rendimiento_economico > 1000) then begin
			contador_tres:=contador_tres +1
	end;
	
end;

procedure mayores (var rendimiento_economico,max:integer; var mayor_rendimiento:string; var localidad:string);
begin
	if (rendimiento_economico > max) then begin
		mayor_rendimiento:= localidad;
		max:= rendimiento_economico;
	end;
end;

procedure menores (var rendimiento_economico,min:integer; var menor_rendimiento,localidad:string);
begin
	if (rendimiento_economico < min) then begin
		menor_rendimiento:= localidad;
		min:= rendimiento_economico;
	end;
end;

var
	localidad:string;
	cant_hectareas:integer;
	 
	rendimiento:integer;
	
	contador_tres:integer;
	
	rendimiento_economico:integer;
	
	
	
	rendimiento_oficial:integer;
	
	
	mayor_rendimiento:string;
	menor_rendimiento:string;
	
	
	max,min:integer;
	
	zona:integer;
	
	
begin
	max:= -1;
	min:= 9999;
	
	repeat
	
	leer(zona,cant_hectareas,localidad);
	economia(rendimiento,zona,rendimiento_economico, cant_hectareas);
	tres(rendimiento_economico,contador_tres,localidad);
	mayores(rendimiento_economico,max,mayor_rendimiento,localidad);
	menores(rendimiento_economico,min,menor_rendimiento,localidad);
	
	
	until localidad = 'saladillo';
	
	
	writeln('cantidad de campos tres de febr ', contador_tres);
	writeln('mayor rendimiento ', mayor_rendimiento);
	writeln('menor rendimiento ', menor_rendimiento);
	
	
	
end.
