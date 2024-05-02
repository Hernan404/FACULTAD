program EJ11P4P1;
const 
	dimf = 200;
type 
	data = record 
		titulo:string;
		autor:string;
		cantMG:integer;
		cantCLicks:integer;
		cantComents:integer;
	end;

	vector = array [1..dimf] of data;

procedure inivector(var v:vector);
var 
	i:integer;
begin 
	for i:=1 to dimf do begin
		with r do begin  
			writeln('TITULO');
			readln(titulo);
			writeln('AUTOR'));
			readln(autor);
			writeln('CANTIDAD DE MEGUSTAS');
			readln(cantMG);
			writeln('CANTIDAD DE CLICKS');
			readln(cantCLicks);
			writeln('CANTIDAD DE COMENTARIOS');
			readln(cantComents);
		end;
	end;
end;

procedure mayor(v:vector; var max:integer; var puntoA:string);

begin 
	if (v[i].likes > max) then begin 
		max:= v[i].likes;
		puntoA:= v[i].titulo;
	end;
end;

procedure procesardatos(v:vector);
var 
	r:data;	max:integer; puntoB:integer; puntoC:integer;
	puntoA:string;
begin 
	max:= -1; puntoB:= 0; puntoA:='';
	
	for i:=1 to dimf do begin 
			mayor(max,v,puntoA);
			if (v[i].autor = 'Art Vandenlay') then 
				puntoB:= puntoB + v[i].cantMG;
		inivector(v);
	end;

	writeln('titulo de la foto mas vista: ', puntoA);
	writeln('cantidad total de megustas del art vandelay', putnoB);
	for i:=1 to dimf do 
		writeln('cantidad de comentarios recibidos para la foto ',v[i].titulo ,  ' : ',v[i].cantComents);
end;
var 
	r:data;
	v:vector;
	i:integer;
begin 
	inivector(v);
	procesardatos(v);
end.
