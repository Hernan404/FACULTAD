 El colectivo de fotógrafos ArgenPics desea conocer los gustos de sus seguidores en las redes sociales.
Para ello, para cada una de las 200 fotos publicadas en su página de Facebook, cuenta con la siguiente
información: título de la foto, el autor de la foto, cantidad de Me gusta, cantidad de clics y cantidad de
comentarios de usuarios. Realizar un programa que lea y almacene esta información. Una vez
finalizada la lectura, el programa debe procesar los datos e informar:
a. Título de la foto más vista (la que posee mayor cantidad de clics).
b. Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay”.
c. Cantidad de comentarios recibidos para cada una de las fotos publicadas en esa página
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
			writeln('TITULO');
			readln(v[i].titulo);
			writeln('AUTOR');
			readln(v[i].autor);
			writeln('CANTIDAD DE MEGUSTAS');
			readln(v[i].cantMG);
			writeln('CANTIDAD DE CLICKS');
			readln(v[i].cantCLicks);
			writeln('CANTIDAD DE COMENTARIOS');
			readln(v[i].cantComents);
		end;
	end;

procedure mayor(v:vector; var max:integer; var puntoA:string);
var
	i:integer;
begin 
	for i:=1 to dimf do begin
		if (v[i].cantCLicks > max) then begin 
			max:= v[i].cantCLicks;
			puntoA:= v[i].titulo;
		end;
	end;
end;

procedure procesardatos(v:vector);
var 
	max:integer; puntoB:integer;
	puntoA:string;
	i:integer;
begin 
	max:= -1; puntoB:= 0; puntoA:='';
	
	for i:=1 to dimf do begin 
			mayor(v,max,puntoA);
			if (v[i].autor = 'Art Vandenlay') then 
				puntoB:= puntoB + v[i].cantMG;
	end;

	writeln('titulo de la foto mas vista: ', puntoA);
	writeln('cantidad total de megustas del Art Vandenlay', puntoB);
	for i:=1 to dimf do 
		writeln('cantidad de comentarios recibidos para la foto ',v[i].titulo ,  ' : ',v[i].cantComents);
end;
var 
	v:vector;
begin 
	inivector(v);
	procesardatos(v);
end.
