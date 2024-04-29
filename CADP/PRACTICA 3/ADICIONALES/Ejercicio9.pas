Realizar un programa que lea información de los candidatos ganadores de las últimas elecciones a intendente
de la provincia de Buenos Aires. Para cada candidato se lee: localidad, apellido del candidato, cantidad de votos
obtenidos y cantidad de votantes de la localidad. La lectura finaliza al leer la localidad ‘Zárate’, que debe
procesarse. Informar:
● El intendente que obtuvo la mayor cantidad de votos en la elección.
● El intendente que obtuvo el mayor porcentaje de votos de la elección

program EJ9P3;
type 
	data = record 
		localidad:string;
		apellido:string;
		cant_votos:integer;
		cant_localidad:integer;
	end;

procedure leer(var r:data);
begin 
	with r do begin 
		writeln('LOCALIDAD');
		readln(localidad);
		writeln('APELLIDO');
		readln(apellido);
		writeln('CANTIDAD DE VOTOS');
		readln(cant_votos);
		writeln('CANTIDAD DE VOTOS POR LOCALIDAD');
		readln(cant_localidad);
	end;
end;

procedure procesardatos (var r:data);
var 
	max:integer; a1,a2:string; porce:real; maxp:real;
begin 
	max:= -1; a1:= ''; a2:=''; porce:= 0; maxp:= -1;

	repeat 
		if (r.cant_votos > max) then begin 
			max:= r.cant_votos;
			a1:= r.apellido;
		end;
		porce:= r.cant_votos / r.cant_localidad * 100;
		if (porce > maxp) then begin 
			maxp:= porce;
			a2:= r.apellido;
		end;
		leer(r);
	until (r.localidad = 'zarate');
	writeln('El intendente que obtuvo la mayor cantidad de votos en la elección: ', a1);
	writeln('El intendente que obtuvo el mayor porcentaje de votos de la elección: ', a2);
end;

var 
	r:data;
begin 
	leer(r);
	procesardatos(r);
end.
